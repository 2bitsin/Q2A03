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
  
  