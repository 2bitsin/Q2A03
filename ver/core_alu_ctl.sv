  package core_alu_ctl;
    parameter control_rhs_assign   = 0;
    parameter control_result_zero  = 1;
    parameter control_result_sign  = 2;
    parameter control_inv_I_carry  = 3;
  
    parameter control_invert_rhs   = 4;
    parameter control_adc_rhs      = 5;
    parameter control_clear_carry  = 6;
    parameter control_adc_overflow = 7;
  
    parameter control_rhs_pos_one  = 8;
    parameter control_rhs_neg_one  = 9;
    parameter control_sign_rhs_m7  = 10;
    parameter control_ovfl_rhs_m6  = 11;
  
    parameter control_result_and   = 12;
    parameter control_result_nor   = 13;
    parameter control_result_xor   = 14;
    parameter control_inv_O_carry  = 15;
  
    parameter control_rotate_left  = 16;
    parameter control_rotate_right = 17;
    parameter control_set_carry    = 18;
    
    typedef enum logic[18:0]
    {
      control_nop    = 19'b000_0000_0000_0000_0000,
      control_adc    = 19'b100_0000_0000_1010_0110,
      control_sbc    = 19'b100_1000_0000_1011_0110,
      control_inc    = 19'b000_0000_0001_0110_0110,
      control_dec    = 19'b000_0000_0010_0110_0110,
      control_cmp    = 19'b100_1000_0000_0111_1110,
      control_bit    = 19'b000_0001_1100_0000_0010,
      control_and    = 19'b000_0001_0000_0000_0110,
      control_or     = 19'b000_0010_0000_0000_0110,
      control_xor    = 19'b000_0100_0000_0000_0110,
      control_rol    = 19'b101_0000_0000_0000_0110,
      control_ror    = 19'b110_0000_0000_0000_0110,
      control_asl    = 19'b101_0000_0000_0100_0110,
      control_lsr    = 19'b110_0000_0000_0100_0110,
      control_txr    = 19'b100_0000_0000_0000_0111,
      control_txl    = 19'b100_0000_0000_0000_0110,
      control_adc_ex = 19'b000_0000_0000_0010_0000,
      control_inc_ex = 19'b000_0000_0001_0110_0000
    } control_type;

  endpackage
  
  