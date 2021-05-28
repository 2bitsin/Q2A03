
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
  wire      reg_select_control      = reg_select [0];
  wire      reg_select_mask         = reg_select [1];
  wire      reg_select_status       = reg_select [2];
  wire      reg_select_oam_address  = reg_select [3];
  wire      reg_select_oam_data     = reg_select [4];
  wire      reg_select_scroll       = reg_select [5];
  wire      reg_select_ppu_address  = reg_select [6];
  wire      reg_select_ppu_data     = reg_select [7];

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
    curr_control_nametable          <= next_control[1:0];
    curr_control_increment          <= next_control[2];
    curr_control_sprite_8x8_addr    <= next_control[3];
    curr_control_background_addr    <= next_control[4];
    curr_control_sprite_size        <= next_control[5];
    curr_control_master_or_slave    <= next_control[6];
    curr_control_enable_nmi         <= next_control[7];
  end

  always_comb
  begin
    next_control = curr_control;
    if (I_host_wren & reg_select_control)
      next_control = I_host_data;
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
      3'd7 : ;
      default:;
    endcase
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


/* Background and sprite test pattern 
 *****************************************/

  bit[3:0] color_background;

  always_comb
  begin
    color_background = {curr_count_x[7:4] ^ curr_count_y[7:4]};
  end

  bit[7:0] curr_sprite_sx [0:7] ;
  bit[7:0] curr_sprite_sy [0:7] ;
  bit[7:0] curr_sprite_dx [0:7] ;
  bit[7:0] curr_sprite_dy [0:7] ;
  bit[3:0] curr_sprite_id [0:7] ;

  bit[7:0] next_sprite_sx [0:7] ;
  bit[7:0] next_sprite_sy [0:7] ;
  bit[7:0] next_sprite_dx [0:7] ;
  bit[7:0] next_sprite_dy [0:7] ;

  bit      last_vsync;
  bit[3:0] color_sprite [0:7]   ;
  bit[7:0] sprite_priority      ;

  /* verilator lint_off WIDTH */
  initial curr_sprite_sx = '{  8'd71, 8'd50, 8'd80, 8'd60, 8'd25, 8'd100, 8'd12, 8'd33 };
  initial curr_sprite_sy = '{  8'd48, 8'd31, 8'd41, 8'd27, 8'd57, 8'd55,  8'd32, 8'd22 };
  initial curr_sprite_dx = '{ +8'd1, -8'd1, +8'd1, -8'd1, +8'd1, +8'd1,  -8'd1, +8'd1  };
  initial curr_sprite_dy = '{ +8'd1, -8'd1, -8'd1, -8'd1, -8'd1, +8'd1,  -8'd1, +8'd1  };
  initial curr_sprite_id = '{  8'd1,  8'd3,  8'd5,  8'd7,  8'd9,  8'd11,  8'd13, 8'd15 };
  /* verilator lint_on WIDTH */
  always_ff @(posedge I_clock)
  begin
    last_vsync <= O_vid_vsync;
    for (integer i = 0; i < 8; ++i)
    begin
      curr_sprite_sx[i] <= next_sprite_sx[i];
      curr_sprite_sy[i] <= next_sprite_sy[i];
      curr_sprite_dx[i] <= next_sprite_dx[i];
      curr_sprite_dy[i] <= next_sprite_dy[i];
    end
  end

  always_comb 
  begin
    for (integer i = 0; i < 8; ++i) 
    begin
      next_sprite_sx[i] = curr_sprite_sx[i];
      next_sprite_sy[i] = curr_sprite_sy[i];
      next_sprite_dx[i] = curr_sprite_dx[i];
      next_sprite_dy[i] = curr_sprite_dy[i];        

      color_sprite[i]   = 0;
    end

    if (I_reset)
    begin

      for (integer i = 0; i < 8; ++i)
      begin

        if ((curr_count_x >= {8'd0, curr_sprite_sx[i] + 8'd0}) & 
            (curr_count_x <  {8'd0, curr_sprite_sx[i] + 8'd8}) &  
            (curr_count_y >= {8'd0, curr_sprite_sy[i] + 8'd0}) & 
            (curr_count_y <  {8'd0, curr_sprite_sy[i] + 8'd8}))
        begin                     
          color_sprite[i] = curr_sprite_id[i];
        end      

        if (curr_sprite_sx[i] < 8'd1)
          next_sprite_dx[i] = +8'd1;
        if (curr_sprite_sx[i] >= 8'd248)
          next_sprite_dx[i] = -8'd1;

        if (curr_sprite_sy[i] < 8'd1)
          next_sprite_dy[i] = +8'd1;
        if (curr_sprite_sy[i] >= 8'd232)
          next_sprite_dy[i] = -8'd1;
      end

      if (last_vsync & ~O_vid_vsync)
      begin
        for (integer i = 0; i < 8; ++i)
        begin
          next_sprite_sx[i] = curr_sprite_sx[i] + curr_sprite_dx[i];
          next_sprite_sy[i] = curr_sprite_sy[i] + curr_sprite_dy[i];
        end
      end
    end
  end
  


/* Color Mux logic
 *****************************************/

  wire left_most_column   = curr_count_x < 16'd9;
  wire visible_background = curr_mask_show_background & (curr_mask_show_left_background | ~left_most_column) ;
  wire visible_sprites    = curr_mask_show_sprites    & (curr_mask_show_left_sprites    | ~left_most_column) ;
 
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