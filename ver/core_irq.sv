module core_irq(I_clock, I_enable, I_reset, I_nmi, I_irq, I_irq_mask, O_force_brk, O_vec_addr_lo, O_vec_addr_hi, O_irq_mask);

  input   wire       I_clock       ;
  input   wire       I_enable      ;  
  input   wire       I_reset       ;
  input   wire       I_nmi         ;
  input   wire       I_irq         ; 
  input   wire       I_irq_mask    ;
  output  wire       O_force_brk   ;
  output  wire       O_irq_mask    ;
  output  wire[15:0] O_vec_addr_lo ;
  output  wire[15:0] O_vec_addr_hi ;

/* Interrupt handling */
  
  bit[3:0]      vec_addr      ;  
    
  bit           irq_p         ;
  bit           res_p         ;  
  bit           nmi_p         ;

  bit           last_nmi      ;

  bit           raise_nmi     ;
  bit           raise_res     ;
  wire          raise_irq     ;  

  assign        O_force_brk   = irq_p | res_p | nmi_p;
  assign        O_irq_mask    = 0; //irq_p | res_p | I_irq_mask;
  assign        O_vec_addr_lo = {12'hFFF, vec_addr};
  assign        O_vec_addr_hi = {12'hFFF, vec_addr + 4'd1};
  assign        raise_irq     = ~I_irq & ~I_irq_mask;


  always @(*)
  if (~I_reset)
  begin
    vec_addr = 4'hE;
  end else begin
    vec_addr = 4'hE;
    if (nmi_p) 
      vec_addr = 4'hA;
    else if (res_p) 
      vec_addr = 4'hC;    
  end

  always @(posedge I_clock, negedge I_reset)
  if (~I_reset)
  begin
    
    /* Reset all flip flops */

    last_nmi   <= 0;

    res_p      <= 0;
    nmi_p      <= 0;
    irq_p      <= 0;
    
    raise_nmi  <= 0;

    /* Assert reset vector */
    raise_res  <= 1; 

  end else begin

    /* NMI edge detecton */
    last_nmi <= I_nmi;
    if (last_nmi & ~I_nmi)
      raise_nmi <= 1;      

    /* Interrupt drive logic */
    if (I_enable)
    begin        

      /* Interrupt request latched */
      if (raise_res) 
        res_p <= raise_res;
      if (raise_nmi) 
        nmi_p <= raise_nmi;

      irq_p <= raise_irq;
      
      /* Reset inputs after latchig */
      raise_res <= 0;
      raise_nmi <= 0;

      /* Finished servicing interrupt */
      if (res_p) res_p <= 0; else
      if (nmi_p) nmi_p <= 0; else
      if (irq_p) irq_p <= 0;         
    end 
  end

endmodule

