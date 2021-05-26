package video_control_signals;

  parameter video_fetch_tile_hi_data = 0;
  parameter video_fetch_nt_byte_addr = 1;
  parameter video_fetch_nt_byte_data = 2;
  parameter video_fetch_at_byte_addr = 3;
  parameter video_fetch_at_byte_data = 4;
  parameter video_fetch_tile_lo_addr = 5;
  parameter video_fetch_tile_lo_data = 6;
  parameter video_fetch_tile_hi_addr = 7;


  parameter video_vblank_set         = 8;
  parameter video_vblank_clr         = 9;
  parameter video_is_rendering       = 10;
  parameter video_incr_hori_v        = 11;
  parameter video_incr_vert_v        = 12;
  parameter video_hori_v_eq_t        = 13;
  parameter video_vert_v_eq_t        = 14;
  parameter video_left_most_8        = 15 ;

endpackage

module video_control(I_vcount, I_hcount, I_not_hblank, I_not_vblank, I_vid_clock, I_clk_rise, I_clk_fall, O_control);

  import video_control_signals::*;

  input   wire[15:0]  I_hcount;
  input   wire[15:0]  I_vcount;
  input   wire        I_vid_clock;
  input   wire        I_clk_rise;
  input   wire        I_clk_fall;
  input   wire        I_not_hblank;
  input   wire        I_not_vblank;
  output  wire[15:0]  O_control;

  wire[7:0]   W_fetch_phase       ;

  wire        W_is_idle_cycle     = I_hcount == 16'd0   ;

  wire        W_vblank_begin      = I_vcount == 16'd241 ;

  wire        W_vblank_end        = I_vcount == 16'd261 ;

  wire        W_not_idle_cycle    = I_hcount >= 16'd1   ;

  wire        W_is_sprite_fetch   = I_hcount >= 16'd257
                                 && I_hcount <= 16'd320 ;

  wire        W_col_256           = I_hcount == 16'd256 ;
  wire        W_col_257           = I_hcount == 16'd257 ;
  wire        W_col_280_to_304    = I_hcount >= 16'd280 && I_hcount <= 16'd304;

  wire        W_is_prerender      = W_vblank_end        ;

  wire        W_is_rendering      = W_vblank_end
                                  | I_not_vblank        ;

  wire        W_is_vblank         = ~W_is_rendering     ;

  wire        W_is_fetching       = W_is_rendering
                                  & ~W_is_idle_cycle    ;


  decoder #(.P_width(3)) inst_decode_fetch (
    .I_packed     (I_hcount [2:0]),
    .O_unpacked   (W_fetch_phase)
  );

  assign O_control  [7:0                ] = W_fetch_phase & {8 {W_is_fetching}} ;
  assign O_control  [video_vblank_set   ] = W_is_idle_cycle & W_vblank_begin ;
  assign O_control  [video_vblank_clr   ] = W_is_idle_cycle & W_vblank_end ;
  assign O_control  [video_is_rendering ] = W_is_rendering ;
  assign O_control  [video_incr_hori_v  ] = W_is_rendering & W_fetch_phase[0] & ~(W_is_idle_cycle | W_is_sprite_fetch);
  assign O_control  [video_incr_vert_v  ] = W_is_rendering & I_clk_rise & W_col_256 ;
  assign O_control  [video_hori_v_eq_t  ] = W_is_rendering & I_clk_rise & W_col_257 ;
  assign O_control  [video_vert_v_eq_t  ] = W_is_prerender & I_clk_rise & W_col_280_to_304 ;
  assign O_control  [video_left_most_8  ] = I_hcount >= 16'd1 && I_hcount <= 16'd8;

endmodule
