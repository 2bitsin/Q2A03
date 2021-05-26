module video_composite (I_clock, I_reset, I_vid_data, I_control, I_ppuctrl, I_ppumask, I_fine, O_color);

  input   wire        I_clock     ;  
  input   wire        I_reset     ;  
  input   wire        I_vid_data  ; 
  input   wire[15:0]  I_control   ; 
  input   wire[7:0]   I_ppuctrl   ; 
  input   wire[7:0]   I_ppumask   ; 
  input   wire[2:0]   I_fine      ;
  output  wire[3:0]   O_color     ;


endmodule