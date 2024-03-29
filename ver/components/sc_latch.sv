module sc_latch (I_clock, I_reset, I_set, I_clear, I_gate, O_value, O_value_n, O_value_g, O_value_gn);

  parameter P_width = 1;

  input   wire                  I_clock;
  input   wire                  I_reset;
  input   wire[P_width - 1: 0]  I_set;
  input   wire[P_width - 1: 0]  I_clear;  
  input   wire[P_width - 1: 0]  I_gate;
  output  wire[P_width - 1: 0]  O_value;
  output  wire[P_width - 1: 0]  O_value_n;
  output  wire[P_width - 1: 0]  O_value_g;
  output  wire[P_width - 1: 0]  O_value_gn;

  bit[P_width - 1: 0] value;

  assign  O_value     = value;
  assign  O_value_n   = ~O_value;
  assign  O_value_g   = value & I_gate;
  assign  O_value_gn  = ~O_value_g;

  always @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset)
      value <= {P_width {1'b0}};
    else 
      value <= (value | I_set) & ~I_clear;
  end

endmodule
