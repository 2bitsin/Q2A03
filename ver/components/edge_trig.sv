module edge_trig (I_clock, I_reset, I_signal, O_rise, O_fall);

  input   wire  I_clock;
  input   wire  I_reset;
  input   wire  I_signal;    

  output  wire  O_rise;
  output  wire  O_fall;

  bit last_state;

  assign O_rise = ~last_state & I_signal ;
  assign O_fall = ~I_signal & last_state ;

  always @(posedge I_clock, negedge I_reset)
    if (~I_reset)
      last_state <= 1'b0;
    else
      last_state <= I_signal;
  

endmodule