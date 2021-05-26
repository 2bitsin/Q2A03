module video_composit (I_clock, I_reset, I_dot_clk, I_control, I_ppuctrl, I_ppumask, I_bg_color, O_color);

  import video_control_signals::*;

  input  wire       I_clock     ;
  input  wire       I_reset     ;
  input  wire       I_dot_clk   ;
  input  wire[15:0] I_control   ;
  input  wire[ 7:0] I_ppuctrl   ;
  input  wire[ 7:0] I_ppumask   ;
  input  wire[ 3:0] I_bg_color  ;
  output wire[ 4:0] O_color     ;

  wire W_show_backgnd = I_ppumask[3] & (~I_control[video_left_most_8] | I_ppumask[1]);
  wire W_show_sprites = I_ppumask[4] & (~I_control[video_left_most_8] | I_ppumask[2]);

  assign O_color = {1'b0, I_bg_color & {4 {W_show_sprites}}};

endmodule