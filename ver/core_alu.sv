module core_alu (I_control, I_mask_p, I_lhs, I_rhs, I_carry, I_overflow, I_sign, I_zero, O_result, O_carry, O_overflow, O_sign, O_zero);

  import core_alu_ctl::*;

  input control_type I_control;    
  input wire I_mask_p;
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

  logic[8:0]  rhs;
  logic       carry;

  always @* begin

    O_zero      = I_zero;
    O_overflow  = I_overflow;
    O_sign      = I_sign;
    O_carry     = I_carry;
    O_result    = I_lhs;

    
    rhs = 9'(I_rhs);

    if (I_control[control_clear_rhs])
      rhs = 9'd0;

    if (I_control[control_invert_rhs])
      rhs = ~rhs;

    carry = I_carry;
    if (I_control[control_clear_carry])
      carry = 1'b0;
    if (I_control[control_inv_I_carry])
      carry = ~carry;

    if (I_control[control_rhs_assign])
      O_result = rhs[7:0];
    else if (I_control[control_adc_rhs])
      {carry, O_result} = 9'(I_lhs) + rhs + 9'(carry);
    else if (I_control[control_result_and])
      O_result = I_lhs & rhs[7:0];    
    else if (I_control[control_result_nor])
      O_result = I_lhs | rhs[7:0];    
    else if (I_control[control_result_xor])
      O_result = I_lhs ^ rhs[7:0];
    else if (I_control[control_rotate_left])
      {carry, O_result} = {I_lhs, carry};
    else if (I_control[control_rotate_right])
      {O_result, carry} = {carry, I_lhs};

    if (I_mask_p)
    begin        
      if (I_control[control_adc_overflow])
        O_overflow = (I_lhs[7] != O_result[7]) && (I_lhs[7] == rhs[7]);
      else if (I_control[control_ovfl_rhs_m6])
        O_overflow = I_rhs[6];
    end
      
    if (I_mask_p)
    begin      
      if (I_control[control_result_sign])
        O_sign = O_result[7];
      else if (I_control[control_sign_rhs_m7])
        O_sign = I_rhs[7];      
    end
    
    if (I_mask_p)
    begin
      if (I_control[control_result_zero])
        O_zero = ~|O_result;      
    end

    if (I_control[control_inv_O_carry])
      carry = ~carry;

    if (I_mask_p)
    begin
      if (I_control[control_set_carry])
        O_carry = carry;
    end
  end


endmodule

