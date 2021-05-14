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
    
  wire[7:0]         W_data0;
  wire[15:0]        W_addr0;
  wire              W_clock0;  

  wire[7:0]         W_wr_data1;
  wire[7:0]         W_rd_data1;
  wire              W_rdwr1;
  wire[15:0]        W_addr1;
  wire              W_phy2;
  
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
  
  core inst_core (
    .I_clock      (I_sys_clock),
    .I_reset      (I_sys_reset),
    .I_irq        (0),
    .I_nmi        (O_vid_vsync),
    .I_ready      (1),
    .I_rd_data    (W_rd_data1),
    .O_wr_data    (W_wr_data1),
    .O_rdwr       (W_rdwr1),
    .O_addr       (W_addr1),
    .O_sync       (),
    .O_phy2       (W_phy2)
  );
      
  dpmem #(
    .P_data_bits  (8), 
    .P_addr_bits  (16),    

    .P_init_bin0  ("assets/mems/8x8.mem"),
    .P_init_beg0  (16'h5800),
    .P_init_end0  (16'h5fff),

    .P_init_bin1  ("assets/mems/vid.mem"),
    .P_init_beg1  (16'h6000),
    .P_init_end1  (16'h63ff),
    
    .P_init_bin2  ("assets/mems/test.mem"),
    .P_init_beg2  (16'hC000),
    .P_init_end2  (16'hFFFF))

  inst_memory (
    .I_clock0     (W_clock0),
    .I_addr0      (W_addr0),
    .I_rden0      (1),
    .I_wren0      (0),
    .I_data0      (0),
    .O_data0      (W_data0),  
        
    .I_clock1     (I_sys_clock),
    .I_addr1      (W_addr1),
    .I_rden1      (W_rdwr1 & W_phy2),
    .I_wren1      ((~W_rdwr1) & W_phy2),
    .I_data1      (W_wr_data1),
    .O_data1      (W_rd_data1));
  

  initial begin
  `ifdef VERILATOR
    $dumpfile("trace/widget.vcd");
    $dumpvars(999, inst_video);    
  `endif
  end    


endmodule