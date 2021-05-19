
module  video_color_tab (I_clock, I_reset, I_addr, I_wren, I_data, O_data, I_index, O_red, O_green, O_blue);
  input   wire        I_clock ; 
  input   wire        I_reset ; 
    
  input   wire[4:0]   I_addr  ; 
  input   wire        I_wren  ;   
  input   wire[5:0]   I_data  ; 
  output  bit[5:0]    O_data  ; 

  input   wire[4:0]   I_index ;  

  output  wire[7:0]   O_red   ;
  output  wire[7:0]   O_green ;
  output  wire[7:0]   O_blue  ;

  bit[5:0]  color_lookup [0:31];
  initial color_lookup = '{
    6'h01, 6'h02, 6'h03, 6'h04, 6'h05, 6'h06, 6'h07, 6'h08, 
    6'h09, 6'h0A, 6'h0B, 6'h0C, 6'h11, 6'h12, 6'h13, 6'h14, 
    6'h15, 6'h16, 6'h17, 6'h18, 6'h19, 6'h1A, 6'h1B, 6'h1C,
    6'h24, 6'h25, 6'h26, 6'h27, 6'h28, 6'h29, 6'h2A, 6'h2B
 };

  bit[23:0] color_consts [0:63];
  initial color_consts = '{ 
    24'h666666, 24'h002A88, 24'h1412A7, 24'h3B00A4, 
    24'h5C007E, 24'h6E0040, 24'h6C0600, 24'h561D00, 
    24'h333500, 24'h0B4800, 24'h005200, 24'h004F08, 
    24'h00404D, 24'h000000, 24'h000000, 24'h000000, 
    24'hADADAD, 24'h155FD9, 24'h4240FF, 24'h7527FE, 
    24'hA01ACC, 24'hB71E7B, 24'hB53120, 24'h994E00, 
    24'h6B6D00, 24'h388700, 24'h0C9300, 24'h008F32, 
    24'h007C8D, 24'h000000, 24'h000000, 24'h000000, 
    24'hFFFEFF, 24'h64B0FF, 24'h9290FF, 24'hC676FF, 
    24'hF36AFF, 24'hFE6ECC, 24'hFE8170, 24'hEA9E22, 
    24'hBCBE00, 24'h88D800, 24'h5CE430, 24'h45E082, 
    24'h48CDDE, 24'h4F4F4F, 24'h000000, 24'h000000, 
    24'hFFFEFF, 24'hC0DFFF, 24'hD3D2FF, 24'hE8C8FF, 
    24'hFBC2FF, 24'hFEC4EA, 24'hFECCC5, 24'hF7D8A5, 
    24'hE4E594, 24'hCFEF96, 24'hBDF4AB, 24'hB3F3CC, 
    24'hB5EBF2, 24'hB8B8B8, 24'h000000, 24'h000000
  };
  
  bit[5:0] W_temp;
  always @(posedge I_clock) 
  begin
    if (I_wren)
      color_lookup[I_addr] <= I_data[5:0];    
    O_data <= color_lookup[I_addr];
    W_temp <= color_lookup[I_index];
  end
  
  assign O_red   = color_consts[W_temp][8*3-1:8*2];
  assign O_green = color_consts[W_temp][8*2-1:8*1];
  assign O_blue  = color_consts[W_temp][8*1-1:8*0];

endmodule