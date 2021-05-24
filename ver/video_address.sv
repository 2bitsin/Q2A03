
module video_address (I_clock, 
                      I_reset,  
                      I_wren,
                      I_rden, 
                      I_data, 
                      O_data,
                      I_control, 
                      O_vid_fine, 
                      O_vid_addr,
                      O_vid_wren,
                      I_vid_data,
                      O_vid_data);

  import video_control_signals::*;
  import video_regdec_signals::*;

  input  wire         I_clock     ;
  input  wire         I_reset     ;
  
  input  wire[7:0]    I_data      ;
  output wire[7:0]    O_data      ;
  input  wire[7:0]    I_wren      ; 
  input  wire[7:0]    I_rden      ; 

  input  wire[15:0]   I_control   ;
  
  output wire[2:0]    O_vid_fine  ;
  output wire[13:0]   O_vid_addr  ;
  output wire         O_vid_wren  ;
  input  wire[7:0]    I_vid_data  ;
  output wire[7:0]    O_vid_data  ;


  bit[14:0]           v_addr;
  bit[14:0]           t_addr;
  bit[2:0]            v_fine;
  bit                 w_latch;  
  bit[7:0]            v_data;

  assign              O_vid_addr  = v_addr[13:0];
  assign              O_vid_fine  = v_fine[2:0];
  assign              O_vid_data  = v_data[7:0];

  always_ff @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset)
    begin
      v_addr  <= 15'd0;
      v_fine  <=  3'd0;
      t_addr  <= 15'd0;
      w_latch <=  1'd0;
    end else 
    begin
      if (I_rden [R_ppu_stat])
        w_latch <= 1'b0;
      else if (I_wren [R_ppu_addr] | I_wren [R_ppu_scrl])
        w_latch <= ~w_latch;

      if (I_wren [R_ppu_ctrl])
      begin
        t_addr[11:10] <= I_data[1:0];
      end
      else if (I_wren [R_ppu_addr])
      begin
        if (~w_latch) 
        begin
          t_addr[   14] <= 1'b0;
          t_addr[13: 8] <= I_data[ 5:0];
        end else 
        begin
          t_addr[ 7: 0] <= I_data[ 7:0];
          v_addr[ 7: 0] <= I_data[ 7:0];
          v_addr[14: 8] <= t_addr[14:8];
        end
      end 
      else if (I_wren [R_ppu_scrl]) 
      begin
        if (~w_latch) 
        begin
          t_addr[ 4: 0] <= I_data[ 7:3];
          v_fine[ 2: 0] <= I_data[ 2:0];
        end else
        begin
          t_addr[ 9: 5] <= I_data[ 7:3];
          t_addr[14:12] <= I_data[ 2:0];
        end
      end
    end
  end

endmodule