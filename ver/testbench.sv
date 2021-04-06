module testbench(G_clock, G_reset, G_irq, G_nmi, G_ready, G_rd_data, G_wr_data, G_rdwr, G_addr, G_sync, G_phy2);
  input   wire        G_clock;
  input   wire        G_reset;
  input   wire        G_irq;
  input   wire        G_nmi;
  input   wire        G_ready;
  input   wire[7:0]   G_rd_data;
  output  wire[7:0]   G_wr_data;
  output  wire        G_rdwr;
  output  wire[15:0]  G_addr;
  output  wire        G_sync;        
  output  wire        G_phy2;

  Q2A03 i0 (G_clock, G_reset, G_irq, G_nmi, G_addr, G_wr_data, G_rd_data, G_rdwr, G_ready, G_sync, G_phy2);

  initial begin
    $dumpfile("trace/testbench.vcd");
    $dumpvars(999, i0);
  end

endmodule