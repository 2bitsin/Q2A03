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
    parameter control_select_b0    = 9;
    parameter control_select_b1    = 10;
    parameter control_select_b2    = 11;  

    parameter control_flags_rhs    = 12;
    
    typedef enum logic[12:0]
    {
      control_nop    = 13'b0_0000_0000_0000,
      control_txl    = 13'b0_0000_0010_0110,
      control_txr    = 13'b0_0010_0010_0110,
      control_adc    = 13'b0_0100_1010_0110,
      control_sbc    = 13'b0_0100_1011_0111,
      control_inc    = 13'b0_0101_0100_1110,
      control_dec    = 13'b0_0101_0101_0110,
      control_cmp    = 13'b0_0100_0111_1111,
      control_bit    = 13'b1_0110_0000_0010,
      control_and    = 13'b0_0110_0000_0110,
      control_or     = 13'b0_1000_0000_0110,
      control_xor    = 13'b0_1010_0000_0110,
      control_rol    = 13'b0_1100_0010_0110,
      control_ror    = 13'b0_1110_0010_0110,
      control_asl    = 13'b0_1100_0110_0110,
      control_lsr    = 13'b0_1110_0110_0110

    } control_type;

  endpackage
  
  