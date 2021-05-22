
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
    
/* Read / Write edge edtect */

  wire            W_host_rden;
  wire            W_host_wren;

  edge_trig #(.P_width(2)) inst_edge_trig (
    .I_clock      (I_clock), 
    .I_reset      (I_reset), 
    .I_signal     ({I_host_rden, I_host_wren}), 
    .O_rise       ({W_host_rden, W_host_wren}),
    .O_fall       ());

/* Decode register access */

  parameter       R_ppu_ctrl = 0;
  parameter       R_ppu_mask = 1;
  parameter       R_ppu_stat = 2;  
  parameter       R_oam_addr = 3;
  parameter       R_oam_data = 4;
  parameter       R_ppu_scrl = 5;
  parameter       R_ppu_addr = 6;
  parameter       R_ppu_data = 7;

  wire[7:0]       W_reg_select;
  wire[7:0]       W_reg_wren;
  wire[7:0]       W_reg_rden;

  video_regdec inst_video_regdec (
    .I_addr       (I_host_addr[2:0]), 
    .I_rden       (W_host_rden),
    .I_wren       (W_host_wren),
    .O_reg        (W_reg_select),
    .O_reg_wren   (W_reg_wren),
    .O_reg_rden   (W_reg_rden));


/* Registers */

  wire[7:0]       W_host_data;

  wire[7:0]       W_ppu_ctrl;
  wire[7:0]       W_ppu_mask;

  register #(.P_width (8)) inst_host_data   (I_clock, I_reset, W_host_wren, I_host_data, W_host_data);
  register #(.P_width (8)) inst_ppu_ctrl    (I_clock, I_reset, W_reg_wren[R_ppu_ctrl], W_host_data, W_ppu_ctrl);
  register #(.P_width (8)) inst_ppu_mask    (I_clock, I_reset, W_reg_wren[R_ppu_mask], W_host_data, W_ppu_mask);

/* Host bus logic */

  mux #(.P_select_width (3), .P_data_width (8)) inst_host_data_mux (
    .I_select (I_host_addr),
    .I_data   ('{
      W_host_data,                                      // PPUCTRL
      W_host_data,                                      // PPUMASK
      {W_vblank_value, 1'b0, 1'b0, W_host_data[4:0]},   // PPUSTATUS
      W_host_data,                                      // OAMADDR
      W_host_data,                                      // OAMDATA
      W_host_data,                                      // PPUSCROLL
      W_host_data,                                      // PPUADDR
      W_host_data}),                                    // PPUDATA
    .O_data   (O_host_data)
  );
 
/* Video timing generator */

  wire[15:0]      W_hcount         ;
  wire[15:0]      W_vcount         ;
  wire            W_not_vblank     ;
  wire            W_not_hblank     ;  
  wire            W_vblank_value   ;

  video_timing inst_timing (
    .I_clock      (I_clock),
    .I_reset      (I_reset),
    .O_clock      (O_vid_clock),
    .O_rise       (O_vid_rise),
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
    .O_control    (W_video_control)
  );

  /* Vblank flag / NMI */

  wire            W_clear_vblank_flag;
  delay #(.P_length(1)) inst_clrvbf_delay (
    .I_clock      (I_clock), 
    .I_reset      (I_reset), 
    .I_tick       (O_vid_rise), 
    .I_signal     (W_reg_rden[R_ppu_stat]), 
    .O_signal     (W_clear_vblank_flag));

  sc_latch inst_vblank_flag (
    .I_clock      (I_clock), 
    .I_reset      (I_reset), 
    .I_set        (W_video_control[video_vblank_set]), 
    .I_clear      (W_video_control[video_vblank_clr] | W_clear_vblank_flag), 
    .I_gate       (W_ppu_ctrl[7]), 
    .O_value      (W_vblank_value),
    .O_value_n    (),
    .O_value_g    (),
    .O_value_gn   (O_host_nmi));

  /* Color generator */

  video_color_tab inst_color_tab(
    .I_clock      (I_clock),
    .I_reset      (I_reset),

    .O_red        (O_vid_red),
    .O_green      (O_vid_green),
    .O_blue       (O_vid_blue),

    .I_addr       (5'd0),
    .I_wren       (1'd0),
    .I_data       (6'd0),
    .O_data       (), 
    .I_index      ({W_vcount[7:6], W_hcount[7:5]})

  );



endmodule


