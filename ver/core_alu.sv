module core_alu (I_control, I_mask_p, I_lhs, I_rhs, I_carry, I_overflow, I_sign, I_zero, O_result, O_carry, O_overflow, O_sign, O_zero);

  import core_alu_ctl::*;

  input control_type I_control;  
  input wire[3:0] I_mask_p;
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

    if (I_control[control_sbc_bit]) I_rhs9 = ~I_rhs9;
    if (I_control[control_inc_bit]) I_rhs9 = +9'd1;
    if (I_control[control_dec_bit]) I_rhs9 = -9'd1;
    
    if (I_control[control_cmp_bit] | I_control[control_inc_bit] | I_control[control_dec_bit]) 
      I_carry9 = 9'd0;      

    if (I_control[control_adc_bit] | I_control[control_sbc_bit])
    begin      
      {O_carry, O_result} = 9' (I_lhs) + I_rhs9 + I_carry9;
      O_overflow = (I_lhs[7] != O_result[7]) && (I_lhs[7] == I_rhs9[7]);
    end

    if (I_control[control_inc_bit]) O_result = I_lhs + 1; 
    if (I_control[control_dec_bit]) O_result = I_lhs - 1;
    if (I_control[control_cmp_bit]) O_result = I_lhs - I_rhs;
    if (I_control[control_bit_bit] | I_control[control_and_bit]) O_result = I_lhs & I_rhs;
    if (I_control[control_oor_bit]) O_result = I_lhs | I_rhs;
    if (I_control[control_xor_bit]) O_result = I_lhs ^ I_rhs;            
    if (I_control[control_rol_bit]) {O_carry, O_result} = {I_lhs, I_carry};
    if (I_control[control_asl_bit]) {O_carry, O_result} = {I_lhs, 1'b0};
    if (I_control[control_ror_bit]) {O_result, O_carry} = {I_carry, I_lhs};
    if (I_control[control_lsr_bit]) {O_result, O_carry} = {1'b0, I_lhs};
    if (I_control[control_txl_bit]) O_result = I_lhs;
    if (I_control[control_txr_bit]) O_result = I_rhs; 
            
    if (|I_control)
    begin
      O_zero = O_result == 0;
      O_sign = O_result[7];      
    end
    
    if (I_control[control_sbc_bit]) O_carry = ~O_carry;                    
    if (I_control[control_cmp_bit]) O_carry = O_zero || (I_lhs > I_rhs);      
    if (I_control[control_bit_bit])
    begin
      O_overflow = I_rhs[6];
      O_sign = I_rhs[7];
    end

    if (~I_mask_p[0]) O_carry    = I_carry;
    if (~I_mask_p[1]) O_zero     = I_zero;      
    if (~I_mask_p[2]) O_overflow = I_overflow;
    if (~I_mask_p[3]) O_sign     = I_sign;    
  end

endmodule

