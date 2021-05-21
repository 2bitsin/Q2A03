
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

  O_cart_addr,  
  O_cart_wren,
  I_cart_data,
  O_cart_data);

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

  output  bit[13:0]   O_cart_addr ;  
  output  bit         O_cart_wren ;
  input   wire[7:0]   I_cart_data ;
  output  bit[7:0]    O_cart_data ;
  


/* Decode register address */

  wire[7:0]       W_select_reg;

  decoder #(.P_width(3)) inst_rsdec (I_host_addr[2:0], W_select_reg);
    
/* Read / Write edge edtect */

  wire            W_host_rden;
  wire            W_host_wren;

  edge_trig inst_wren_det (I_clock, I_reset, I_host_wren, W_host_wren);
  edge_trig inst_rden_det (I_clock, I_reset, I_host_rden, W_host_rden);

  /* Video timing generator */

  wire[15:0]      W_hcount         ;
  wire[15:0]      W_vcount         ;
  wire            W_not_vblank     ;
  wire            W_not_hblank     ;

  wire            W_hcount_zero    = W_hcount == 16'd0 ;
  wire            W_prerender_line = W_vcount == 16'd261;
  wire            W_rendering_line = W_not_vblank | W_prerender_line;
  wire            W_vblank_set     = (W_hcount_zero & W_vcount == 16'd241);
  wire            W_vblank_clr     = (W_hcount_zero & W_vcount == 16'd241) | (W_host_rden & W_select_reg[2]);
  wire            W_vblank_value   ;   

  bit             R_nmi_enabled    = 1'b0;  
  
  sc_latch inst_vblank_flag (I_clock, I_reset, W_vblank_set, W_vblank_clr, R_nmi_enabled, W_vblank_value, O_host_nmi);

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


