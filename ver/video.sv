module video (
  I_clock,
  I_reset,
  O_vid_clock,
  O_vid_rise,
  O_vid_blank,
  O_vid_hsync,
  O_vid_vsync,
  O_vid_red,
  O_vid_green,
  O_vid_blue,

  I_host_addr,
  I_host_wren,
  I_host_rden,
  I_host_data,
  O_host_data,
  O_host_nmi,

  O_vid_addr,
  O_vid_wren,
  I_vid_data,
  O_vid_data);

/* I/O ports
 *****************************************/

  input   wire        I_clock ;
  input   wire        I_reset ;

  output  wire        O_vid_clock ;
  output  wire        O_vid_rise  ;
  output  wire        O_vid_blank ;
  output  wire        O_vid_hsync ;
  output  wire        O_vid_vsync ;
  output  wire[7:0]   O_vid_red   ;
  output  wire[7:0]   O_vid_green ;
  output  wire[7:0]   O_vid_blue  ;

  input   wire[2:0]   I_host_addr ;
  input   wire        I_host_wren ;
  input   wire        I_host_rden ;
  input   wire[7:0]   I_host_data ;
  output  bit[7:0]    O_host_data ;
  output  bit         O_host_nmi  ;

  input   wire[7:0]   I_vid_data ;
  output  bit[7:0]    O_vid_data ;
  output  bit[13:0]   O_vid_addr ;
  output  bit         O_vid_wren ;

/* Clock divider logic
 *****************************************/

  bit[1:0]  clkdiv      ;
  bit       last_clk    ;
  assign    O_vid_clock = ~clkdiv[1];
  assign    O_vid_rise  = ~last_clk & O_vid_clock;

  always_ff @(posedge I_clock,
              negedge I_reset)
  begin
    if (~I_reset) begin
      clkdiv    <= 2'd0;
      last_clk  <= 1'b0;
    end else begin
      last_clk  <= O_vid_clock;
      clkdiv    <= clkdiv + 2'd1;
    end
  end

/* Host bus edge logic
 *****************************************/

  bit   last_host_rden;
  bit   last_host_wren;

  wire  I_host_rden_rise = ~last_host_rden & I_host_rden;
  wire  I_host_rden_fall = last_host_rden & ~I_host_rden;

  wire  I_host_wren_rise = ~last_host_wren & I_host_wren;
  wire  I_host_wren_fall = last_host_wren & ~I_host_wren;

  always_ff @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset) begin
      last_host_rden <= 1'b0;
      last_host_wren <= 1'b0;
    end else begin
      last_host_rden <= I_host_rden;
      last_host_wren <= I_host_wren;
    end
  end

/* Debug logic
 *****************************************/

  bit[31:0] curr_debug_frames;
  bit[31:0] next_debug_frames;

  always_ff @(posedge I_clock)
  begin
    if (O_vid_rise) begin
      curr_debug_frames <= next_debug_frames;
    end
  end

