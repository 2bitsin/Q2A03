module core_dma (I_clock, I_reset, I_sync, I_tick, O_addr, O_rdwr, I_data, O_data, I_load, O_ready);

  input   wire        I_clock;
  input   wire        I_reset;
  input   wire        I_sync;
  input   wire        I_tick;
  output  logic[15:0] O_addr;
  output  logic       O_rdwr;
  input   wire[7:0]   I_data;
  output  logic[7:0]  O_data;
  input   wire        I_load;
  output  logic       O_ready;

endmodule