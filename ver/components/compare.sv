module compare (I_value, I_lower, I_upper, O_inside, O_outside);
  parameter P_width = 16;

  input   wire[P_width - 1:0]   I_value   ;
  input   wire[P_width - 1:0]   I_lower   ;
  input   wire[P_width - 1:0]   I_upper   ;
  output  wire                  O_outside ;
  output  wire                  O_inside  ;
   
  assign  O_inside              = (I_value >= I_lower) && (I_value < I_upper) ;
  assign  O_outside             = ~O_inside ;

endmodule