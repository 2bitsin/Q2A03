
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

/* I/O ports */

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
    
/* Clock divider logic */

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

/* Vertical and Horizontal counter logic */

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

/* Palette color lookup logic */  

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

/* Palette RAM */

  bit[4:0] pixel_color;
  bit[5:0] palette_bits [0:31];

  initial palette_bits = '{
    6'h01, 6'h03, 6'h04, 6'h06, 6'h07, 6'h08, 6'h09, 6'h0c,    
    6'h11, 6'h13, 6'h14, 6'h16, 6'h17, 6'h18, 6'h19, 6'h1c,    
    6'h21, 6'h23, 6'h24, 6'h26, 6'h27, 6'h28, 6'h29, 6'h2c,    
    6'h31, 6'h33, 6'h34, 6'h36, 6'h37, 6'h38, 6'h39, 6'h3c
  };

  always_ff @(posedge I_clock) begin
    color_index <= palette_bits[pixel_color];
  end

  always_comb 
  begin		
    pixel_color = {2'b00, curr_count_x[7:5]};
         if (curr_count_y < 16'd030) pixel_color[4:3] = 2'd0;
    else if (curr_count_y < 16'd060) pixel_color[4:3] = 2'd1;
    else if (curr_count_y < 16'd090) pixel_color[4:3] = 2'd2;
    else if (curr_count_y < 16'd120) pixel_color[4:3] = 2'd3;
    else if (curr_count_y < 16'd150) pixel_color[4:3] = 2'd0;
    else if (curr_count_y < 16'd180) pixel_color[4:3] = 2'd1;
    else if (curr_count_y < 16'd210) pixel_color[4:3] = 2'd2;
    else if (curr_count_y < 16'd240) pixel_color[4:3] = 2'd3;
  end


endmodule




