module core_audio (I_clock, I_reset, I_phy2, I_address, I_rdwr, I_data, O_data, O_data_rdy, O_irq, O_audio);

  input   wire        I_clock     ;
  input   wire        I_reset     ;
  input   wire        I_phy2      ;
  input   wire[15:0]  I_address   ;
  input   wire        I_rdwr      ;
  input   wire[7:0]   I_data      ;

  output  wire[7:0]   O_data      = 8'b0;
  output  wire        O_data_rdy  = 1'b0;
  output  wire        O_irq       = 1'b1;

  output  wire[15:0]  O_audio     = 16'd0;




endmodule