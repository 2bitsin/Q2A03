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
		
	wire[7:0]					W_data0;
	wire[11:0]				W_addr0;
	wire							W_clock0;  
	
  video inst_video (
    .I_clock      (I_sys_clock),
    .I_reset      (I_sys_reset),
	  .O_vid_clock  (O_vid_clock),
	  .O_vid_blank  (O_vid_blank),
	  .O_vid_hsync  (O_vid_hsync),
	  .O_vid_vsync  (O_vid_vsync),
	  .O_vid_red    (O_vid_red),
	  .O_vid_green  (O_vid_green),
	  .O_vid_blue   (O_vid_blue),
    .O_mem_addr   (W_addr0),
    .O_mem_clock  (W_clock0),
    .I_mem_data   (W_data0));

  dpmem #(
    .P_data_bits  (8), 
    .P_addr_bits  (12)) 
  inst_memory (
    .I_clock0     (W_clock0),
    .I_addr0      (W_addr0),
    .I_rden0      (1),
    .I_wren0      (0),
    .I_data0      (0),
    .O_data0      (W_data0),

    .I_clock1     (0),
    .I_addr1      (0),
    .I_rden1      (0),
    .I_wren1      (0),
    .I_data1      (0),
    .O_data1      ());

  initial begin
  `ifdef VERILATOR
    $dumpfile("trace/widget.vcd");
    $dumpvars(999, inst_video);    
  `endif
  end    


endmodule