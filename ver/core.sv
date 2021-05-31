module core (I_clock, I_reset, I_irq, I_nmi, O_addr, O_wr_data, I_rd_data, O_rdwr, I_ready, O_sync, O_phy2);

/* Input/Output section */

  input   wire        I_clock;
  input   wire        I_reset;
  input   wire        I_irq;
  input   wire        I_nmi;
  input   wire        I_ready;
  input   wire[7:0]   I_rd_data;

  output  bit[7:0]    O_wr_data;
  output  bit         O_rdwr;
  output  bit[15:0]   O_addr;
  output  bit         O_sync;  
  output  bit         O_phy2;

  wire[7:0]           W_wr_data;
  wire                W_rdwr;
  wire[15:0]          W_addr;
  wire                W_sync;
  wire                W_phy2;

  core_isexec inst_exec (I_clock, I_reset, I_irq, I_nmi, W_addr, W_wr_data, I_rd_data, W_rdwr, I_ready, W_sync, W_phy2);

  always_comb 
  begin
    O_wr_data = W_wr_data;
    O_addr    = W_addr;
    O_rdwr    = W_rdwr | (W_addr >= 16'h4000 && W_addr < 16'h4020);
    O_sync    = W_sync;
    O_phy2    = W_phy2;
  end

endmodule