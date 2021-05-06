  package core_alu_ctl;
    
    parameter control_adc_bit = 1;
    parameter control_sbc_bit = 2;
    parameter control_cmp_bit = 3;
    parameter control_bit_bit = 4;
    parameter control_and_bit = 5;
    parameter control_oor_bit = 6;
    parameter control_xor_bit = 7;
    parameter control_rol_bit = 8;
    parameter control_ror_bit = 9;
    parameter control_asl_bit = 10;
    parameter control_lsr_bit = 11;
    parameter control_inc_bit = 12;
    parameter control_dec_bit = 13;
    parameter control_txl_bit = 14;
    parameter control_txr_bit = 15;

    parameter control_nop = 16'd0;
    parameter control_adc = 16'(1 << control_adc_bit);
    parameter control_sbc = 16'(1 << control_sbc_bit);
    parameter control_cmp = 16'(1 << control_cmp_bit);
    parameter control_bit = 16'(1 << control_bit_bit);
    parameter control_and = 16'(1 << control_and_bit);
    parameter control_or  = 16'(1 << control_oor_bit);
    parameter control_xor = 16'(1 << control_xor_bit);
    parameter control_rol = 16'(1 << control_rol_bit);
    parameter control_ror = 16'(1 << control_ror_bit);
    parameter control_asl = 16'(1 << control_asl_bit);
    parameter control_lsr = 16'(1 << control_lsr_bit);
    parameter control_inc = 16'(1 << control_inc_bit);
    parameter control_dec = 16'(1 << control_dec_bit);
    parameter control_txl = 16'(1 << control_txl_bit);
    parameter control_txr = 16'(1 << control_txr_bit);

    typedef logic[15:0] control_type;

  endpackage
  
  