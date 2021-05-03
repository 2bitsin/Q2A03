`include "core_alu.svi"

module core_alu (I_control, I_lhs, I_rhs, I_carry, I_overflow, I_sign, I_zero, O_result, O_carry, O_overflow, O_sign, O_zero);

  input control_type I_control;
  input wire[7:0] I_lhs;
  input wire[7:0] I_rhs;
  input wire I_carry;
  input wire I_overflow;
  input wire I_sign;
  input wire I_zero;
  
  output bit[7:0] O_result;
  output bit O_carry;
  output bit O_overflow;
  output bit O_sign;
  output bit O_zero;

  bit[8:0] I_rhs9;
  bit[8:0] I_carry9;

  always @(*)
  begin
    O_result    = I_lhs;
    O_carry     = I_carry;
    O_overflow  = I_overflow;
    O_sign      = I_sign;
    O_zero      = I_zero;

    I_rhs9      = 9' (I_rhs);
    I_carry9    = 9' (I_carry);

    case (I_control)
      control_sbc: 
        I_rhs9 = ~I_rhs9;

      control_inc:
        I_rhs9 = 9'd1;

      control_dec:
        I_rhs9 = -9'd1;

      default:;
    endcase    

    case (I_control)
      
      control_cmp, 
      control_inc, 
      control_dec: 
        I_carry9 = 9'd0;

      default:;
    endcase

    unique case (I_control) 
      control_adc, 
      control_sbc, 
      control_cmp, 
      control_inc, 
      control_dec: 
      begin      
        {O_carry, O_result} = 9' (I_lhs) + I_rhs9 + I_carry9;
        O_overflow = (I_lhs[7] != O_result[7]) && (I_lhs[7] == I_rhs9[7]);        
      end

      control_bit, control_and: 
        O_result = I_lhs & I_rhs;

      control_or: 
        O_result = I_lhs | I_rhs;

      control_xor: 
        O_result = I_lhs ^ I_rhs;      
      
      control_rol:
        {O_carry, O_result} = {I_lhs, I_carry};

      control_asl:
        {O_carry, O_result} = {I_lhs, 1'b0};

      control_ror:
        {O_result, O_carry} = {I_carry, I_lhs};

      control_lsr:
        {O_result, O_carry} = {1'b0, I_lhs};

      control_txl: 
        O_result = I_lhs;

      control_txr: 
        O_result = I_rhs;
 
      default:;
    endcase
    
    if (I_control != control_nop)
    begin
      O_zero = O_result == 0;
      O_sign = O_result[7];      
    end

    unique case(I_control)
      control_sbc:
        O_carry = ~O_carry;                    

      control_cmp: 
        O_carry = O_zero || (I_lhs > I_rhs);
      
      control_bit: 
      begin
        O_overflow = I_rhs[6];
        O_sign = I_rhs[7];
      end

      default:;
    endcase
  end

endmodule

