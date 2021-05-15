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
    
  wire[15:0]        W_video_addr;
  wire              W_video_rden;  
  wire[7:0]         W_video_data;
    
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
    .O_mem_addr   (W_video_addr),
    .O_mem_rden   (W_video_rden),
    .I_mem_data   (W_video_data));
      


  wire        W_core_phy2     ;
  wire        W_core_rdwr     ;
  wire        W_core_rden     = W_core_phy2 & W_core_rdwr;
  wire        W_core_wren     = W_core_phy2 & ~W_core_rdwr;
  wire[15:0]  W_core_addr     ;
  wire[7:0]   W_core_wr_data  ;


  wire        W_mem_cs        = ~W_core_addr[15];
  wire[7:0]   W_mem_O_data    ;

  wire        W_car_cs        =  W_core_addr[15];
  wire[7:0]   W_car_O_data    ;

  wire[7:0]   W_core_rd_data  = ~W_core_addr[15] 
                                ? W_mem_O_data 
                                : W_car_O_data ;
  dpmem #(
    .P_data_bits  (8), 
    .P_addr_bits  (15),    

    .P_init_bin0  ("assets/mems/8x8.mem"),
    .P_init_beg0  (15'h5800),
    .P_init_end0  (15'h5fff),

    .P_init_bin1  ("assets/mems/vid.mem"),
    .P_init_beg1  (15'h6000),
    .P_init_end1  (15'h63ff))    

  inst_memory (
    .I_clock1     (I_sys_clock),
    .I_clock0     (I_sys_clock),
        
    .I_addr0      (W_core_addr[14:0]),
    .I_rden0      (W_core_rden & W_mem_cs),
    .I_wren0      (W_core_wren & W_mem_cs),
    .I_data0      (W_core_wr_data),
    .O_data0      (W_mem_O_data),

    .I_addr1      (W_video_addr[14:0]),
    .I_rden1      (W_video_rden),
    .O_data1      (W_video_data),
    .I_wren1      (0),
    .I_data1      (0));

  test_cart_01_basics inst_cart(
    .I_clock      (I_sys_clock), 
    .I_reset      (I_sys_reset), 
    .I_phy2       (W_core_phy2), 

    .I_prg_addr   (W_core_addr), 
    .I_prg_rden   (W_core_rden & W_car_cs), 
    .I_prg_wren   (W_core_wren & W_car_cs), 
    .I_prg_data   (W_core_wr_data), 
    .O_prg_data   (W_car_O_data),

    .I_chr_addr   (14'h0000), 
    .I_chr_wren   (1'd0), 
    .I_chr_rden   (1'd0), 
    .I_chr_data   (8'h00), 
    .O_chr_data   (), 

    .O_ciram_ce   (), 
    .O_ciram_a10  (), 
    .O_irq        ()
  );
    
  core inst_core (
    .I_clock      (I_sys_clock),
    .I_reset      (I_sys_reset),
    .I_irq        (1),
    .I_nmi        (1),
    .I_ready      (1),
    .O_rdwr       (W_core_rdwr),
    .O_addr       (W_core_addr),
    .O_phy2       (W_core_phy2),
    .O_wr_data    (W_core_wr_data),
    .I_rd_data    (W_core_rd_data),
    .O_sync       ()
  );

  initial begin
  `ifdef VERILATOR
    $dumpfile("trace/widget.vcd");
    $dumpvars(999, inst_video);    
  `endif
  end    

endmodule