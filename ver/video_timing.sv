module video_timing (I_clock, I_reset, O_clock, O_clk_rise, O_clk_fall, O_not_blank, O_hsync, O_vsync, O_hcount, O_vcount, O_not_hblank, O_not_vblank);

  input   wire        I_clock       ;
  input   wire        I_reset       ;
  output  wire        O_clock       ;
  output  wire        O_clk_rise    ;
  output  wire        O_clk_fall    ;
  output  wire        O_not_blank   ;
  output  wire        O_hsync       ;
  output  wire        O_vsync       ;
  output  wire        O_not_hblank  ;  
  output  wire        O_not_vblank  ;  
  output  wire[15:0]  O_hcount      ;
  output  wire[15:0]  O_vcount      ;

/* Parameter constants */

  localparam  G_active_v     = 16'(240);
  localparam  G_active_h     = 16'(256);

  localparam  G_front_h      = 16'(18 );
  localparam  G_sync_h       = 16'(25 );
  localparam  G_back_h       = 16'(42 );

  localparam  G_front_v      = 16'(5  );
  localparam  G_sync_v       = 16'(3  );
  localparam  G_back_v       = 16'(14 );

  localparam  G_blank_h      = G_front_h + G_sync_h + G_back_h;
  localparam  G_blank_v      = G_front_v + G_sync_v + G_back_v;  
  localparam  G_ticks_h      = G_active_h + G_blank_h;
  localparam  G_ticks_v      = G_active_v + G_blank_v;    

/* Timing registers and derivatives */     

  wire        W_overflow_v   ;
  wire        W_overflow_h   ;
  wire        W_vactive      ;
  wire        W_hactive      ;

  edge_trig inst_clk_edge (
    .I_clock         (I_clock), 
    .I_reset         (I_reset),
    .I_signal        (O_clock), 
    .O_rise          (O_clk_rise),
    .O_fall          (O_clk_fall));

  count_up #(.P_width(2)) inst_clk_tick (
    .I_clock         (I_clock),
    .I_reset         (I_reset),
    .I_clear         (1'b0),
    .I_enable        (1'b1),
    .I_target        (2'b11),
    .O_value         ({O_clock, 1'bZ}),
    .O_overflow      (),
    .O_overflow_inv  ());
  
  count_up #(.P_width(16)) inst_hcounter (
    .I_clock         (I_clock),
    .I_reset         (I_reset),
    .I_clear         (1'b0),
    .I_enable        (O_clk_rise),
    .I_target        (G_ticks_h - 1),
    .O_value         (O_hcount),
    .O_overflow      (W_overflow_h),
    .O_overflow_inv  ());

  count_up #(.P_width(16)) inst_vcounter (
    .I_clock         (I_clock),
    .I_reset         (I_reset),
    .I_clear         (1'b0),
    .I_enable        (W_overflow_h & O_clk_rise),
    .I_target        (G_ticks_v - 1),
    .O_value         (O_vcount),
    .O_overflow      (W_overflow_v),
    .O_overflow_inv  ());

  compare #(.P_width(16)) inst_compare_h (
    .I_value         (O_hcount), 
    .I_lower         (16'd1 + G_active_h + G_front_h), 
    .I_upper         (16'd1 + G_active_h + G_front_h + G_sync_h), 
    .O_inside        (), 
    .O_outside       (O_hsync));

  compare #(.P_width(16)) inst_compare_v (
    .I_value         (O_vcount), 
    .I_lower         (16'd1 + G_active_v + G_front_v), 
    .I_upper         (16'd1 + G_active_v + G_front_v + G_sync_v), 
    .O_inside        (), 
    .O_outside       (O_vsync));

  compare #(.P_width(16)) inst_compare_active_h (
    .I_value         (O_hcount), 
    .I_lower         (16'd1), 
    .I_upper         (16'd1 + G_active_h), 
    .O_inside        (O_not_hblank), 
    .O_outside       ());

  compare #(.P_width(16)) inst_compare_active_v (
    .I_value         (O_vcount), 
    .I_lower         (16'd0), 
    .I_upper         (16'd0 + G_active_v), 
    .O_inside        (O_not_vblank), 
    .O_outside       ());

  assign O_not_blank = O_not_vblank & O_not_hblank;
                               
endmodule