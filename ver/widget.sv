module widget (I_sys_clock, I_sys_reset, O_vid_clock, O_vid_blank, O_vid_hsync, O_vid_vsync, O_vid_red, O_vid_green, O_vid_blue);

  input  wire       I_sys_clock;
  input  wire       I_sys_reset;

  output wire       O_vid_clock;
  output wire       O_vid_blank;
  output bit        O_vid_hsync;
  output bit        O_vid_vsync;
  output wire[7:0]  O_vid_red;
  output wire[7:0]  O_vid_green;
  output wire[7:0]  O_vid_blue;
      
  /* Host bus signals */

  /* Master cpu signals */
  wire        W_core_phy2     ;
  wire        W_core_rdwr     ;
  wire        W_core_wren     = W_core_phy2 & ~W_core_rdwr;
  wire[15:0]  W_core_addr     ;
  wire[7:0]   W_core_wr_data  ;

  /* Chip select lines */
  bit         W_mem_select    ; 
  bit         W_car_select    ; 
  bit         W_ppu_select    ;  

  /* Data return paths */
  wire[7:0]   W_mem_O_data    ;
  wire[7:0]   W_car_O_data    ;
  wire[7:0]   W_ppu_O_data    ;

  bit[7:0]    W_core_rd_data  ;

  /* Misc signals */
  wire        W_core_nmi      ;
  wire        W_core_irq      ;

  /* Host bus address decoding */
  always @* begin  
    W_mem_select = 1'b0;
    W_ppu_select = 1'b0;
    W_car_select = 1'b0;
    unique case (W_core_addr[15:12])
      4'h0, 4'h1 : W_mem_select = 1'b1; // $0000 - $1FFF : RAM
      4'h2, 4'h3 : W_ppu_select = 1'b1; // $2000 - $3FFF : PPU
      default    : W_car_select = 1'b1; // $4000 - $FFFF : CARTRIDGE
    endcase
  end

  always @* begin
    W_core_rd_data = 8'hFF;
    if (W_mem_select)
      W_core_rd_data = W_mem_O_data;
    else if (W_ppu_select)
      W_core_rd_data = W_ppu_O_data;
    else if (W_car_select)
      W_core_rd_data = W_car_O_data;
  end

  /* Host cpu and host memory*/    
  core inst_core (
    .I_clock      (I_sys_clock),
    .I_reset      (I_sys_reset),
    .I_irq        (W_core_irq),
    .I_nmi        (W_core_nmi),
    .I_ready      (1),
    .O_rdwr       (W_core_rdwr),
    .O_addr       (W_core_addr),
    .O_phy2       (W_core_phy2),
    .O_wr_data    (W_core_wr_data),
    .I_rd_data    (W_core_rd_data),
    .O_sync       ());

  memory #(.P_addr_bits (11)) inst_core_memory (
    .I_clock      (I_sys_clock),        
    .I_addr       (W_core_addr[10:0]),
    .I_wren       (W_core_wren & W_mem_select),
    .I_data       (W_core_wr_data),
    .O_data       (W_mem_O_data));

  /* Video bus signals */
  wire        W_video_wren;
  wire[13:0]  W_video_addr;
  wire[7:0]   W_video_wr_data;

  /* Video bus select signals*/
  wire        W_cart_ciram_ce;
  wire        W_cart_ciram_a10;
  wire        W_cart_ciram_a11;

  wire        W_video_mem_select = (W_video_addr[13] & W_cart_ciram_ce);

  /* Video data return paths */
  wire[7:0]   W_video_mem_O_data;  
  wire[7:0]   W_cart_chr_O_data;

/* Delaying sync signals by 1 vid_clock, 
   to compensate for not going trough the DAC */

  wire        W_vid_hsync ;    
  wire        W_vid_vsync ;
  wire        W_vid_clock_rise;
 
  always @(posedge I_sys_clock) 
    if (W_vid_clock_rise)   
    begin
      O_vid_vsync <= W_vid_vsync;
      O_vid_hsync <= W_vid_hsync;
    end
  
     
  /* Video and video memory*/        
  video inst_video (
    .I_clock      (I_sys_clock),
    .I_reset      (I_sys_reset),
    .O_vid_clock  (O_vid_clock),
    .O_vid_rise   (W_vid_clock_rise),
    .O_vid_blank  (O_vid_blank),
    .O_vid_hsync  (W_vid_hsync),
    .O_vid_vsync  (W_vid_vsync),
    .O_vid_red    (O_vid_red),
    .O_vid_green  (O_vid_green),
    .O_vid_blue   (O_vid_blue),
        
    .I_host_addr  (W_core_addr[2:0]),
    .I_host_data  (W_core_wr_data),
    .I_host_wren  (W_core_wren),
    .O_host_data  (W_ppu_O_data),
    .O_host_nmi   (W_core_nmi),
    
    .O_cart_addr  (W_video_addr),
    .O_cart_wren  (W_video_wren),
    .O_cart_data  (W_video_wr_data),
    .I_cart_data  (W_video_mem_select ? W_video_mem_O_data : W_cart_chr_O_data));
                    
  memory #(.P_addr_bits (12)) inst_video_memory (
    .I_clock      (I_sys_clock),        
    .I_addr       ({W_cart_ciram_a11, W_cart_ciram_a10, W_video_addr[9:0]}),
    .I_wren       (W_video_wren & W_video_mem_select),
    .I_data       (W_video_wr_data),
    .O_data       (W_video_mem_O_data));

  /* Cartridge */
  balloon_fight inst_cart(
    .I_clock      (I_sys_clock), 
    .I_reset      (I_sys_reset), 
    .I_phy2       (W_core_phy2), 

    .I_prg_addr   (W_core_addr), 
    .I_prg_wren   (W_core_wren & W_car_select), 
    .I_prg_data   (W_core_wr_data), 
    .O_prg_data   (W_car_O_data),
    .O_irq        (W_core_irq),

    .I_chr_addr   (W_video_addr), 
    .I_chr_wren   (W_video_wren & ~W_video_mem_select),
    .I_chr_data   (W_video_wr_data), 
    .O_chr_data   (W_cart_chr_O_data), 

    .O_ciram_ce   (W_cart_ciram_ce), 
    .O_ciram_a10  (W_cart_ciram_a10), 
    .O_ciram_a11  (W_cart_ciram_a11)
  );

  initial begin
  `ifdef VERILATOR
    $dumpfile("trace/widget.fst");
    $dumpvars(999, inst_core);    
  `endif
  end    

endmodule