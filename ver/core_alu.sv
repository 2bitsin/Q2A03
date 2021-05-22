package core_alu_signals;
  parameter control_inv_O_carry  = 0; 
  parameter control_flags_rhs    = 1;
  parameter control_result_sign  = 2;
  parameter control_inv_I_carry  = 3;

  parameter control_invert_rhs   = 4;
  parameter control_set_carry    = 5;
  parameter control_clear_carry  = 6;
  parameter control_adc_overflow = 7;

  parameter control_clear_rhs    = 8;
  parameter control_select_rhs   = 9;
  parameter control_select_adc   = 10;
  parameter control_select_and   = 11;  
  parameter control_select_or    = 12 ;
  parameter control_select_xor   = 13 ;
  parameter control_select_rol   = 14 ;
  parameter control_select_ror   = 15 ;
  parameter control_result_zero  = 16;
  parameter control_carry_sign   = 17;    
  
  typedef enum logic[17:0]
  {
    control_nop    = 18'b00_0000_0000_0000_0000,
    control_txl    = 18'b01_0000_0000_0010_0100,
    control_txr    = 18'b01_0000_0010_0010_0100,
    control_adc    = 18'b01_0000_0100_1010_0100,
    control_sbc    = 18'b01_0000_0100_1011_0101,
    control_inc    = 18'b01_0000_0101_0100_1100,
    control_dec    = 18'b01_0000_0101_0101_0100,
    control_cmp    = 18'b01_0000_0100_0111_1101,
    control_bit    = 18'b01_0000_1000_0000_0010,
    control_and    = 18'b01_0000_1000_0000_0100,
    control_anc    = 18'b11_0000_1000_0000_0100,      
    control_or     = 18'b01_0001_0000_0000_0100,
    control_xor    = 18'b01_0010_0000_0000_0100,
    control_rol    = 18'b01_0100_0000_0010_0100,
    control_ror    = 18'b01_1000_0000_0010_0100,
    control_asl    = 18'b01_0100_0000_0110_0100,
    control_lsr    = 18'b01_1000_0000_0110_0100
  } control_type;
endpackage

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

  always @* 
  begin

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
         
    O_result = I_lhs;                                   // =lhs
    if (I_control[control_select_rhs])
      O_result = rhs[7:0];                              // =rhs
    else if (I_control[control_select_adc])
      {carry, O_result} = 9'(I_lhs) + rhs + 9'(carry);  // adc
    else if (I_control[control_select_and])
      O_result = I_lhs & rhs[7:0];                      // and
    else if (I_control[control_select_or])
      O_result = I_lhs | rhs[7:0];                      // or
    else if (I_control[control_select_xor])
      O_result = I_lhs ^ rhs[7:0];                      // xor
    else if (I_control[control_select_rol])
      {carry, O_result} = {I_lhs, carry};               // asl
    else if (I_control[control_select_ror])
      {O_result, carry} = {carry, I_lhs};               // lsr      
    
    O_overflow  = I_overflow;
    O_sign      = I_sign;    
    O_carry     = I_carry;
    O_zero      = I_zero;
    
    if (I_mask_p)
    begin  
      if (I_control[control_flags_rhs])
        O_overflow = I_rhs[6];
      else if (I_control[control_adc_overflow])
        O_overflow = (I_lhs[7] != O_result[7]) && (I_lhs[7] == rhs[7]);
    
      if (I_control[control_flags_rhs])
        O_sign = I_rhs[7];
      else if (I_control[control_result_sign])
        O_sign = O_result[7];

      if (I_control[control_inv_O_carry])
        O_carry = ~carry;
      else if (I_control[control_set_carry])
        O_carry = carry;
      else if (I_control[control_carry_sign])
        O_carry = O_result[7];

      if (I_control[control_result_zero])
        O_zero = ~|O_result;
    end
  end

endmodule

