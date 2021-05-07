  package core_alu_ctl;
    parameter control_inv_O_carry  = 0; 
    parameter control_result_zero  = 1;
    parameter control_result_sign  = 2;
    parameter control_inv_I_carry  = 3;
  
    parameter control_invert_rhs   = 4;
    parameter control_set_carry    = 5;
    parameter control_clear_carry  = 6;
    parameter control_adc_overflow = 7;
  
    parameter control_clear_rhs    = 8;
    parameter control_adc_rhs      = 9;  //
    parameter control_rotate_left  = 10; //
    parameter control_rotate_right = 11; //
  
    parameter control_result_and   = 12; //
    parameter control_result_nor   = 13; //
    parameter control_result_xor   = 14; //
    parameter control_rhs_assign   = 15; // 
  
    parameter control_sign_rhs_m7  = 16;
    parameter control_ovfl_rhs_m6  = 16;
    
    typedef enum logic[16:0]
    {
      control_nop    = 17'b0_0000_0000_0000_0000,
      control_adc    = 17'b0_0000_0010_1010_0110,
      control_sbc    = 17'b0_0000_0010_1011_0111,
      control_inc    = 17'b0_0000_0011_0100_1110,
      control_dec    = 17'b0_0000_0011_0101_0110,
      control_cmp    = 17'b0_0000_0010_0111_1111,
      control_bit    = 17'b1_0001_0000_0000_0010,
      control_and    = 17'b0_0001_0000_0000_0110,
      control_or     = 17'b0_0010_0000_0000_0110,
      control_xor    = 17'b0_0100_0000_0000_0110,
      control_rol    = 17'b0_0000_0100_0010_0110,
      control_ror    = 17'b0_0000_1000_0010_0110,
      control_asl    = 17'b0_0000_0100_0110_0110,
      control_lsr    = 17'b0_0000_1000_0110_0110,
      control_txr    = 17'b0_1000_0000_0010_0110,
      control_txl    = 17'b0_0000_0000_0010_0110
    } control_type;

  endpackage
  
  