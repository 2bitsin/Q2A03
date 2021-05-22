module edge_trig (I_clock, I_reset, I_signal, O_rise, O_fall);

  parameter P_width = 1;

  input   wire                  I_clock;
  input   wire                  I_reset;
  input   wire[P_width - 1: 0]  I_signal;
  output  wire[P_width - 1: 0]  O_rise;
  output  wire[P_width - 1: 0]  O_fall;

  bit[P_width - 1: 0] last_state;

  assign O_fall = last_state & ~I_signal ;
  assign O_rise = ~last_state & I_signal ;    

  always @(posedge I_clock, negedge I_reset)
    if (~I_reset)
      last_state <= {P_width {1'b0}};
    else
      last_state <= I_signal;  

endmodule
