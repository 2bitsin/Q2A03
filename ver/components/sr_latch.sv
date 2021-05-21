module sr_latch (I_clock, I_reset, I_set, I_clear, O_value);

  parameter P_width = 1;

  input   wire                  I_clock;
  input   wire                  I_reset;
  input   wire[P_width - 1: 0]  I_set;
  input   wire[P_width - 1: 0]  I_clear;  
  output  bit[P_width - 1: 0]   O_value;

  always @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset)
      O_value <= {P_width {1'b0}};
    else begin
      for (integer i = 0; i < P_width; ++i)
      begin
        if (I_clear[i])
          O_value[i] <= 1'b0;
        else if (I_set[i])
          O_value[i] <= 1'b1;
      end
    end
  end

endmodule
