module testbench (G_clock, G_reset);

  input wire  G_clock;
  input wire  G_reset;

  wire        G_irq ;       // => CPU
  wire        G_nmi ;       // => CPU
  wire[15:0]  G_addr ;      // <= CPU
  wire        G_rdwr ;      // <= CPU
  wire[7:0]   G_rd_data ;   // => CPU
  wire[7:0]   G_wr_data ;   // <= CPU
  wire        G_ready ;     // => CPU
  wire        G_sync ;      // <= CPU
  wire        G_phy2 ;      // <= CPU

  bit b_irq = 0, b_nmi = 0, b_ready = 0;
  bit[7:0] b_rd_data = 0; 

  assign G_irq = b_irq;
  assign G_nmi = b_nmi;
  assign G_rd_data = b_rd_data;
  assign G_ready = b_ready;

  Q2A03 q0 (G_clock, G_reset, G_irq, G_nmi, G_addr, G_wr_data, G_rd_data, G_rdwr, G_ready, G_sync, G_phy2);

  initial begin
    $display("Starting simulation ...");    
    $dumpfile("trace/testbench.vcd");
    $dumpvars(999, _0);    
  end

  always @(posedge G_clock)  
  begin     
    
  end

endmodule