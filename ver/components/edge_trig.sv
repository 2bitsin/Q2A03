module edge_trig (I_clock, I_reset, I_signal, O_rise);

  input   wire  I_clock;
  input   wire  I_reset;
  input   wire  I_signal;    

  output  wire  O_rise;

  bit last_state;

  assign O_rise = ~last_state & I_signal ;  

  always @(posedge I_clock, negedge I_reset)
    if (~I_reset)
      last_state <= 1'b0;
    else
      last_state <= I_signal;
  

endmodule