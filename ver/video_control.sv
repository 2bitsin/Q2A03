package video_control_signals;
  parameter video_vblank_set    = 0;
  parameter video_vblank_clr    = 1;
  parameter video_is_rendering  = 2;
endpackage

module video_control(I_vcount, I_hcount, I_not_hblank, I_not_vblank, O_control);

  import video_control_signals::*;

  input   wire[15:0]  I_hcount;
  input   wire[15:0]  I_vcount;
  input   wire        I_not_hblank;
  input   wire        I_not_vblank;
  output  wire[15:0]  O_control;


  wire    W_hcount_zero   = I_hcount == 16'd0   ;  
  wire    W_vblank_begin  = I_vcount == 16'd241 ;
  wire    W_vblank_end    = I_vcount == 16'd261 ;

  assign O_control[video_vblank_set]    = W_hcount_zero & W_vblank_begin;
  assign O_control[video_vblank_clr]    = W_hcount_zero & W_vblank_end;
  assign O_control[video_is_rendering]  = W_vblank_end | I_not_vblank;

endmodule
