
module video_address (I_clock,
                      I_reset,
                      I_wren,
                      I_rden,
                      I_data,
                      O_data,
                      I_control,
                      I_ppuctrl,
                      I_ppumask,
                      O_vid_fine,
                      O_at_shift,
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
  input  wire[ 7:0]   I_ppuctrl   ;
  input  wire[ 7:0]   I_ppumask   ;

  output wire[2:0]    O_vid_fine  ;
  output wire[1:0]    O_at_shift  ;
  output wire[13:0]   O_vid_addr  ;
  output wire         O_vid_wren  ;
  input  wire[7:0]    I_vid_data  ;
  output wire[7:0]    O_vid_data  ;

  bit[14:0]           v_addr;
  bit[14:0]           t_addr;
  bit[2:0]            v_fine;
  bit                 w_latch;
  bit[7:0]            v_data;
  bit[7:0]            t_tidx;
  bit[2:0]            v_oaddr;
  wire[14:0]          v_incr;

  assign              O_data      = v_data;

  assign              O_vid_fine  = v_fine[2:0];
  assign              O_vid_data  = I_data;
  assign              O_vid_wren  = I_wren[R_ppu_data];
  assign              O_at_shift  = {v_addr[6], v_addr[1]};

  assign              v_incr      = I_ppuctrl[2] ? 15'd32 : 15'd1;

  mux #(.P_select_width (3), .P_data_width (14)) inst_addr_mux (
    .I_select (v_oaddr),
    .I_data   ('{
              {2'h2, v_addr[11:0]},
              {2'h2, v_addr[11:10], 4'b1111, v_addr[9:7], v_addr[4:2]},
              {1'h0, I_ppuctrl[4], t_tidx, 1'b0, v_addr[14:12]},
              {1'h0, I_ppuctrl[4], t_tidx, 1'b0, v_addr[14:12]} + 14'd8,
              v_addr[13:0],
              v_addr[13:0],
              v_addr[13:0],
              v_addr[13:0]}),
    .O_data   (O_vid_addr));

  always_comb
  begin
    v_oaddr = 3'd4;
    if (|I_ppumask[4:3])
    begin
      if (I_control[video_fetch_nt_byte_addr])
        v_oaddr = 3'd0; 
      else if (I_control[video_fetch_at_byte_addr])
        v_oaddr = 3'd1;
      else if (I_control[video_fetch_tile_lo_addr])
        v_oaddr = 3'd2;
      else if (I_control[video_fetch_tile_hi_addr])
        v_oaddr = 3'd3;
    end
  end

  always_ff @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset)
    begin
      v_addr  <= 15'd0;
      t_addr  <= 15'd0;
      v_data  <=  8'd0;
      v_fine  <=  3'd0;
      w_latch <=  1'd0;
      t_tidx  <=  8'd0;

    end else
    begin
      if (I_rden [R_ppu_data])
        v_data <= I_vid_data;                               // Read from PPU Bus

      if (I_rden [R_ppu_stat])
        w_latch <= 1'b0;                                    // Reset write latch
      else if (I_wren [R_ppu_addr] | I_wren [R_ppu_scrl])
        w_latch <= ~w_latch;                                // Flip write latch

      if (I_wren [R_ppu_data] | I_rden [R_ppu_data])
        v_addr <= v_addr + v_incr;                          // Increment PPUADDR

      if (I_wren [R_ppu_ctrl])
        t_addr[11:10] <= I_data[1:0];                       // PPUADDR.Name_table
      else if (I_wren [R_ppu_addr])
      begin
        if (~w_latch)
        begin
          t_addr[13: 8] <= I_data[ 5:0];                    // PPUADDR.Hi
          t_addr[   14] <= 1'b0;
        end else
        begin
          t_addr[ 7: 0] <= I_data[ 7:0];                    // PPUADDR.Lo
          v_addr[ 7: 0] <= I_data[ 7:0];                    // v.Lo = t.Lo
          v_addr[14: 8] <= t_addr[14:8];                    // v.Hi = t.Hi
        end
      end
      else if (I_wren [R_ppu_scrl])
      begin
        if (~w_latch)
        begin
          t_addr[ 4: 0] <= I_data[ 7:3];                    // PPUSCROLL.XCoarse
          v_fine[ 2: 0] <= I_data[ 2:0];                    // PPUSCROLL.XFine
        end else
        begin
          t_addr[ 9: 5] <= I_data[ 7:3];                    // PPUSCROLL.YCoarse
          t_addr[14:12] <= I_data[ 2:0];                    // PPUSCROLL.YFine
        end
      end

      if (|I_ppumask[4:3])
      begin                
        if (I_control[video_fetch_nt_byte_data])
          t_tidx <= I_vid_data;
        
        if (I_control[video_incr_hori_v])
        begin
          v_addr[4:0] <= v_addr[4:0] + 5'd1;
          if (&v_addr[4:0])
            v_addr[10] <= ~v_addr[10];
        end else 
        if (I_control[video_incr_vert_v])
        begin
          v_addr[14:12] <= v_addr[14:12] + 3'd1;
          if (&v_addr[14:12])
          begin
            v_addr[9:5] <= v_addr[9:5] + 5'd1;
            if (v_addr[9:5] == 5'd29)
            begin
              v_addr[9:5] <= 5'd0;
              v_addr[11] <= ~v_addr[11];              
            end
          end
        end else
        if (I_control[video_hori_v_eq_t])
        begin
          v_addr[   10] <= t_addr[   10];
          v_addr[ 4: 0] <= t_addr[ 4: 0];
        end else
        if (I_control[video_vert_v_eq_t])
        begin
          v_addr[   11] <= t_addr[   11];
          v_addr[ 9: 5] <= t_addr[ 9: 5];
          v_addr[14:12] <= t_addr[14:12];
        end
      end
    end
  end

endmodule