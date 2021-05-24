module decoder (I_packed, O_unpacked);

  parameter     P_width           = 3           ;
  parameter     P_up_width        = 2**P_width  ;  
  input  wire   [P_width    - 1: 0] I_packed    ;
  output logic  [P_up_width - 1: 0] O_unpacked  ;

  generate
    if (P_width == 1) begin
      always_comb begin
        unique case (I_packed)
        default : O_unpacked = 2'b01;
        1'b0    : O_unpacked = 2'b01;
        1'b1    : O_unpacked = 2'b10;
        endcase        
      end
    end else 
    if (P_width == 2) begin
      always_comb begin
        unique case (I_packed)
        default  : O_unpacked = 4'b0001;
        2'b00    : O_unpacked = 4'b0001;
        2'b01    : O_unpacked = 4'b0010;
        2'b10    : O_unpacked = 4'b0100;
        2'b11    : O_unpacked = 4'b1000;
        endcase        
      end          
    end else
    if (P_width == 3) begin
      always_comb begin
        unique case (I_packed)
        default  : O_unpacked = 8'b00000001;
        3'b000   : O_unpacked = 8'b00000001;
        3'b001   : O_unpacked = 8'b00000010;
        3'b010   : O_unpacked = 8'b00000100;
        3'b011   : O_unpacked = 8'b00001000;
        3'b100   : O_unpacked = 8'b00010000;
        3'b101   : O_unpacked = 8'b00100000;
        3'b110   : O_unpacked = 8'b01000000;
        3'b111   : O_unpacked = 8'b10000000;
        endcase        
      end      
    end else
    if (P_width == 4) begin
      always_comb begin
        unique case (I_packed)
        default  : O_unpacked = 16'b0000000000000001;
        4'b0000  : O_unpacked = 16'b0000000000000001;
        4'b0001  : O_unpacked = 16'b0000000000000010;
        4'b0010  : O_unpacked = 16'b0000000000000100;
        4'b0011  : O_unpacked = 16'b0000000000001000;
        4'b0100  : O_unpacked = 16'b0000000000010000;
        4'b0101  : O_unpacked = 16'b0000000000100000;
        4'b0110  : O_unpacked = 16'b0000000001000000;
        4'b0111  : O_unpacked = 16'b0000000010000000;
        4'b1000  : O_unpacked = 16'b0000000100000000;
        4'b1001  : O_unpacked = 16'b0000001000000000;
        4'b1010  : O_unpacked = 16'b0000010000000000;
        4'b1011  : O_unpacked = 16'b0000100000000000;
        4'b1100  : O_unpacked = 16'b0001000000000000;
        4'b1101  : O_unpacked = 16'b0010000000000000;
        4'b1110  : O_unpacked = 16'b0100000000000000;
        4'b1111  : O_unpacked = 16'b1000000000000000;
        endcase        
      end            
    end else begin

      wire[P_up_width / 2 - 1: 0] W_lhs;
      wire[P_up_width / 2 - 1: 0] W_rhs; 
      
      decoder #(.P_width (P_width - 1)) dec_lhs (.I_packed (I_packed[P_width - 1: 0]), .O_unpacked(W_lhs));
      decoder #(.P_width (P_width - 1)) dec_rhs (.I_packed (I_packed[P_width - 1: 0]), .O_unpacked(W_rhs));

      assign O_unpacked = {W_lhs & {P_width - 1 { I_packed[P_width - 1]}}, 
                           W_rhs & {P_width - 1 {~I_packed[P_width - 1]}}};

    end
  endgenerate
endmodule
