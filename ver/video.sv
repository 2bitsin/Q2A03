
module video (
  I_clock, 
  I_reset, 
  O_vid_clock, 
  O_vid_rise,
  O_vid_blank, 
  O_vid_hsync,
  O_vid_vsync, 
  O_vid_red, 
  O_vid_green, 
  O_vid_blue,

  I_host_addr,
  I_host_wren,
  I_host_rden,
  I_host_data,
  O_host_data,
  O_host_nmi,

  O_vid_addr,  
  O_vid_wren,
  I_vid_data,
  O_vid_data);

  import video_control_signals::*;
  import video_regdec_signals::*;
/* I/O ports */

  input   wire        I_clock ;
  input   wire        I_reset ;

  output  wire        O_vid_clock ;
  output  wire        O_vid_rise  ;
  output  wire        O_vid_blank ;
  output  wire        O_vid_hsync ;
  output  wire        O_vid_vsync ;
  output  wire[7:0]   O_vid_red   ;
  output  wire[7:0]   O_vid_green ;
  output  wire[7:0]   O_vid_blue  ;

  input   wire[2:0]   I_host_addr ;
  input   wire        I_host_wren ;
  input   wire        I_host_rden ;
  input   wire[7:0]   I_host_data ;
  output  bit[7:0]    O_host_data ;
  output  bit         O_host_nmi  ;

  output  bit[13:0]   O_vid_addr ;  
  output  bit         O_vid_wren ;
  input   wire[7:0]   I_vid_data ;
  output  bit[7:0]    O_vid_data ;
    
/* Decode register access */
  wire            W_host_rden_rise;
  wire            W_host_wren_rise;
  wire            W_host_rden_fall;
  wire            W_host_wren_fall;

  wire[7:0]       W_reg_select;
  wire[7:0]       W_reg_wren;
  wire[7:0]       W_reg_rden;
  wire[7:0]       W_reg_wrrise;
  wire[7:0]       W_reg_rdrise;
  wire[7:0]       W_reg_wrfall;
  wire[7:0]       W_reg_rdfall;

  video_regdec inst_video_regdec (
    .I_clock      (I_clock),
    .I_reset      (I_reset),
    .I_addr       (I_host_addr[2:0]), 
    .I_rden       (I_host_rden),
    .I_wren       (I_host_wren),
    .O_rden_rise  (W_host_rden_rise),
    .O_wren_rise  (W_host_wren_rise),
    .O_rden_fall  (W_host_rden_fall),
    .O_wren_fall  (W_host_wren_fall),
    .O_reg        (W_reg_select),
    .O_reg_wren   (W_reg_wren),
    .O_reg_rden   (W_reg_rden),
    .O_reg_wrrise (W_reg_wrrise),
    .O_reg_rdrise (W_reg_rdrise),
    .O_reg_wrfall (W_reg_wrfall),
    .O_reg_rdfall (W_reg_rdfall)
  );


/* Registers */

  wire[7:0]       curr_hb_latch;
  wire[7:0]       curr_ppu_ctrl;
  wire[7:0]       curr_ppu_mask;
  wire[7:0]       curr_oam_addr;

  register #(.P_width (8)) inst_db_latch (I_clock, I_reset, I_host_wren | I_host_rden, I_host_wren ? I_host_data : O_host_data, curr_hb_latch);
  register #(.P_width (8)) inst_ppu_ctrl (I_clock, I_reset, W_reg_wrrise[R_ppu_ctrl], I_host_data, curr_ppu_ctrl);
  register #(.P_width (8)) inst_ppu_mask (I_clock, I_reset, W_reg_wrrise[R_ppu_mask], I_host_data, curr_ppu_mask);


  /* Video bus control logic */  

  wire[2:0] W_vid_fine;  
  wire[7:0] W_ppu_data;

  video_address inst_video_address (
    .I_clock      (I_clock),
    .I_reset      (I_reset),
    .I_wren       (W_reg_wrrise),
    .I_rden       (W_reg_rdrise),
    .I_data       (I_host_data),
    .O_data       (W_ppu_data),
    .I_control    (W_video_control),
    .I_ppuctrl    (curr_ppu_ctrl),
    .I_ppumask    (curr_ppu_mask),
    .O_vid_fine   (W_vid_fine),
    .O_vid_addr   (O_vid_addr),
    .O_vid_wren   (O_vid_wren),    
    .I_vid_data   (I_vid_data),
    .O_vid_data   (O_vid_data)
  );

