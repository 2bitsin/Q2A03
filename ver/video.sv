
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
  
/* Video timing generator */

  wire[15:0]      W_hcount        ;
  wire[15:0]      W_vcount        ;
  wire            W_hcount_zero   = (W_hcount == 16'd0);
  wire            W_vblank_flag   ;
  wire            W_vblank_clear  = 1'b0;

  assign          O_host_nmi      = ~(W_vblank_flag & R_enable_nmi);

  video_timing inst_timing (
    .I_clock      (I_clock),
    .I_reset      (I_reset),
    .O_clock      (O_vid_clock),
    .O_rise       (O_vid_rise),
    .O_not_blank  (O_vid_blank),
    .O_hsync      (O_vid_hsync),
    .O_vsync      (O_vid_vsync),
    .O_hcount     (W_hcount),
    .O_vcount     (W_vcount)  
  );

/* Vblank flag */
  
  sr_latch #(.P_width (1)) inst_vblank_flag (
    .I_clock      (I_clock), 
    .I_reset      (I_reset),
    .I_set        ((W_hcount_zero & (W_vcount == 16'd241))),
    .I_clear      ((W_hcount_zero & (W_vcount == 16'd261)) | W_vblank_clear),
    .O_value      (W_vblank_flag)
  );

/* Color palette and lookup */

  video_color_tab inst_color_tab(
    .I_clock      (I_clock),
    .I_reset      (I_reset),
    .I_addr       (5'b0),
    .I_wren       (1'b0),
    .I_data       (6'b0),
    .O_data       (), 
    .I_index      ({W_vcount[7:6], W_hcount[7:5]}),
    .O_red        (O_vid_red),
    .O_green      (O_vid_green),
    .O_blue       (O_vid_blue)
  );

/* Decode host address */

  wire[7:0] W_decode_register;
  decoder #(.P_width(3))  inst_decode_register( 
    .O_unpacked   (W_decode_register),
    .I_packed     (I_host_addr[2:0] )
  );

/* PPU Registers */

  bit R_enable_nmi;


  always @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset)
    begin
      R_enable_nmi <= 1'b0;
    end 
    else begin
      

    end
  end

endmodule


