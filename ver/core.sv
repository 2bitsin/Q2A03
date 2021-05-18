module core (I_clock, I_reset, I_irq, I_nmi, O_addr, O_wr_data, I_rd_data, O_rdwr, I_ready, O_sync, O_phy2);

/* Input/Output section */

  input   wire        I_clock;
  input   wire        I_reset;
  input   wire        I_irq;
  input   wire        I_nmi;
  input   wire        I_ready;
  input   wire[7:0]   I_rd_data;
  output  wire[7:0]   O_wr_data;
  output  wire        O_rdwr;
  output  wire[15:0]  O_addr;
  output  wire        O_sync;  
  output  wire        O_phy2;

  core_isexec inst_exec (
    I_clock, 
    I_reset, 
    I_irq, 
    I_nmi, 
    O_addr, 
    O_wr_data, 
    I_rd_data, 
    O_rdwr, 
    I_ready, 
    O_sync, 
    O_phy2);

  //core_dma inst_dma ();

endmodule