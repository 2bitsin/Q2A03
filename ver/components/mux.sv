module mux (I_select, I_data, O_data);

  parameter   P_select_width  = 1;
  parameter   P_data_width    = 1;
  
  localparam  P_channels      = 2**P_select_width;

  input   wire  [P_select_width - 1: 0] I_select  ;
  input   wire  [P_data_width   - 1: 0] I_data    [0: P_channels - 1];
  output  logic [P_data_width   - 1: 0] O_data    ;

  assign O_data = I_data[I_select];

endmodule