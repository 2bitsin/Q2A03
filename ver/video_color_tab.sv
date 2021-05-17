
module  video_color_tab (I_clock, I_reset, I_addr, I_wren, I_data, O_data, I_index, O_red, O_green, O_blue);
  input  wire      I_clock ; 
  input  wire      I_reset ; 
  
  input  wire[4:0] I_addr  ; 
  input  wire      I_wren  ; 
  input  wire[7:0] I_data  ; 
  output bit[7:0]  O_data  ; 

  input wire[5:0]  I_index ; 
  output bit[7:0]  O_red   ; 
  output bit[7:0]  O_green ; 
  output bit[7:0]  O_blue  ;

endmodule