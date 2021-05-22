module video_regdec ( I_clock,
                      I_reset,
  
                      I_addr, 
                      O_reg, 
  
                      I_wren, 
                      O_wren_rise,
                      O_wren_fall,
  
                      I_rden,
                      O_rden_rise,
                      O_rden_fall,
  
                      O_reg_wren,
                      O_reg_wrrise, 
                      O_reg_wrfall, 
  
                      O_reg_rden,
                      O_reg_rdrise,
                      O_reg_rdfall);

  input   wire        I_clock;
  input   wire        I_reset;
  
  input   wire[2:0]   I_addr;
  output  wire[7:0]   O_reg;
  
  input   wire        I_wren;
  output  wire        O_wren_rise;
  output  wire        O_wren_fall;

  input   wire        I_rden;
  output  wire        O_rden_rise;
  output  wire        O_rden_fall;

  output  wire[7:0]   O_reg_wren;
  output  wire[7:0]   O_reg_wrrise; 
  output  wire[7:0]   O_reg_wrfall; 

  output  wire[7:0]   O_reg_rden;
  output  wire[7:0]   O_reg_rdrise;
  output  wire[7:0]   O_reg_rdfall;
  
  decoder #(.P_width(3)) inst_decode (
    .I_packed         (I_addr), 
    .O_unpacked       (O_reg)
  );

  edge_trig #(.P_width(2)) inst_edge_d (
    .I_clock          (I_clock), 
    .I_reset          (I_reset), 
    .I_signal         ({I_rden,      I_wren     }),      
    .O_rise           ({O_rden_rise, O_wren_rise}),
    .O_fall           ({O_rden_fall, O_wren_fall})
  );

  assign O_reg_wren   = O_reg & {8 {I_wren}};
  assign O_reg_rden   = O_reg & {8 {I_rden}};
  assign O_reg_wrrise = O_reg & {8 {O_wren_rise}};
  assign O_reg_rdrise = O_reg & {8 {O_rden_rise}};
  assign O_reg_wrfall = O_reg & {8 {O_wren_fall}};
  assign O_reg_rdfall = O_reg & {8 {O_rden_fall}};
  
endmodule