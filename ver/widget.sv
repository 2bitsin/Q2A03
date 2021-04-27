module widget (I_sys_clock, I_sys_reset, O_vid_clock, O_vid_blank, O_vid_hsync, O_vid_vsync, O_vid_red, O_vid_green, O_vid_blue);

  input  wire       I_sys_clock;
  input  wire       I_sys_reset;

  output wire       O_vid_clock;
  output wire       O_vid_blank;
  output wire       O_vid_hsync;
  output wire       O_vid_vsync;
  output wire[7:0]  O_vid_red;
  output wire[7:0]  O_vid_green;
  output wire[7:0]  O_vid_blue;

  video instance_of_video (
    .I_clock      (I_sys_clock),
    .I_reset      (I_sys_reset),
	  .O_vid_clock  (O_vid_clock),
	  .O_vid_blank  (O_vid_blank),
	  .O_vid_hsync  (O_vid_hsync),
	  .O_vid_vsync  (O_vid_vsync),
	  .O_vid_red    (O_vid_red),
	  .O_vid_green  (O_vid_green),
	  .O_vid_blue   (O_vid_blue));

  initial begin
    //$dumpfile("trace/widget.vcd");
    //$dumpvars(999, i0);    
  end    
  
endmodule