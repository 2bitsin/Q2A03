
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
  input   wire[7:0]   I_host_data ;
  output  bit[7:0]    O_host_data ;
  output  bit         O_host_nmi  ;

  output  bit[13:0]   O_cart_addr ;  
  output  bit         O_cart_wren ;
  input   wire[7:0]   I_cart_data ;
  output  bit[7:0]    O_cart_data ;
  
/* Parameter constants */

  localparam  G_active_v     = 16'(240);
  localparam  G_active_h     = 16'(256);

  localparam  G_front_h      = 16'(9  );
  localparam  G_sync_h       = 16'(51 );
  localparam  G_back_h       = 16'(25 );

  localparam  G_front_v      = 16'(5  );
  localparam  G_sync_v       = 16'(1  );
  localparam  G_back_v       = 16'(16 );

  localparam  G_blank_h      = G_front_h + G_sync_h + G_back_h;
  localparam  G_blank_v      = G_front_v + G_sync_v + G_back_v;  
  localparam  G_ticks_h      = G_active_h + G_blank_h;
  localparam  G_ticks_v      = G_active_v + G_blank_v;    

/* Timing registers and derivatives */   

  bit[1:0]    clk_tick       ;
  bit         clk_last       ;
  assign      O_vid_rise     = ~clk_last && O_vid_clock;

  bit[15:0]   vcounter       ;
  bit[15:0]   hcounter       ; 


  wire[15:0]  W_hcounter     = hcounter - 16'(1);
  wire[15:0]  W_vcounter     = vcounter;

  bit         W_vblank       ;

  assign      O_vid_hsync    = W_hcounter <  (G_active_h + G_front_h)
                            || W_hcounter >= (G_active_h + G_front_h + G_sync_h);

  assign      O_vid_vsync    = W_vcounter <  (G_active_v + G_front_v)
                            || W_vcounter >= (G_active_v + G_front_v + G_sync_v);

  assign      O_vid_blank    = $unsigned(W_vcounter) < $unsigned(G_active_v) &&
                               $unsigned(W_hcounter) < $unsigned(G_active_h) ;

  assign      O_vid_clock    = clk_tick[1];


/* Palette module */

  video_color_tab inst_color_tab(
    .I_clock  (I_clock),
    .I_reset  (I_reset),
    .I_addr   (5'b0),
    .I_wren   (1'b0),
    .I_data   (6'b0),
    .O_data   (), 
    .I_index  ({W_vcounter[7:6], W_hcounter[7:5]}),
    .O_red    (O_vid_red),
    .O_green  (O_vid_green),
    .O_blue   (O_vid_blue)
  );


  always @(posedge I_clock, negedge I_reset)
  begin
  /* Reset logic */ 
    if (~I_reset) 
    begin
      clk_last     <=  1'b0;
      clk_tick     <=  2'b11;
      vcounter     <=  16'h0000;
      hcounter     <=  16'hFFFF;
    end else 
    begin
      if (O_vid_rise)
      begin

        /* Timing logic */ 
        if (hcounter != G_ticks_h - 1)
          hcounter <= hcounter + 16'd1;
        else begin
          hcounter <= 16'd0;
          if (vcounter != G_ticks_v - 1) 
            vcounter <= vcounter + 16'd1;
          else 
            vcounter <= 16'd0;  
        end

        /* Vblank flag logic */
        if (hcounter == 16'd0)
        begin
          if (vcounter == 16'd241)
            W_vblank <= 1'b1;
          if (vcounter == 16'd261)
            W_vblank <= 1'b0;
        end

      end
      clk_tick <= clk_tick + 2'd1;
      clk_last <= O_vid_clock;      
    end
  end

endmodule

