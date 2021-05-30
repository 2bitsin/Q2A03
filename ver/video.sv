
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

  always_comb begin
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
          next_count_y = 16'd0;
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

  bit       curr_mask_grayscale;
  bit       curr_mask_show_left_background;
  bit       curr_mask_show_left_sprites;
  bit       curr_mask_show_background;
  bit       curr_mask_show_sprites;
  bit       curr_mask_emphasize_red;
  bit       curr_mask_emphasize_green;
  bit       curr_mask_emphasize_blue;

  wire[7:0] curr_mask =
            {
              curr_mask_grayscale,
              curr_mask_show_left_background,
              curr_mask_show_left_sprites,
              curr_mask_show_background,
              curr_mask_show_sprites,
              curr_mask_emphasize_red,
              curr_mask_emphasize_green,
              curr_mask_emphasize_blue
            };

  bit[7:0]  next_mask;

  always_ff @(posedge I_clock)
  begin
    curr_mask_grayscale             <= next_mask[0];
    curr_mask_show_left_background  <= next_mask[1];
    curr_mask_show_left_sprites     <= next_mask[2];
    curr_mask_show_background       <= next_mask[3];
    curr_mask_show_sprites          <= next_mask[4];
    curr_mask_emphasize_red         <= next_mask[5];
    curr_mask_emphasize_green       <= next_mask[6];
    curr_mask_emphasize_blue        <= next_mask[7];
  end

  always_comb
  begin
    next_mask = curr_mask;
    if (I_host_wren & reg_select_mask)
      next_mask = I_host_data;
  end

