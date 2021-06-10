module widget (I_sys_clock, I_sys_reset, O_vid_clock, O_vid_blank, O_vid_hsync, O_vid_vsync, O_vid_red, O_vid_green, O_vid_blue, I_joy0_bits, O_joy0_mode, I_joy1_bits, O_joy1_mode);

  input  wire       I_sys_clock ;
  input  wire       I_sys_reset ;

  output wire       O_vid_clock ;
  output wire       O_vid_blank ;
  output bit        O_vid_hsync ;
  output bit        O_vid_vsync ;
  output wire[7:0]  O_vid_red   ;
  output wire[7:0]  O_vid_green ;
  output wire[7:0]  O_vid_blue  ;

  input  wire[5:0]  I_joy0_bits ;
  output wire       O_joy0_mode ;
  input  wire[5:0]  I_joy1_bits ;
  output wire       O_joy1_mode ;

  /* Master cpu signals */
  wire            W_core_phy2     ;
  wire            W_core_rdwr     ;
  wire            W_core_wren     = W_core_phy2 & ~W_core_rdwr;
  wire            W_core_rden     = W_core_phy2 & W_core_rdwr;
  wire[15:0]      W_core_addr     ;
  wire[7:0]       W_core_wr_data  ;


  /* Data return paths */
  wire[7:0]       W_mem_O_data    ;
  wire[7:0]       W_car_O_data    ;
  wire[7:0]       W_ppu_O_data    ;

  bit[7:0]        W_core_rd_data  ;

  /* Misc signals */
  wire            W_core_nmi      ;
  wire            W_core_irq      ;

  /* Chip select lines */
  wire            W_mem_select    = |W_core_addr_dec[0];
  wire            W_ppu_select    = |W_core_addr_dec[1];
  wire            W_car_select    = |W_core_addr_dec[7:2];
  wire[7:0]       W_core_addr_dec ;


  wire[1:0]       W_GPIO_o_rden   ;
  wire[7:0]       W_GPIO_o_data   ;
  wire[1:0]       W_GPIO_i_data   ;

  controller inst_controller (
    .I_clock      (I_sys_clock),
    .I_reset      (I_sys_reset),
    .I_joy_bits   ({I_joy1_bits, I_joy0_bits}),
    .O_joy_mode   ({O_joy1_mode, O_joy0_mode}),
    .I_GPIO_load  (W_GPIO_o_data[1:0]),
    .I_GPIO_rden  (W_GPIO_o_rden[1:0]),
    .O_GPIO_data  (W_GPIO_i_data[1:0])
  );

  decoder #(.P_width (3)) inst_decode_bus(
    .I_packed     (W_core_addr[15:13]),
    .O_unpacked   (W_core_addr_dec)
  );

  mux #(.P_select_width(3), .P_data_width(8)) inst_data_bus_mux (
    .I_select     (W_core_addr[15:13]),
    .I_data       ('{
                  W_mem_O_data,  // $0xxx - $1xxx
                  W_ppu_O_data,  // $2xxx - $3xxx
                  W_car_O_data,  // $4xxx - $5xxx
                  W_car_O_data,  // $6xxx - $7xxx
                  W_car_O_data,  // $8xxx - $9xxx
                  W_car_O_data,  // $Axxx - $Bxxx
                  W_car_O_data,  // $Cxxx - $Dxxx
                  W_car_O_data   // $Exxx - $Fxxx
                  }),
    .O_data       (W_core_rd_data)
  );

  /* Host cpu and host memory*/
  core inst_core (
    .I_clock      (I_sys_clock),
    .I_reset      (I_sys_reset),
    .I_irq        (W_core_irq),
    .I_nmi        (W_core_nmi),
    .O_rdwr       (W_core_rdwr),
    .O_addr       (W_core_addr),
    .O_phy2       (W_core_phy2),
    .O_wr_data    (W_core_wr_data),
    .I_rd_data    (W_core_rd_data),
    .O_sync       (),
    .O_GPIO_rden  (W_GPIO_o_rden),
    .O_GPIO_data  (W_GPIO_o_data),
    .I_GPIO_data  (W_GPIO_i_data));

  memory #(.P_addr_bits (11)) inst_core_memory (
    .I_clock      (I_sys_clock),
    .I_addr0      (W_core_addr[10:0]),
    .I_wren0      (W_core_wren & W_mem_select),
    .I_data0      (W_core_wr_data),
    .O_data0      (W_mem_O_data));

  /* Video bus signals */
  wire            W_video_wren;
  wire[13:0]      W_video_addr;
  wire[7:0]       W_video_wr_data;

  /* Video bus select signals*/
  wire            W_cart_ciram_ce;
  wire            W_cart_ciram_a10;
  wire            W_cart_ciram_a11;
  wire            W_video_mem_select = (W_video_addr[13] & W_cart_ciram_ce);

  /* Video data return paths */
  wire[7:0]       W_video_mem_O_data;
  wire[7:0]       W_cart_chr_O_data;

/* Delaying sync signals by 1 vid_clock,
   to compensate for not going trough the DAC */

  wire            W_vid_hsync ;
  wire            W_vid_vsync ;
  wire            W_vid_clock_rise;


  delay #(.P_width(2), .P_length(4)) inst_delay_vsync (
    .I_clock      (I_sys_clock),
    .I_reset      (I_sys_reset),
    .I_tick       (W_vid_clock_rise),
    .I_signal     ({W_vid_vsync, W_vid_hsync}),
    .O_signal     ({O_vid_vsync, O_vid_hsync})
  );

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
    .I_host_wren  (W_core_wren & W_ppu_select),
    .I_host_rden  (W_core_rden & W_ppu_select),
    .O_host_data  (W_ppu_O_data),
    .O_host_nmi   (W_core_nmi),

    .O_vid_addr   (W_video_addr),
    .O_vid_wren   (W_video_wren),
    .O_vid_data   (W_video_wr_data),
    .I_vid_data   (W_video_mem_select ? W_video_mem_O_data : W_cart_chr_O_data));

  memory #(.P_addr_bits (12)) inst_video_memory (
    .I_clock      (I_sys_clock),
    .I_addr0      ({W_cart_ciram_a11, W_cart_ciram_a10, W_video_addr[9:0]}),
    .I_wren0      (W_video_wren & W_video_mem_select),
    .I_data0      (W_video_wr_data),
    .O_data0      (W_video_mem_O_data));

  /* Cartridge */
  super_mario inst_cart(
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