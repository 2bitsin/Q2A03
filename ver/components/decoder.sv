module decoder (I_packed, O_unpacked);
  parameter P_width = 3;
  parameter P_unpacked_width = 2**P_width;

  output  wire[P_unpacked_width - 1: 0] O_unpacked;
  input   wire[P_width - 1: 0]          I_packed;

  genvar i;

  generate
    for (i = 0; i < P_unpacked_width; ++i) 
		begin: l0
      assign O_unpacked[i] = I_packed == i;
		end
  endgenerate

endmodule
