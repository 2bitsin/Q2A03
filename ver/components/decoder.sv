module decoder (I_packed, O_unpacked);

  parameter P_width     = 3;
  parameter P_up_width  = 2**P_width;

  typedef bit[P_up_width - 1: 0] t;

  input   wire[P_width    - 1: 0] I_packed;
  output  wire[P_up_width - 1: 0] O_unpacked;

  assign O_unpacked = t' (1) << I_packed;
endmodule