/* Control register
 **********************************/

  bit[1:0]  curr_control_nametable;
  bit       curr_control_increment;
  bit       curr_control_sprite_8x8_addr;
  bit       curr_control_background_addr;
  bit       curr_control_sprite_size;
  bit       curr_control_master_or_slave;
  bit       curr_control_enable_nmi;

  wire[7:0] curr_control =
            {
              curr_control_nametable,
              curr_control_increment,
              curr_control_sprite_8x8_addr,
              curr_control_background_addr,
              curr_control_sprite_size,
              curr_control_master_or_slave,
              curr_control_enable_nmi
            };

  bit[7:0]  next_control;

  always_ff @(posedge I_clock)
  begin
    curr_control_nametable       <= next_control[1:0];
    curr_control_increment       <= next_control[2];
    curr_control_sprite_8x8_addr <= next_control[3];
    curr_control_background_addr <= next_control[4];
    curr_control_sprite_size     <= next_control[5];
    curr_control_master_or_slave <= next_control[6];
    curr_control_enable_nmi      <= next_control[7];
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
  bit[5:0] palette_bits [0:31];

  initial palette_bits = '{
    6'h01, 6'h03, 6'h04, 6'h06,
    6'h07, 6'h08, 6'h09, 6'h0c,
    6'h11, 6'h13, 6'h14, 6'h16,
    6'h17, 6'h18, 6'h19, 6'h1c,
    6'h21, 6'h23, 6'h24, 6'h26,
    6'h27, 6'h28, 6'h29, 6'h2c,
    6'h31, 6'h33, 6'h34, 6'h36,
    6'h37, 6'h38, 6'h39, 6'h3c
  };

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

  assign O_host_nmi = ~(curr_control_enable_nmi & curr_vertical_blank_bit);

  always_ff @(posedge I_clock)
  begin

    if (O_vid_rise)
    begin
      curr_vertical_blank_bit  <= next_vertical_blank_bit  ;
      curr_sprite_zero_hit_bit <= next_sprite_zero_hit_bit ;
      curr_sprite_overflow_bit <= next_sprite_overflow_bit ;
    end

    if (I_host_rden & reg_select_status)
      curr_vertical_blank_bit <= 1'b0;
  end

  always_comb
  begin
    next_vertical_blank_bit  = curr_vertical_blank_bit  ;
    next_sprite_zero_hit_bit = curr_sprite_zero_hit_bit ;
    next_sprite_overflow_bit = curr_sprite_overflow_bit ;

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
      3'd4 : ;

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
    bit[4:0] x_coarse;
    bit[4:0] y_coarse;

    struct packed
    {
      bit x;
      bit y;
    } nametable;

    bit[2:0] y_fine;

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

  bit             curr_video_addr_w   ;

  bit[3:0]        vi_tile_line        ;
  bit[7:0]        vi_tile_index       ;
  bit             vi_tile_base        ;

  wire[14:0]      vi_addr_increment   = curr_control_increment ? 15'd32 : 15'd1;
  wire            vi_palette_access   = curr_video_addr_v[13:8] == 6'b111111;
  wire            vi_render_enabled   = curr_mask_show_sprites
                                      | curr_mask_show_background;
  wire            vi_prederder_line   = curr_count_y == 16'd261;
  wire            vi_rendering_line   = curr_count_y <= 16'd239;

  wire            vi_active_line      = (vi_prederder_line | vi_rendering_line) ;
  wire            vi_active_sprites_x = (curr_count_x > 16'd256) & (curr_count_x < 16'd321);
  wire            vi_active_backgnd_x = (curr_count_x > 16'd000) & (curr_count_x < 16'd337) & ~vi_active_sprites_x;
  wire            vi_active_sprites   = vi_active_line & vi_active_sprites_x;
  wire            vi_active_backgnd   = vi_active_line & vi_active_backgnd_x;

  assign          O_vid_data          = I_host_data;
  assign          O_vid_wren          = reg_select_vid_data & I_host_wren & ~vi_palette_access;
  assign          color_background    = curr_tile_shifter[curr_video_fine_x];


  always_ff @(posedge I_clock)
  begin
    if (O_vid_rise)
    begin
      /* Do normal clocked logic */
      curr_video_addr_v <= next_video_addr_v;
      curr_video_addr_t <= next_video_addr_t;
      curr_video_fine_x <= next_video_fine_x;
      curr_video_data   <= next_video_data;
      curr_tile_index   <= next_tile_index;
      curr_tile_bits_lo <= next_tile_bits_lo;
      curr_tile_bits_hi <= next_tile_bits_hi;
      curr_tile_shifter <= next_tile_shifter;
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
    if (reg_select_vid_data & (I_host_wren_rise | I_host_rden_rise))
      curr_video_addr_v <= curr_video_addr_v + vi_addr_increment;


  end

  always_comb
  begin
  /* Reset render state */
    next_video_addr_t = 15'd0;
    next_video_addr_v = 15'd0;
    next_video_fine_x = 3'd0;
    next_video_data   = 8'd0;
    next_tile_index   = 8'd0;
    next_tile_attrib  = 2'd0;
    next_tile_bits_lo = 8'd0;
    next_tile_bits_hi = 8'd0;
    next_tile_shifter = 64'd0;

    /* Default the video address */
    O_vid_addr        = curr_video_addr_v[13:0];

    if (I_reset)
    begin
    /* Default register setup */
      next_video_addr_t = curr_video_addr_t;
      next_video_addr_v = curr_video_addr_v;
      next_video_fine_x = curr_video_fine_x;
      next_video_data   = curr_video_data;

    /* Current tile index and attribute*/
      next_tile_index   = curr_tile_index;
      next_tile_attrib  = curr_tile_attrib;
      next_tile_bits_lo = curr_tile_bits_lo;
      next_tile_bits_hi = curr_tile_bits_hi;
      next_tile_shifter = curr_tile_shifter;

    /* Read PPUDATA register into pipeline*/
      if (reg_select_vid_data & I_host_rden)
        next_video_data = I_vid_data;

    /* Setup tile fetch for background */
      vi_tile_index = curr_tile_index;
      vi_tile_base  = curr_control_background_addr;
      vi_tile_line  = {1'b0, curr_video_addr_v.y_fine};

    /* Setup tile fetch for sprites */
      if (vi_active_sprites)
      begin
        vi_tile_index = 8'd0; // Fix later
        vi_tile_line = 4'd0;  // Fix later

        if (~curr_control_sprite_size)
          vi_tile_base = curr_control_sprite_8x8_addr;
        else
          vi_tile_base = 1'b0; // Fix later
      end

      if (vi_render_enabled)
      begin
        if (vi_active_backgnd | vi_active_sprites)
        begin
        /* Shift out a single background pixel */
          next_tile_shifter[14:0] = curr_tile_shifter[15:1];

        /* Generate data fetch addresses */
          unique case (curr_count_x[2:0])
          3'd1, 3'd2 : O_vid_addr = { 2'h2, curr_video_addr_v[11:0] };
          3'd3, 3'd4 : O_vid_addr = { 2'h2, curr_video_addr_v.nametable, 4'hF, curr_video_addr_v.y_coarse[2:0], curr_video_addr_v.x_coarse[2:0] };
          3'd5, 3'd6 : O_vid_addr = { 1'b0, vi_tile_base, vi_tile_index, vi_tile_line };
          3'd7, 3'd0 : O_vid_addr = { 1'b0, vi_tile_base, vi_tile_index, vi_tile_line } + 14'd8;
          default: ;
          endcase

        /* Grab the needed data bits */
          unique case (curr_count_x[2:0])
          3'd2  : next_tile_index   = 8'(I_vid_data);
          3'd4  : next_tile_attrib  = 2'(I_vid_data >> {
                    curr_video_addr_v.y_coarse[1],
                    curr_video_addr_v.x_coarse[1]
                  });
          3'd6  : next_tile_bits_lo = 8'(I_vid_data); // Fetch tile low
          3'd0  : next_tile_bits_hi = 8'(I_vid_data); // Fetch tile high
          default: ;
          endcase

          if (curr_count_x[2:0] == 3'd0)
          begin

          /* Transfer tile and attribute bits into shift register */
            for (integer i = 0; i < 8; ++i)
            begin
              next_tile_shifter[8 + i] = {
                curr_tile_attrib,
                next_tile_bits_hi [i],
                next_tile_bits_lo [i]
              };
            end
          end
        end

        if (vi_active_backgnd)
        begin
         /* Scrolling video address update */
         if (curr_count_x[2:0] == 3'd0)
         begin
            if (curr_video_addr_v.x_coarse != 5'd31)
              next_video_addr_v.x_coarse = curr_video_addr_v.x_coarse + 5'd1;
            else
              next_video_addr_v.x_coarse = 5'd0;
         end          
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
  wire          visible_background  = curr_mask_show_background & (curr_mask_show_left_background | ~left_most_column) ;
  wire          visible_sprites     = curr_mask_show_sprites    & (curr_mask_show_left_sprites    | ~left_most_column) ;

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