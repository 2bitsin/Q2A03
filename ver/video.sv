
module video (
  I_clock, 
  I_reset, 
  O_vid_clock, 
  O_vid_blank, 
  O_vid_hsync,
  O_vid_vsync, 
  O_vid_red, 
  O_vid_green, 
  O_vid_blue,
  O_mem_clock,
  O_mem_addr,
  I_mem_data);

  input   wire        I_clock ;
  input   wire        I_reset ;

  output  wire        O_vid_clock ;
  output  wire        O_vid_blank ;
  output  bit         O_vid_hsync ;
  output  bit         O_vid_vsync ;
  output  wire[7:0]   O_vid_red ;
  output  wire[7:0]   O_vid_green ;
  output  wire[7:0]   O_vid_blue ;

  output  wire        O_mem_clock;
  output  bit[15:0]   O_mem_addr;
  input   wire[7:0]   I_mem_data;
  
  localparam G_active_h     = 16'd256;
  localparam G_active_v     = 16'd240;
  localparam G_front_h      = 16'd9;
  localparam O_sync_h       = 16'd51;
  localparam G_back_h       = 16'd25;
  localparam G_front_v      = 16'd5;
  localparam O_sync_v       = 16'd1;
  localparam G_back_v       = 16'd16;
  localparam G_prefetch_h   = 16'd8;
  localparam G_blank_h      = G_front_h + O_sync_h + G_back_h;
  localparam G_blank_v      = G_front_v + O_sync_v + G_back_v;  
  localparam G_ticks_h      = G_active_h + G_blank_h;
  localparam G_ticks_v      = G_active_v + G_blank_v;    
  localparam G_tiles_base   = 16'h4000;  
  localparam G_index_base   = 16'h4800;  
  
  bit[1:0]    clk_tick      ;
  bit         clk_last      ;
  bit[15:0]   counter_v     ;
  bit[15:0]   counter_h     ;    

  assign       O_vid_blank   = (counter_v >= G_blank_v) && (counter_h >= G_blank_h);  
  assign       O_vid_clock   = clk_tick[1];

  assign       O_mem_clock   = I_clock;

  wire[15:0]   active_h      = counter_h - G_blank_h;
  wire[15:0]   active_v      = counter_v - G_blank_v;
  wire[15:0]   prefetch_h    = (counter_h + G_prefetch_h - G_blank_h);  

  /////////////////////////////////////////////////////////////////
  //                                                             //
  /////////////////////////////////////////////////////////////////

  bit[7:0]     buf_index;
  bit[7:0]     buf_tiles;

  wire[7:0]    pat_color     = 8' (active_h ^ active_v);
  wire[7:0]    dot_color     = 8'hFF;

  assign       O_vid_red     = buf_tiles[7] ? dot_color : {pat_color[7:5], 5'h0};
  assign       O_vid_green   = buf_tiles[7] ? dot_color : {pat_color[4:3], 6'h0};
  assign       O_vid_blue    = buf_tiles[7] ? dot_color : {pat_color[2:0], 5'h0};

  always @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset) 
    begin
      counter_v    <= +16'd0;
      counter_h    <= -16'd1;
      O_vid_hsync  <= 1'd0;
      O_vid_vsync  <= 1'd0;
      clk_last     <= 1'd0;
      clk_tick     <= 2'd3;
    end 
    else
    begin      

      clk_tick <= clk_tick + 2'd1;
      clk_last <= O_vid_clock;
      
      if (~clk_last && O_vid_clock)
      begin
        buf_tiles <= buf_tiles << 1;

        case (prefetch_h & 7)
          1: O_mem_addr <= G_index_base + {3'd0, prefetch_h[15:3]} + {active_v[13:3], 5'd0};
          3: buf_index  <= I_mem_data;
          5: O_mem_addr <= G_tiles_base + {5'd0, buf_index, active_v[2:0]};
          7: buf_tiles  <= I_mem_data;
        endcase
        
        if (counter_h != G_ticks_h - 16'd1) 
          counter_h <= counter_h + 16'd1;        
        else begin
          counter_h <= 16'd0;
          if (counter_v != G_ticks_v - 16'd1) 
            counter_v <= counter_v + 16'd1;
          else 
            counter_v <= 16'd0;
        end          
          
        O_vid_hsync <= (counter_h < G_front_h) || (counter_h >= (G_blank_h - G_back_h));
        O_vid_vsync <= (counter_v < G_front_v) || (counter_v >= (G_blank_v - G_back_v));
      end

    end  
  end
endmodule