/* Vertical and Horizontal counter logic
 *****************************************/

  bit[15:0] curr_count_y;
  bit[15:0] curr_count_x;
  bit[15:0] next_count_y;
  bit[15:0] next_count_x;

  assign O_vid_hsync = curr_count_x < 16'd275 || curr_count_x > 16'd300;
  assign O_vid_vsync = curr_count_y < 16'd242 || curr_count_y > 16'd244;
  assign O_vid_blank = curr_count_x > 16'd000 && curr_count_x < 16'd257 && curr_count_y < 16'd240;

  always_ff @(posedge I_clock)
  if (O_vid_rise) begin
    curr_count_y <= next_count_y;
    curr_count_x <= next_count_x;
  end

  always_comb
  begin
    // Debug logic
    next_debug_frames = curr_debug_frames;
    ////////////////
    next_count_y = 16'd0;
    next_count_x = 16'd0;
    if (I_reset) begin
      next_count_x = curr_count_x + 16'd1;
      next_count_y = curr_count_y;
      if (curr_count_x == 16'd340)
      begin
        next_count_y = next_count_y + 16'd1;
        next_count_x = 16'd0;
        if (curr_count_y == 16'd261)
        begin
          next_count_y = 16'd0;
          // Debug logic
          next_debug_frames = curr_debug_frames + 32'd1;
          //////////////
        end
      end
    end
  end

/* Register latch behaviour
 *****************************************/

  bit[7:0] curr_latch_value;
  bit[7:0] next_latch_value;

  always_ff @(posedge I_clock)
    curr_latch_value <= next_latch_value;

  always_comb
  begin
    next_latch_value = 8'd0;
    if (I_reset) begin
      next_latch_value = I_host_data;
      if (I_host_wren)
        next_latch_value = O_host_data;
    end
  end

/* Register decode logic
 *****************************************/

  bit[7:0]  reg_select;
  wire      reg_select_control  = reg_select [0];
  wire      reg_select_mask     = reg_select [1];
  wire      reg_select_status   = reg_select [2];
  wire      reg_select_oam_addr = reg_select [3];
  wire      reg_select_oam_data = reg_select [4];
  wire      reg_select_scroll   = reg_select [5];
  wire      reg_select_vid_addr = reg_select [6];
  wire      reg_select_vid_data = reg_select [7];

  always_comb
  begin
    reg_select = 8'd0;
    unique case (I_host_addr[2:0])
    3'd0 : reg_select = 8'b00000001;
    3'd1 : reg_select = 8'b00000010;
    3'd2 : reg_select = 8'b00000100;
    3'd3 : reg_select = 8'b00001000;
    3'd4 : reg_select = 8'b00010000;
    3'd5 : reg_select = 8'b00100000;
    3'd6 : reg_select = 8'b01000000;
    3'd7 : reg_select = 8'b10000000;
    endcase
  end

/* Mask register
 **********************************/

  typedef struct packed {
    bit emphasize_blue;
    bit emphasize_green;
    bit emphasize_red;
    bit show_sprites;
    bit show_background;
    bit show_left_sprites;
    bit show_left_background;
    bit grayscale;
  } reg_mask_t;

  reg_mask_t curr_mask;
  reg_mask_t next_mask;

  always_ff @(posedge I_clock)
  begin
    curr_mask <= next_mask;
  end

  always_comb
  begin
    next_mask = curr_mask;
    if (I_host_wren & reg_select_mask)
      next_mask = I_host_data;
  end

/* Control register
 **********************************/

  typedef struct packed {
    bit       enable_nmi;
    bit       master_or_slave;
    bit       sprite_size;
    bit       background_base;
    bit       sprite_8x8_base;
    bit       increment;
    bit[1:0]  nametable;
  } reg_control_t;

  reg_control_t curr_control;
  reg_control_t next_control;

  always_ff @(posedge I_clock)
  begin
    curr_control <= next_control;
  end

  always_comb
  begin
    next_control = curr_control;
    if (I_host_wren & reg_select_control)
      next_control = I_host_data;
  end

/* Palette color lookup logic
 ***********************************************/

  bit[ 5:0] color_index;
  bit[23:0] color_table [0:63];

  initial color_table = '{
    24'h666666, 24'h002A88, 24'h1412A7, 24'h3B00A4, 24'h5C007E, 24'h6E0040, 24'h6C0600, 24'h561D00,
    24'h333500, 24'h0B4800, 24'h005200, 24'h004F08, 24'h00404D, 24'h000000, 24'h000000, 24'h000000,
    24'hADADAD, 24'h155FD9, 24'h4240FF, 24'h7527FE, 24'hA01ACC, 24'hB71E7B, 24'hB53120, 24'h994E00,
    24'h6B6D00, 24'h388700, 24'h0C9300, 24'h008F32, 24'h007C8D, 24'h000000, 24'h000000, 24'h000000,
    24'hFFFEFF, 24'h64B0FF, 24'h9290FF, 24'hC676FF, 24'hF36AFF, 24'hFE6ECC, 24'hFE8170, 24'hEA9E22,
    24'hBCBE00, 24'h88D800, 24'h5CE430, 24'h45E082, 24'h48CDDE, 24'h4F4F4F, 24'h000000, 24'h000000,
    24'hFFFEFF, 24'hC0DFFF, 24'hD3D2FF, 24'hE8C8FF, 24'hFBC2FF, 24'hFEC4EA, 24'hFECCC5, 24'hF7D8A5,
    24'hE4E594, 24'hCFEF96, 24'hBDF4AB, 24'hB3F3CC, 24'hB5EBF2, 24'hB8B8B8, 24'h000000, 24'h000000
  };

  assign O_vid_red   = color_table[color_index][23:16];
  assign O_vid_green = color_table[color_index][15: 8];
  assign O_vid_blue  = color_table[color_index][ 7: 0];

/* Palette RAM
 *****************************************/

  bit[4:0] color_final;
  bit[4:0] palette_addr;
  bit[5:0] palette_data;

  (* ramstyle = "no_rw_check, M10K" *)
  bit[5:0] palette_bits [0:31];

  always_ff @(posedge I_clock) begin
    color_index <= palette_bits[color_final];
  end

  always_ff @(posedge I_clock) begin
    palette_data <= palette_bits[palette_addr];
    if (reg_select_vid_data & I_host_wren_rise & vi_palette_access)
      palette_bits[palette_addr] <= I_host_data[5:0];
  end

  always_comb begin
    palette_addr = curr_video_addr_v[4:0];
    if (~|curr_video_addr_v[1:0])
      palette_addr[4] = 1'b0;
  end

/* Status register and NMI logic
 ***********************************************/

  bit curr_vertical_blank_bit  ;
  bit curr_sprite_zero_hit_bit ;
  bit curr_sprite_overflow_bit ;

  bit next_vertical_blank_bit  ;
  bit next_sprite_zero_hit_bit ;
  bit next_sprite_overflow_bit ;

  bit set_sprite_zero_hit ;
  bit set_sprite_overflow ;

  assign O_host_nmi = ~(curr_control.enable_nmi & curr_vertical_blank_bit);

  always_ff @(posedge I_clock)
  begin

    if (O_vid_rise)
    begin
      curr_vertical_blank_bit  <= next_vertical_blank_bit  ;
      curr_sprite_zero_hit_bit <= next_sprite_zero_hit_bit ;
      curr_sprite_overflow_bit <= next_sprite_overflow_bit ;
    end

    if (I_host_rden_fall & reg_select_status)
      curr_vertical_blank_bit <= 1'b0;
  end

  always_comb
  begin
    next_vertical_blank_bit  = curr_vertical_blank_bit  ;
    next_sprite_zero_hit_bit = curr_sprite_zero_hit_bit | set_sprite_zero_hit ;
    next_sprite_overflow_bit = curr_sprite_overflow_bit | set_sprite_overflow ;

    if (curr_count_x == 16'd0)
    begin
      if (curr_count_y == 16'd241)
        next_vertical_blank_bit = 1'b1;

      if (curr_count_y == 16'd261)
      begin
        next_sprite_overflow_bit = 1'b0;
        next_sprite_zero_hit_bit = 1'b0;
        next_vertical_blank_bit  = 1'b0;
      end
    end
  end

/* Register read logic
 ***********************************************/

  always_comb
  begin
    O_host_data = curr_latch_value;
    unique case (I_host_addr[2:0])
      // PPU STATUS
      3'd2 : O_host_data[7:5] = {
        curr_vertical_blank_bit,
        curr_sprite_zero_hit_bit,
        curr_sprite_overflow_bit
      };

      // OAM DATA
      3'd4 : O_host_data = pri_oam_data;

      // PPU DATA
      3'd7 : begin
        O_host_data[5:0] = palette_data;
        if (~vi_palette_access)
          O_host_data = curr_video_data;
      end

      default:;
    endcase
  end

/* Video address and scroll register
 ***********************************************/

  typedef struct packed
  {
    bit[2:0] y_fine;

    struct packed
    {
      bit y;
      bit x;
    } nametable;

    bit[4:0] y_coarse;
    bit[4:0] x_coarse;

  } vi_addr_t;

  vi_addr_t       curr_video_addr_v   ;
  vi_addr_t       curr_video_addr_t   ;
  bit[2:0]        curr_video_fine_x   ;
  bit[7:0]        curr_video_data     ;
  bit[7:0]        curr_tile_index     ;
  bit[1:0]        curr_tile_attrib    ;
  bit[7:0]        curr_tile_bits_lo   ;
  bit[7:0]        curr_tile_bits_hi   ;
  bit[15:0][3:0]  curr_tile_shifter   ;  

  vi_addr_t       next_video_addr_v   ;
  vi_addr_t       next_video_addr_t   ;
  bit[2:0]        next_video_fine_x   ;
  bit[7:0]        next_video_data     ;
  bit[7:0]        next_tile_index     ;
  bit[1:0]        next_tile_attrib    ;
  bit[7:0]        next_tile_bits_lo   ;
  bit[7:0]        next_tile_bits_hi   ;
  bit[15:0][3:0]  next_tile_shifter   ;


  bit[7:0][3:0]   curr_sprite_pattern [0:7] ;  
  bit[7:0]        curr_sprite_coord_x [0:7] ;
  bit             curr_sprite_priority [0:7 ];

  bit[7:0][3:0]   next_sprite_pattern [0:7] ;  
  bit[7:0]        next_sprite_coord_x [0:7] ;
  bit             next_sprite_priority [0:7] ;

  bit             curr_video_addr_w   ;

  bit[3:0]        vi_tile_line        ;
  bit[7:0]        vi_tile_index       ;
  bit             vi_tile_base        ;

  wire[14:0]      vi_addr_increment   = curr_control.increment ? 15'd32 : 15'd1;
  wire            vi_palette_access   = curr_video_addr_v[13:8] == 6'b111111;
  wire            vi_render_enabled   = curr_mask.show_sprites
                                      | curr_mask.show_background;
  wire            vi_prerender_line   = curr_count_y > 16'd260;
  wire            vi_rendering_line   = curr_count_y < 16'd240;
  wire            vi_active_line      = (vi_prerender_line | vi_rendering_line) ;
  wire            vi_active_sprites_x = ((curr_count_x > 16'd256) & (curr_count_x < 16'd321));
  wire            vi_active_backgnd_x = ((curr_count_x > 16'd000) & (curr_count_x < 16'd257))
                                      | ((curr_count_x > 16'd320) & (curr_count_x < 16'd337));
  wire            vi_active_sprites   = vi_active_line & vi_active_sprites_x;
  wire            vi_active_backgnd   = vi_active_line & vi_active_backgnd_x;

  wire[3:0][1:0]  vi_vid_data_4x2     = I_vid_data;

  assign          O_vid_data          = I_host_data;
  assign          O_vid_wren          = reg_select_vid_data & I_host_wren & ~vi_palette_access;
  assign          color_background    = curr_tile_shifter[{1'b0, curr_video_fine_x}];


  always_ff @(posedge I_clock)
  begin
    if (O_vid_rise)
    begin
      /* Do normal clocked logic */
      curr_video_addr_v     <= next_video_addr_v    ;
      curr_video_addr_t     <= next_video_addr_t    ;
      curr_video_fine_x     <= next_video_fine_x    ;
      curr_tile_index       <= next_tile_index      ;
      curr_tile_attrib      <= next_tile_attrib     ;
      curr_tile_bits_lo     <= next_tile_bits_lo    ;
      curr_tile_bits_hi     <= next_tile_bits_hi    ;
      curr_tile_shifter     <= next_tile_shifter    ;

      curr_sprite_pattern   <= next_sprite_pattern  ; 
      curr_sprite_coord_x   <= next_sprite_coord_x  ;
      curr_sprite_priority  <= next_sprite_priority ;
    end

    if (reg_select_vid_data & I_host_rden_rise)
    begin
      curr_video_data <= next_video_data;
      next_video_data <= I_vid_data;
    end

  /* Clear write latch, on PPUSTATUS read */
    if (reg_select_status & I_host_rden_rise)
      curr_video_addr_w <= 1'b0;

  /* Flip write latch, on writes to PPUADDR and PPUSCROLL */
    if ((reg_select_vid_addr | reg_select_scroll) & I_host_wren_rise)
      curr_video_addr_w <= ~curr_video_addr_w;

  /* Write PPUADDR */
    if (reg_select_vid_addr & I_host_wren_rise)
    begin
      if (curr_video_addr_w) begin
      /* When write latch is 1, write LSB of PPUADDR and set v = t */
        curr_video_addr_t [ 7:0] <= I_host_data[7:0];
        curr_video_addr_v [ 7:0] <= I_host_data[7:0];
        curr_video_addr_v [14:8] <= curr_video_addr_t [14:8];
      end else begin
      /* When wirte latch is 0, write MSB of PPUADDR */
        curr_video_addr_t [14:8] <= {1'b0, I_host_data[5:0]};
      end
    end

  /* Write PPUCONTROL nametable bits into video address */
    if (reg_select_control & I_host_wren_rise)
      curr_video_addr_t.nametable <= I_host_data[1:0];

  /* Write PPUSCROLL */
    if (reg_select_scroll & I_host_wren_rise)
    begin
      if (curr_video_addr_w) begin
      /* When write latch is 1, write scroll y */
        curr_video_addr_t.y_coarse <= I_host_data[7:3];
        curr_video_addr_t.y_fine   <= I_host_data[2:0];
      end else begin
      /* When write latch is 0, write scroll x */
        curr_video_addr_t.x_coarse <= I_host_data[7:3];
        curr_video_fine_x          <= I_host_data[2:0];
      end
    end

  /* Incrment video addr on write to or read from */
    if (reg_select_vid_data & (I_host_wren_fall | I_host_rden_fall))
      curr_video_addr_v <= curr_video_addr_v + vi_addr_increment;

  end

  always_comb
  begin
    /* Reset render state */
    next_video_addr_t = 15'd0;
    next_video_addr_v = 15'd0;
    next_video_fine_x = 3'd0;
    next_tile_index   = 8'd0;
    next_tile_attrib  = 2'd0;
    next_tile_bits_lo = 8'd0;
    next_tile_bits_hi = 8'd0;
    next_tile_shifter = 64'd0;

    /* Reset fetch state */
    vi_tile_index     = 8'd0;
    vi_tile_base      = 1'd0;
    vi_tile_line      = 4'd0;

    /* Reset sprite state for next line */
    for (integer i = 0; i < 8; ++i)
    begin
        next_sprite_pattern  [i] = 32'd0; 
        next_sprite_coord_x  [i] =  8'd0;
        next_sprite_priority [i] =  1'd0;
    end


    /* Default the video address */
    O_vid_addr = curr_video_addr_v[13:0];

    if (I_reset)
    begin
    /* Hold video address registers*/
      next_video_addr_t = curr_video_addr_t;
      next_video_addr_v = curr_video_addr_v;
      next_video_fine_x = curr_video_fine_x;

    /* Hold tile registers */
      next_tile_index   = curr_tile_index;
      next_tile_attrib  = curr_tile_attrib;
      next_tile_bits_lo = curr_tile_bits_lo;
      next_tile_bits_hi = curr_tile_bits_hi;
      next_tile_shifter = curr_tile_shifter;

    /* Setup tile fetch for background */
      vi_tile_index = curr_tile_index;
      vi_tile_base  = curr_control.background_base;
      vi_tile_line  = {1'b0, curr_video_addr_v.y_fine};

    /* Hold sprite registers */
      for (integer i = 0; i < 8; ++i)
      begin
          next_sprite_pattern  [i] = curr_sprite_pattern  [i] ;
          next_sprite_coord_x  [i] = curr_sprite_coord_x  [i] ;
          next_sprite_priority [i] = curr_sprite_priority [i] ;
      end


    /* Setup tile fetch for sprites */
      if (vi_active_sprites)
      begin        
        if (curr_control.sprite_size)
        begin
          vi_tile_base  = sprite_props.tile[0] ;
          vi_tile_index = {sprite_props.tile[7:1], sprite_offset_y[3]} ;
          vi_tile_line  = {1'b0, sprite_offset_y[2:0]} ;
        end else
        begin
          vi_tile_base  = curr_control.sprite_8x8_base;          
          vi_tile_index = sprite_props.tile;  
          vi_tile_line  = sprite_offset_y ;
        end
      end

      if (vi_render_enabled)
      begin
        if (vi_active_backgnd | vi_active_sprites)
        begin
        /* Shift out a single background pixel */
          next_tile_shifter[15:0] = {4'b0000, curr_tile_shifter[15:1]};

        /* Generate data fetch addresses */
          unique case (curr_count_x[2:0])
          3'd1, 3'd2 : O_vid_addr = { 2'h2, curr_video_addr_v[11:0] };
          3'd3, 3'd4 : O_vid_addr = { 2'h2, curr_video_addr_v.nametable, 4'hF, curr_video_addr_v.y_coarse[4:2], curr_video_addr_v.x_coarse[4:2] };
          3'd5, 3'd6 : O_vid_addr = { 1'b0, vi_tile_base, vi_tile_index, vi_tile_line };
          3'd7, 3'd0 : O_vid_addr = { 1'b0, vi_tile_base, vi_tile_index, vi_tile_line } + 14'd8;
          default: ;
          endcase

          /* Grab the needed data bits */
          unique case (curr_count_x[2:0])
          3'd2  : next_tile_index   = I_vid_data;
          3'd4  : next_tile_attrib  = vi_vid_data_4x2 [{
                    curr_video_addr_v.y_coarse[1],
                    curr_video_addr_v.x_coarse[1]
                  }];
          3'd6  : next_tile_bits_lo = I_vid_data; // Fetch tile low
          3'd0  : next_tile_bits_hi = I_vid_data; // Fetch tile high
          default: ;
          endcase

          /* take attribute from active sprite */
          if (vi_active_sprites)
            next_tile_attrib = sprite_props.palette;

          if (curr_count_x[2:0] == 3'd0)
          begin
            if (~vi_active_sprites)
            begin
          /* Transfer tile and attribute bits into shift register */
              for (integer i = 0; i < 8; ++i)
              begin
                next_tile_shifter[15 - i] = {
                  curr_tile_attrib,
                  next_tile_bits_hi [i],
                  curr_tile_bits_lo [i]
                };
              end
            end else 
            begin
              /* Transfer sprite attributes into sprite registers */
              next_sprite_priority  [sprite_fetch_idx] = sprite_props.prio;
              next_sprite_coord_x   [sprite_fetch_idx] = sprite_props.coord_x;

              /* Transfer sprite patterns into sprite registers */
              for (integer i = 0; i < 8; ++i)
              begin
                next_sprite_pattern [sprite_fetch_idx][sprite_props.flip_x ? (7 - i) : i] =  
                {
                  curr_tile_attrib,
                  next_tile_bits_hi [i],
                  curr_tile_bits_lo [i]
                };
              end              
            end
          end
        end

        /* Scrolling video address update
        **************************************************/

        /* Increment horizontal */
        if (vi_active_backgnd & (curr_count_x[2:0] == 3'd0))
        begin
          next_video_addr_v.x_coarse = curr_video_addr_v.x_coarse + 5'd1;
          if (curr_video_addr_v.x_coarse == 5'd31)
          begin
            next_video_addr_v.x_coarse = 5'd0;
            next_video_addr_v.nametable.x = ~curr_video_addr_v.nametable.x;
          end
        end

        /* Increment vertical */
        if (curr_count_x == 16'd256)
        begin
          next_video_addr_v.y_coarse = curr_video_addr_v.y_coarse ;
          next_video_addr_v.y_fine = curr_video_addr_v.y_fine + 3'd1;
          if (curr_video_addr_v.y_fine == 3'd7)
          begin
            next_video_addr_v.y_coarse = curr_video_addr_v.y_coarse + 5'd1;
            next_video_addr_v.y_fine = 3'd0;
            if (curr_video_addr_v.y_coarse == 5'd29)
            begin
              next_video_addr_v.y_coarse = 5'd0;
              next_video_addr_v.nametable.y = ~curr_video_addr_v.nametable.y;
            end
          end
        end

        /* Assign horizontal scroll position */
        if (curr_count_x == 16'd257)
        begin
          next_video_addr_v.nametable.x = curr_video_addr_t.nametable.x ;
          next_video_addr_v.x_coarse    = curr_video_addr_t.x_coarse    ;
        end

        /* Assign vertical scroll position */
        if ((curr_count_x >= 16'd280) & (curr_count_x <= 16'd304) & vi_prerender_line)
        begin
          next_video_addr_v.nametable.y = curr_video_addr_t.nametable.y ;
          next_video_addr_v.y_coarse    = curr_video_addr_t.y_coarse    ;
          next_video_addr_v.y_fine      = curr_video_addr_t.y_fine      ;
        end
      end
    end
  end

/* OAM and sprite logic
 *****************************************/

  typedef struct packed {
    bit[5:0] obj_index;
    bit[1:0] atr_index;
  } oam_addr_type;

  typedef struct packed {
    // X coordinate
    bit [7:0] coord_x;

    // Attribues
    bit       flip_y;
    bit       flip_x;
    bit       prio;
    bit[2:0]  reserved;
    bit[1:0]  palette;

    // Tile index
    bit[7:0]  tile;    

    // Y coordinate
    bit[7:0]  coord_y;
  } object_type;


  bit[7:0]      pri_oam_bits [0:255]  ;
  bit[7:0]      pri_oam_data          ;

  oam_addr_type curr_pri_oam_addr     ;
  oam_addr_type next_pri_oam_addr     ;

  bit[3:0][7:0] sec_oam_bits [0:7]    ;
  bit[4:0]      sec_oam_addr          ;
  bit           sec_oam_wren          ;
  bit[7:0]      sec_oam_data          ;
  
  bit[3:0]      curr_sprite_index     ;
  bit[7:0]      curr_sprite_latch     ;
  bit[1:0]      curr_spr0_visible     ;
  bit           curr_sprites_wrap     ;
  
  bit[3:0]      next_sprite_index     ;
  bit[7:0]      next_sprite_latch     ;
  bit[1:0]      next_spr0_visible     ;
  bit           next_sprites_wrap     ;

  wire[15:0]    sprite_height         = curr_control.sprite_size
                                      ? 16'd16
                                      : 16'd8                             ;

  wire[15:0]    sprite_min_y          = { 8'b0, curr_sprite_latch }       ;
  wire[15:0]    sprite_min_x          = { 8'b0, curr_sprite_latch }       ;
  wire[15:0]    sprite_max_y          = sprite_min_y + sprite_height      ;
  wire[15:0]    sprite_max_x          = sprite_min_x + 16'd8              ;
  wire          sprite_test_y         = curr_count_y >= sprite_min_y
                                      & curr_count_y <  sprite_max_y      ;
  wire          sprite_test_x         = curr_count_x >= sprite_min_x
                                      & curr_count_x <  sprite_max_x      ;
  wire[2:0]     sprite_fetch_idx      = 3'((curr_count_x - 16'd257) >> 3) ;
  object_type   sprite_props          = sec_oam_bits[sprite_fetch_idx]    ;
  wire[3:0]     sprite_offset_dir_y   = 4'(curr_count_y - {8'b0, sprite_props.coord_y}) ;
  wire[3:0]     sprite_offset_inv_y   = 4'(sprite_height[4:0] - 5'(sprite_offset_dir_y) - 5'd1) ;
  wire[3:0]     sprite_offset_y       = sprite_props.flip_y 
                                      ? sprite_offset_inv_y
                                      : sprite_offset_dir_y                ;

  always_ff @(posedge I_clock)
  begin
    if (O_vid_rise != 1'b0)
    begin
      curr_pri_oam_addr <= next_pri_oam_addr ;
      curr_sprite_index <= next_sprite_index ;
      curr_sprite_latch <= next_sprite_latch ;
      curr_spr0_visible <= next_spr0_visible ;
      curr_sprites_wrap <= next_sprites_wrap ;
    end

    // Prime primary OAM data buffer
    pri_oam_data <= pri_oam_bits[curr_pri_oam_addr];

    // Primary OAM address write
    if (reg_select_oam_addr & I_host_wren_rise)
      curr_pri_oam_addr <= I_host_data;

    // Primary OAM data write
    if (reg_select_oam_data & I_host_wren_rise)
    begin
      if (~vi_active_line | ~vi_render_enabled)
      begin
        pri_oam_bits[curr_pri_oam_addr] <= I_host_data;
        curr_pri_oam_addr <= curr_pri_oam_addr + 8'd1;
      end else begin
        curr_pri_oam_addr.obj_index <=
          curr_pri_oam_addr.obj_index  + 6'd1;
      end
    end

    /* Secondary OAM read/write */
    if (O_vid_rise & sec_oam_wren)
      sec_oam_bits[sec_oam_addr[4:2]]
                  [sec_oam_addr[1:0]] 
        <= sec_oam_data;

      
  end

  always_comb
  begin
  /* Sprite event signals */
    set_sprite_zero_hit = 1'b0;
    set_sprite_overflow = 1'b0;

  /* Reset registers */
    next_pri_oam_addr = 8'b0;
    next_sprite_index = 4'b0;
    next_sprite_latch = 8'b0;
    next_spr0_visible = 2'b0;
    next_sprites_wrap = 1'b0;

  /* Secondary oam signals */
    sec_oam_data = 8'b0;
    sec_oam_addr = 5'b0;
    sec_oam_wren = 1'b0;

    if (I_reset)
    begin
      /* Hold register value */
      next_pri_oam_addr = curr_pri_oam_addr;
      next_sprite_index = curr_sprite_index;
      next_sprite_latch = curr_sprite_latch;
      next_spr0_visible = curr_spr0_visible;
      next_sprites_wrap = curr_sprites_wrap;

      /* Reset OAM addr when sprite tiles are loaded */
      if (vi_active_sprites)
        next_pri_oam_addr = 8'b0;

      if (vi_active_line & vi_render_enabled)
      begin
        /* While sprite evaluation is happening */
        if (curr_count_x > 16'd0 & curr_count_x < 16'd257)
        begin
          /* Write on every even cycle */
          sec_oam_wren = ~curr_count_x[0];

          /* In the first 65 cycles */
          if (curr_count_x < 16'd65)
          begin
            /* Reset evaluator state */
            next_pri_oam_addr = 8'b0;
            next_sprite_index = 4'b0;
            next_sprites_wrap = 1'b0;

            /* Initial secondary OAM to all $FF */
            sec_oam_data = 8'hff;
            sec_oam_addr = 5' ((curr_count_x[5:0] - 6'd1) >> 1'b1);

          /* In the next 192 cycles, find visible sprites for next scanline */
          end else
          begin
            /* Hold address of next secondary OAM slot to be written to */
            sec_oam_addr = { curr_sprite_index[2:0]
                           , curr_pri_oam_addr.atr_index };

            /* Write on each even cycle, but only if overflow hasn't occured
               and sprite evaluation is not wrapped around all 64 sprites */
            sec_oam_wren = ( ~curr_count_x[0]
                           & ~curr_sprite_index [3]
                           & ~curr_sprites_wrap );
            /* On odd cycles */
            if (curr_count_x[0])
            begin
              /* Read byte from primary OAM */
              next_sprite_latch = pri_oam_data ;
            end else
            begin
              /* On even cycles, write byte to secondary OAM */
              sec_oam_data = curr_sprite_latch;

              /* Perform specific action on each of the attributes */
              unique case (curr_pri_oam_addr.atr_index)
                2'd0: begin
                  /* At this point , curr_sprite_latch should contain the sprite Y coordinate,
                   * hence sprite_test_y will be set to the status of weather this scanline
                   * hits the current sprite
                   */
                  if (sprite_test_y)
                  begin
                    /* Sprite 0 is evaluated on cycle 66 of each visible line,
                       so we set the precursor flag to sprite zero hit */
                    if (curr_count_x == 16'd66)
                      next_spr0_visible[1] = 1'b1;

                    /* When we are in overflow state, set the overflow flag  */
                    set_sprite_overflow =
                      curr_sprite_index[3];

                    /* Increment attribute index */
                    next_pri_oam_addr.atr_index =
                      curr_pri_oam_addr.atr_index + 2'b1;
                  end else
                  begin
                    /* Did we evaluate all sprites yet ? */
                    if (curr_pri_oam_addr.obj_index < 6'd63)
                    begin
                      /* Increment prinmary OAM index */
                      next_pri_oam_addr.obj_index =
                        curr_pri_oam_addr.obj_index + 6'b1;
                    end else
                    begin
                      /* Wrap around and disable writes until next scanline */
                      next_pri_oam_addr.obj_index = 6'b0;
                      next_sprites_wrap = 1'b0;
                    end
                  end
                end

                2'd1, 2'd2: begin
                  /* Increment attribute index to be copied */
                  next_pri_oam_addr.atr_index =
                    curr_pri_oam_addr.atr_index + 2'b1;
                end

                2'd3: begin
                  /* Reset attribute index to 0,
                     and start evaluating next sprite */
                  next_pri_oam_addr.obj_index =
                    curr_pri_oam_addr.obj_index + 6'b1;
                  next_pri_oam_addr.atr_index = 2'b0;
                end

              endcase
            end
          end
        end
        else if (vi_active_sprites)
        begin
          /* On cycle 257, carry over sprite 0 hit flag from previous scanline to this scanline */
          if (curr_count_x == 16'd257)
            next_spr0_visible = curr_spr0_visible >> 1;          
          /* */
        end
      end
    end
  end

/* Color Mux logic
 *****************************************/
  bit[3:0]      color_background    ;
  wire[3:0]     color_sprite [0:7]  ;
  assign        color_sprite        = '{ 4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0 }  ;

  wire          left_most_column    = curr_count_x < 16'd9;
  wire          visible_background  = curr_mask.show_background & (curr_mask.show_left_background | ~left_most_column) ;
  wire          visible_sprites     = curr_mask.show_sprites    & (curr_mask.show_left_sprites    | ~left_most_column) ;

  always_comb
  begin
    color_final = 5'd0;

    if (visible_background)
    begin
      if (color_background[1:0] != 2'd0)
        color_final = {1'b0, color_background};
    end

    if (visible_sprites)
    begin
      for (integer i = 0; i < 8; ++i)
      begin
        if (color_sprite[i][1:0] != 2'd0)
          color_final = {1'b1, color_sprite [i]};
      end
    end
  end

endmodule