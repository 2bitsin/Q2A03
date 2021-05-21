
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

  wire[15:0]      W_hcount         ;
  wire[15:0]      W_vcount         ;
  wire            W_not_vblank     ;
  wire            W_not_hblank     ;

  wire            W_hcount_zero    = W_hcount == 16'd0 ;
  wire            W_prerender_line = W_vcount == 16'd261;
  wire            W_rendering_line = W_not_vblank | W_prerender_line;

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

/* Vblank flag */
  
  wire            W_vblank_flag   ;
  assign          O_host_nmi      = ~(W_vblank_flag & W_enable_nmi);

  wire            W_vblank_clear  ;
  assign          W_vblank_clear  = W_decode_register[2] & W_host_rden; 

  sr_latch #(.P_width (1)) inst_vblank_flag (
    .I_clock      (I_clock), 
    .I_reset      (I_reset),
    .I_set        ((W_hcount_zero & (W_vcount == 16'd241))),
    .I_clear      ((W_hcount_zero & (W_vcount == 16'd261)) | W_vblank_clear),
    .O_value      (W_vblank_flag)
  );

/* Color palette and lookup */
  wire            W_palette_select = O_cart_addr >= 14'h3f00;
  wire[5:0]       W_palette_O_data;

  video_color_tab inst_color_tab(
    .I_clock      (I_clock),
    .I_reset      (I_reset),
    .I_addr       (I_host_addr [4:0]),
    .I_wren       (W_host_wren & W_palette_select),
    .I_data       (R_data_latch),
    .O_data       (W_palette_O_data), 
    .I_index      ({W_vcount[7:6], W_hcount[7:5]}),
    .O_red        (O_vid_red),
    .O_green      (O_vid_green),
    .O_blue       (O_vid_blue)
  );

/* Primary OAM */

  memory #(.P_addr_bits (8)) inst_primary_oam (
    .I_clock      (I_clock),

    .I_addr0      (R_OAM_addr),
    .I_data0      (R_data_latch),
    .I_wren0      (W_host_wren & W_decode_register[4] & ~W_rendering_line),    
    .O_data0      (R_OAM_data),

    .I_addr1      (8'b0),
    .I_data1      (8'b0),
    .I_wren1      (1'b0),    
    .O_data1      ()
  );

/* Decode host address */

  wire[7:0]       W_decode_register;

  decoder #(.P_width(3)) inst_decode_register( 
    .O_unpacked   (W_decode_register),
    .I_packed     (I_host_addr[2:0] )
  );
  
/* PPU Register logic */

  wire            W_host_rden;
  wire            W_host_wren;

  edge_trig inst_edge_host_rden (
    .I_clock      (I_clock), 
    .I_reset      (I_reset), 
    .I_signal     (I_host_rden), 
    .O_rise       (W_host_rden), 
    .O_fall       ()
  );

  edge_trig inst_edge_host_wren (
    .I_clock      (I_clock), 
    .I_reset      (I_reset), 
    .I_signal     (I_host_wren), 
    .O_rise       (W_host_wren), 
    .O_fall       ()
  );

  wire            W_sprite_zero_hit_flag  = 1'b0 ;
  wire            W_sprite_olverflow_flag = 1'b0 ;

  bit[7:0]        R_data_latch ;                // Write latch
  bit[7:0]        R_read_latch ;                // Read latch  
  bit[7:0]        R_control ;                   // PPUCTRL
  wire            W_enable_nmi = R_control[7] ;

  bit[7:0]        R_mask ;                      // PPUMASK
  bit[7:0]        R_OAM_addr ;                  // OAMADDR
  wire[7:0]       R_OAM_data ;                  // OAMDATA

  bit             R_scroll_w ;                  // PPUADDR latch bit
  bit[14:0]       R_scroll_v ;                  // PPUADDR (video address)
  bit[14:0]       R_scroll_t ;                  // PPUADDR (scroll temp)
  bit[2:0]        R_scroll_x ;                  // Fine X

  assign          O_cart_addr = R_scroll_v[13:0];
  assign          O_cart_wren = W_host_wren & W_decode_register[7] & ~W_palette_select;
  assign          O_cart_data = R_data_latch;

  always @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset)
    begin
      R_data_latch <= 8'h00 ;
      R_read_latch <= 8'h00 ;
      R_control    <= 8'h00 ;
      R_mask       <= 8'h00 ;
      R_OAM_addr   <= 8'h00 ;    
      R_scroll_w   <= 1'b0 ;       ;
      R_scroll_t   <= 15'h0000 ;
      R_scroll_v   <= 15'h0000 ;
      R_scroll_x   <= 3'h0;

    end 
    else begin      
      O_cart_wren <= 1'b0;
      if (W_host_wren)
      begin
        O_host_data   <= R_data_latch;
        R_data_latch  <= I_host_data;

        // Write PPUCONTROL
        if (W_decode_register[0])
          R_control <= R_data_latch; 

        // Write PPUMASK
        if (W_decode_register[1]) 
          R_mask <= R_data_latch;

        // Write OAMADDR
        if (W_decode_register[3])
          R_OAM_addr <= R_data_latch;

        // Write OAMDATA
        if (W_decode_register[4])
          R_OAM_addr <= R_OAM_addr + 8'b1;

        // Write PPUSCROLL
        if (W_decode_register[5])
        begin
          if (~R_scroll_w)
          begin
            R_scroll_x[ 2: 0] <= R_data_latch[2:0];
            R_scroll_t[ 4: 0] <= R_data_latch[7:3];
          end else
          begin
            R_scroll_t[14:12] <= R_data_latch[2:0];
            R_scroll_t[ 9: 5] <= R_data_latch[7:3];
          end
          R_scroll_w <= ~R_scroll_w;
        end

        if (W_decode_register[6])
        begin
          if (~R_scroll_w)
            R_scroll_t[14:8] <= {1'b0, R_data_latch[5:0]};
          else begin
            R_scroll_t[ 7:0] <= R_data_latch;
            R_scroll_v <= R_scroll_t;
          end
          R_scroll_w <= ~R_scroll_w;
        end

        if (W_decode_register[7])
        begin
          if (~W_palette_select)
          begin
            O_cart_data <= R_data_latch;
            O_cart_wren <= 1'b1;
          end
        end
      end 
      else if (W_host_rden)
      begin

        // Read PPUSTATUS
        if (W_decode_register[2])
        begin
          R_scroll_w <= 1'b0;
          O_host_data <= { 
            W_vblank_flag, 
            W_sprite_zero_hit_flag, 
            W_sprite_olverflow_flag, 
            R_data_latch[4:0] 
          };
        end

        // Read OAMDATA
        if (W_decode_register[4])
          O_host_data <= R_OAM_data;

        if (W_decode_register[7])
        begin
          if (W_palette_select)
            O_host_data <= W_palette_O_data;
          else begin
            R_read_latch <= I_cart_data;
            O_host_data <= R_read_latch;
          end
        end
      end
    end
  end

endmodule


