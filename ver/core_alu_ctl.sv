  package core_alu_ctl;

    typedef enum logic[3:0] 
    {
      control_nop = 4'h0,
      control_adc = 4'h1,
      control_sbc = 4'h2,
      control_cmp = 4'h3,

      control_bit = 4'h4,
      control_and = 4'h5,
      control_or  = 4'h6,
      control_xor = 4'h7,    

      control_rol = 4'h8,
      control_ror = 4'h9,
      control_asl = 4'hA,
      control_lsr = 4'hB,

      control_inc = 4'hC,
      control_dec = 4'hD,
      control_txl = 4'hE,
      control_txr = 4'hF
    } control_type;

  endpackage
  
  