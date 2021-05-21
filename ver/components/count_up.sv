module count_up (I_clock, I_reset, I_clear, I_enable, I_target, O_value, O_overflow, O_overflow_inv);

  parameter P_width = 16;

  input   wire                  I_clock;
  input   wire                  I_reset;
  input   wire                  I_clear;
  input   wire                  I_enable;
  input   wire[P_width - 1: 0]  I_target;

  output  bit[P_width - 1: 0]   O_value;
  output  wire                  O_overflow;
  output  wire                  O_overflow_inv;

  assign  O_overflow_inv        = (O_value != I_target);
  assign  O_overflow            = ~O_overflow_inv;

  wire[P_width - 1: 0] CT_one   = {{P_width - 1 {1'b0}}, 1'b1};
  wire[P_width - 1: 0] CT_zero  = {P_width {1'b0}};

  always @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset)
      O_value <= {P_width {1'b0}};
    else if (I_enable) 
    begin
      if (O_overflow_inv)
        O_value <= O_value + CT_one ;
      else
        O_value <= CT_zero;
    end
  end

endmodule
