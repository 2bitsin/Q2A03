module video_background (I_clock, I_reset, I_shr_tile, I_vid_data, I_control, I_ppuctrl, I_ppumask, I_at_shift, I_fine, O_color);

  import video_control_signals::*;

  input   wire        I_clock     ;
  input   wire        I_reset     ;
  input   wire        I_shr_tile  ;
  input   wire[7:0]   I_vid_data  ;
  input   wire[15:0]  I_control   ;
  input   wire[7:0]   I_ppuctrl   ;
  input   wire[7:0]   I_ppumask   ;
  input   wire[1:0]   I_at_shift  ;
  input   wire[2:0]   I_fine      ;

  output  wire[3:0]   O_color     ;

  bit[3:0] color_bits [0:15];
  bit[7:0] tile_bits ;
  bit[1:0] attr_bits ;

  assign O_color = color_bits[{1'b0, I_fine}];

  always_ff @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset)
    begin
      attr_bits <= 2'd0;
      tile_bits <= 8'd0;      
      for (integer i = 0; i < 15; ++i)
        color_bits[i] <= 4'd0;
    end 
    else if (|I_ppumask[4:3]) 
    begin
      if (I_control[video_fetch_at_byte_data])
        attr_bits <= 2' (I_vid_data >> {I_at_shift, 1'b0});
      else if (I_control[video_fetch_tile_lo_data])
        tile_bits <= I_vid_data;
      else if (I_control[video_fetch_tile_hi_data])
      begin
        for (integer i = 0; i < 8; ++i)
        begin
          color_bits[8 + i] <= { 
            attr_bits, I_vid_data [i], tile_bits [i] 
          } ;
        end
      end
    end
  end


endmodule