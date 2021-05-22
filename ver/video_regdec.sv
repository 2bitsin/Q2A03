module video_regdec (I_addr, I_wren, I_rden, O_reg, O_reg_wren, O_reg_rden);

  input   wire[2:0]   I_addr;
  input   wire        I_wren;
  input   wire        I_rden;

  output  wire[7:0]   O_reg;
  output  wire[7:0]   O_reg_wren;
  output  wire[7:0]   O_reg_rden;
  
  decoder #(.P_width(3)) inst_decode (I_addr, O_reg);

  assign O_reg_wren = O_reg & {8 {I_wren}};
  assign O_reg_rden = O_reg & {8 {I_rden}};

endmodule