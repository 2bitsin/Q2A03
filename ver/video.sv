
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
    
/* Decode register access */

  parameter       R_ppu_ctrl = 0;
  parameter       R_ppu_mask = 1;
  parameter       R_ppu_stat = 2;  
  parameter       R_oam_addr = 3;
  parameter       R_oam_data = 4;
  parameter       R_ppu_scrl = 5;
  parameter       R_ppu_addr = 6;
  parameter       R_ppu_data = 7;

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

  wire[7:0]       curr_host_data;

  wire[7:0]       curr_ppu_ctrl;
  wire[7:0]       curr_ppu_mask;
  wire[7:0]       curr_oam_addr;

  bit[7:0]        next_oam_addr;

  register #(.P_width (8)) inst_host_data   (I_clock, I_reset, W_host_wren_rise, I_host_data, curr_host_data);
  register #(.P_width (8)) inst_ppu_ctrl    (I_clock, I_reset, W_reg_wrrise[R_ppu_ctrl], curr_host_data, curr_ppu_ctrl);
  register #(.P_width (8)) inst_ppu_mask    (I_clock, I_reset, W_reg_wrrise[R_ppu_mask], curr_host_data, curr_ppu_mask);

  register #(.P_width (8)) inst_oam_addr    (I_clock, I_reset, O_vid_rise, next_oam_addr, curr_oam_addr);

  always_comb
  begin
    
    next_oam_addr = curr_oam_addr;
    if (W_reg_wrrise[R_oam_addr])
      next_oam_addr = curr_host_data;
    else if (W_reg_wren[R_oam_data] | W_reg_rden[R_oam_data])
      next_oam_addr = curr_oam_addr + 8'd1;    
  end

/* Host bus logic */

  mux #(.P_select_width (3), .P_data_width (8)) inst_host_data_mux (
    .I_select (I_host_addr),
    .I_data   ('{
      curr_host_data,                                   // PPUCTRL
      curr_host_data,                                   // PPUMASK
      {W_vblank_value, 2'b00, curr_host_data[4:0]},     // PPUSTATUS
      curr_host_data,                                   // OAMADDR
      curr_host_data,                                   // OAMDATA
      curr_host_data,                                   // PPUSCROLL
      curr_host_data,                                   // PPUADDR
      curr_host_data}),                                 // PPUDATA    
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
  
//  delay #(.P_length(4)) inst_clrvbf_delay (
//    .I_clock      (I_clock), 
//    .I_reset      (I_reset), 
//    .I_tick       (O_vid_rise), 
//    .I_signal     (), 
//    .O_signal     (W_clear_vblank_flag));

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