/* OAM memory and registers */

  wire[7:0]       curr_oam_data;

  video_oam inst_video_oam (
    .I_clock      (I_clock),
    .I_reset      (I_reset),
    .I_addr_wren  (W_reg_wrrise[R_oam_addr]), 
    .I_addr_inc   (W_reg_wrfall[R_oam_data]), 
    .I_addr_clr   (1'b0),
    .I_data_wren  (W_reg_wrrise[R_oam_data]), 
    .I_data       (I_host_data),
    .O_addr       (), 
    .O_data       (curr_oam_data));

/* Host bus logic */

  mux #(.P_select_width (3), .P_data_width (8)) inst_host_data_mux (
    .I_select     (I_host_addr),
    .I_data       ('{
                  curr_hb_latch,                                   // PPUCTRL
                  curr_hb_latch,                                   // PPUMASK
                  {W_vblank_value, 2'b00, curr_hb_latch[4:0]},     // PPUSTATUS
                  curr_hb_latch,                                   // OAMADDR
                  curr_oam_data,                                   // OAMDATA
                  curr_hb_latch,                                   // PPUSCROLL
                  curr_hb_latch,                                   // PPUADDR
                  W_vid_mux_data}),                                  // PPUDATA    
    .O_data       (O_host_data)
  );
 
  wire[7:0]       W_vid_mux_data;

  mux #(.P_select_width (1), .P_data_width (8)) inst_vid_data_mux (
    .I_select     (W_select_color_tab),
    .I_data       ('{
                  W_ppu_data, 
                  W_pal_data}),
    .O_data       (W_vid_mux_data)
  );

/* Video timing generator */

  wire[15:0]      W_hcount         ;
  wire[15:0]      W_vcount         ;
  wire            W_not_vblank     ;
  wire            W_not_hblank     ;  
  wire            W_vblank_value   ;
  wire            W_clk_fall       ;
  wire            W_clk_rise       ;

  assign          O_vid_rise       = W_clk_rise;

  video_timing inst_timing (
    .I_clock      (I_clock),
    .I_reset      (I_reset),
    .O_clock      (O_vid_clock),
    .O_clk_rise   (W_clk_rise),
    .O_clk_fall   (W_clk_fall),
    .O_not_blank  (O_vid_blank),
    .O_hsync      (O_vid_hsync),
    .O_vsync      (O_vid_vsync),
    .O_hcount     (W_hcount),
    .O_vcount     (W_vcount),
    .O_not_hblank (W_not_hblank),
    .O_not_vblank (W_not_vblank)
  );

  /* Video control signals */

  wire[15:0]      W_video_control;

  video_control inst_video_control (
    .I_vcount     (W_vcount), 
    .I_hcount     (W_hcount), 
    .I_not_hblank (W_not_hblank), 
    .I_not_vblank (W_not_vblank),
    .I_vid_clock  (O_vid_clock),
    .I_clk_rise   (W_clk_rise),
    .I_clk_fall   (W_clk_fall),
    .O_control    (W_video_control)
  );

  /* Vblank flag / NMI */

  sc_latch inst_vblank_flag (
    .I_clock      (I_clock), 
    .I_reset      (I_reset), 
    .I_set        (W_video_control[video_vblank_set]), 
    .I_clear      (W_video_control[video_vblank_clr] | W_reg_rdfall[R_ppu_stat]), 
    .I_gate       (curr_ppu_ctrl[7]), 
    .O_value      (W_vblank_value),
    .O_value_n    (),
    .O_value_g    (),
    .O_value_gn   (O_host_nmi));

  /* Color generator */

  wire            W_select_color_tab  = &O_vid_addr[13:8];
  wire[7:0]       W_pal_data  ;

  video_color_tab inst_color_tab(
    .I_clock      (I_clock),
    .I_reset      (I_reset),

    .O_red        (O_vid_red),
    .O_green      (O_vid_green),
    .O_blue       (O_vid_blue),

    .I_addr       (O_vid_addr[4:0]),
    .I_wren       (O_vid_wren & W_select_color_tab),
    .I_data       (I_host_data),
    .O_data       (W_pal_data), 
    .I_index      ({W_vcount[7:6], W_hcount[7:5]})

  );



endmodule


