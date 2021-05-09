module core_alu (I_control, I_mask_p, I_lhs, I_rhs, I_carry, I_overflow, I_sign, I_zero, O_result, O_carry, O_overflow, O_sign, O_zero);

  import core_alu_signals::*;

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
    rhs = 9'(I_rhs);
    if (I_control[control_clear_rhs])
      rhs = 9'd0;
    if (I_control[control_invert_rhs])
      rhs = ~rhs;
  end

  always @* 
  begin    

    carry = I_carry;
    if (I_control[control_clear_carry])
      carry = 1'b0;
    if (I_control[control_inv_I_carry])
      carry = ~carry;

    unique case (I_control[control_select_b2:control_select_b0])
      3'd0: O_result = I_lhs;                                 // =lhs 000
      3'd1: O_result = rhs[7:0];                              // =rhs 001
      3'd2: {carry, O_result} = 9'(I_lhs) + rhs + 9'(carry);  // adc  010
      3'd3: O_result = I_lhs & rhs[7:0];                      // and  011
      3'd4: O_result = I_lhs | rhs[7:0];                      // or   100
      3'd5: O_result = I_lhs ^ rhs[7:0];                      // xor  101
      3'd6: {carry, O_result} = {I_lhs, carry};               // asl  110
      3'd7: {O_result, carry} = {carry, I_lhs};               // lsr  111      
    endcase
  end 

  always @* 
  begin
    O_overflow = I_overflow;
    if (I_mask_p)
    begin  
      if (I_control[control_flags_rhs])
        O_overflow = I_rhs[6];
      else if (I_control[control_adc_overflow])
        O_overflow = (I_lhs[7] != O_result[7]) && (I_lhs[7] == rhs[7]);
    end
  end

  always @*
  begin    
    O_sign = I_sign;    
    if (I_mask_p)
    begin      
      if (I_control[control_flags_rhs])
        O_sign = I_rhs[7];
      else if (I_control[control_result_sign])
        O_sign = O_result[7];
    end
  end

  always @*
  begin
    O_carry = I_carry;
    if (I_mask_p)
    begin
      if (I_control[control_inv_O_carry])
        O_carry = ~carry;
      else if (I_control[control_set_carry])
        O_carry = carry;
    end
  end  

  always @*
  begin
    O_zero = I_zero;
    if (I_mask_p)
    begin
      if (I_control[control_result_zero])
        O_zero = ~|O_result;
    end
  end

endmodule

