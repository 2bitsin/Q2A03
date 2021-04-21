
module Q2A03 (G_clock, G_reset, G_irq, G_nmi, G_addr, G_wr_data, G_rd_data, G_rdwr, G_ready, G_sync, G_phy2);

  localparam C_bit = 0 ;
  localparam Z_bit = 1 ;
  localparam I_bit = 2 ;
  localparam D_bit = 3 ;
  localparam B_bit = 4 ;
  localparam X_bit = 5 ;
  localparam V_bit = 6 ;
  localparam N_bit = 7 ;

  localparam C_mask = (8'h01 << C_bit);
  localparam Z_mask = (8'h01 << Z_bit);
  localparam I_mask = (8'h01 << I_bit);
  localparam D_mask = (8'h01 << D_bit);
  localparam B_mask = (8'h01 << B_bit);
  localparam X_mask = (8'h01 << X_bit);
  localparam V_mask = (8'h01 << V_bit);
  localparam N_mask = (8'h01 << N_bit);

  typedef bit[1:0]          reg2_type;
  typedef bit[2:0]          reg3_type;
  typedef bit[3:0]          reg4_type;
  typedef byte unsigned     reg8_type;
  typedef shortint unsigned reg16_type;
  typedef int unsigned      reg32_type;
                          
  input   wire        G_clock;
  input   wire        G_reset;
  input   wire        G_irq;
  input   wire        G_nmi;
  input   wire        G_ready;
  input   wire[7:0]   G_rd_data;
  output  bit[7:0]    G_wr_data;
  output  bit         G_rdwr;
  output  bit[15:0]   G_addr;
  output  wire        G_sync;  
  output  wire        G_phy2;

/* Begin debug state */
  reg32_type  debug_tick  ;
/* End debug state */

  bit[3:0]    tick  ;
  bit         phy1  ;
  bit         last_nmi ;

  wire        edge_rise     = G_reset && (G_phy2 && ~phy1);
  wire        edge_fall     = G_reset && (phy1 && ~G_phy2);

  assign G_sync = ((curr_cycle == 0) && G_reset); 
  assign G_phy2 = (tick >= 6);  

  reg4_type   curr_cycle    ;
  reg8_type   curr_a        ;
  reg8_type   curr_x        ;
  reg8_type   curr_y        ;
  reg8_type   curr_s        ;
  reg8_type   curr_pcl      ;
  reg8_type   curr_pch      ;
  reg8_type   curr_p        ;
  reg8_type   curr_ir       ;
  reg8_type   curr_adl      ;
  reg8_type   curr_adh      ;
  reg8_type   curr_bal      ;
  reg8_type   curr_bah      ;

  reg4_type   next_cycle    ;
  reg8_type   next_a        ;
  reg8_type   next_x        ;
  reg8_type   next_y        ;
  reg8_type   next_s        ;
  reg8_type   next_pch      ;
  reg8_type   next_pcl      ;
  reg8_type   next_p        ;
  reg8_type   next_ir       ;
  reg8_type   next_adl      ;
  reg8_type   next_adh      ;
  reg8_type   next_bal      ;
  reg8_type   next_bah      ;
  
/* Misc derivatives */

  wire[15:0]  curr_pc       = {curr_pch, curr_pcl};
  wire[15:0]  curr_ad       = {curr_adh, curr_adl};
  wire[15:0]  curr_ba       = {curr_bah, curr_bal};  

  wire[15:0]  next_pc       = {next_pch, next_pcl};
  wire[15:0]  next_ad       = {next_adh, next_adl};
  wire[15:0]  next_ba       = {next_bah, next_bal};

  wire[15:0]  curr_sp       = {8'h01, curr_s};

  reg16_type  vec_addr      ;  
  wire[15:0]  vec_addr_lo   = vec_addr;
  wire[15:0]  vec_addr_hi   = vec_addr + 1;

  wire        irq_p         = ~G_irq & ~curr_p[I_bit];
  bit         res_p         ;  
  bit         nmi_p         ;
  wire        force_brk     = irq_p | res_p | nmi_p;
  bit         is_soft_brk   ;

/* Arithmetic / Logic operations */

  bit         alu_in_c      ;
  reg8_type   alu_in_lhs    ;
  reg8_type   alu_in_rhs    ;
  wire[7:0]   alu_out_rhs   = alu_in_rhs;

  wire[7:0]   alu_and       = alu_in_lhs & alu_in_rhs;
  wire[7:0]   alu_or        = alu_in_lhs | alu_in_rhs;
  wire[7:0]   alu_xor       = alu_in_lhs ^ alu_in_rhs;  

  wire[7:0]   alu_ror       = {alu_in_c, alu_in_lhs[7:1]};
  wire        alu_ror_c     = alu_in_lhs[0];
  
  wire[7:0]   alu_rol       = {alu_in_lhs[6:0], alu_in_c};
  wire        alu_rol_c     = alu_in_lhs[7];

  wire[7:0]   alu_cmp       = alu_in_lhs - alu_in_rhs;
  wire        alu_cmp_n     = alu_cmp[7];
  wire        alu_cmp_z     = alu_in_lhs == alu_in_rhs;
  wire        alu_cmp_c     = alu_cmp_z || (alu_in_lhs > alu_in_rhs);

  wire[8:0]   alu_adc       = alu_in_lhs + alu_in_rhs + {7'b0, alu_in_c};  
  wire        alu_adc_c     = alu_adc[8];
  wire        alu_adc_v     = (alu_in_lhs[7] != alu_adc[7]) && (alu_in_lhs[7] == alu_in_rhs[7]);

  wire[8:0]   alu_sbc       = alu_in_lhs - alu_in_rhs - {7'b0, ~alu_in_c};  
  wire        alu_sbc_c     = ~alu_sbc[8];
  wire        alu_sbc_v     = ((alu_in_lhs[7] != alu_sbc[7]) && (alu_in_lhs[7] != alu_in_rhs[7]));

/* End of Arithmetic / Logic operations */

  always @* 
  if (G_ready)
  begin          
    if (~|curr_cycle)
    begin
      is_soft_brk = ~force_brk;      

           if (irq_p     ) vec_addr = 16'hFFFE;
      else if (nmi_p     ) vec_addr = 16'hFFFA;
      else if (res_p     ) vec_addr = 16'hFFFC; 
      else if (~force_brk) vec_addr = 16'hFFFE;
    end

    `include "cycles.sv"
  end
  
  always @(posedge G_clock, negedge G_reset)
  begin
    if (~G_reset)
    begin
      /* Reset state */
      
      next_cycle    = 0;
      next_a        = 0;
      next_x        = 0;
      next_y        = 0;
      next_s        = 0;
      next_p        = 8'h00;
      next_pch      = 0;
      next_pcl      = 0;
      next_ir       = 0;
      next_adl      = 0;
      next_adh      = 0;
      next_bal      = 0;
      next_bah      = 0;
      
      debug_tick    <= -21;
      tick          <= 0;
      phy1          <= 0;
      res_p         <= 1;
      
      curr_cycle    <= next_cycle ;  
      curr_a        <= next_a ;   
      curr_x        <= next_x ;   
      curr_y        <= next_y ;   
      curr_s        <= next_s ;   
      curr_p        <= {next_p[7:6], 2'b10, next_p[3:0]};
      curr_pch      <= next_pch ;   
      curr_pcl      <= next_pcl ;   
      curr_ir       <= next_ir ;  
      curr_adh      <= next_adh ;
      curr_adl      <= next_adl ;   
      curr_bah      <= next_bah ;
      curr_bal      <= next_bal ;             
      
    end else 
    begin
      /* Clock divider */
      if (G_ready)
      begin
        tick <= tick + 4'b1;
        if (tick >= 11)
          tick <= 4'b0;
        phy1 <= G_phy2; 
        last_nmi <= G_nmi;       
      end

      /* Nmi edge detecton */
      if (last_nmi & ~G_nmi)
        nmi_p <= 1;

      /* Latch state */
      if (edge_fall)
      begin
        if (&curr_cycle)         
          curr_cycle <= 0;  

        if (curr_cycle == 0)
        begin
          if (nmi_p) nmi_p <= 0;
          if (res_p) res_p <= 0;
        end

        debug_tick    <= debug_tick + 3;
        curr_cycle    <= next_cycle ;  
        curr_a        <= next_a ;   
        curr_x        <= next_x ;   
        curr_y        <= next_y ;   
        curr_s        <= next_s ;   
        curr_p        <= {next_p[7:6], 2'b10, next_p[3:0]};
        curr_pch      <= next_pch ;   
        curr_pcl      <= next_pcl ;   
        curr_ir       <= next_ir ;  
        curr_adh      <= next_adh ;
        curr_adl      <= next_adl ;   
        curr_bah      <= next_bah ;
        curr_bal      <= next_bal ;         
      end
    end    
  end

  task read_state;
    output reg8_type a;
    output reg8_type x;
    output reg8_type y; 
    output reg8_type s; 
    output reg8_type p; 
    output reg8_type ir; 
    output reg8_type pcl; 
    output reg8_type pch;
    output reg32_type cyc;
    begin
      a   = curr_a;
      x   = curr_x;
      y   = curr_y;
      s   = curr_s;      
      p   = curr_p;
      ir  = curr_ir;
      pcl = curr_pcl;
      pch = curr_pch;
      cyc = debug_tick;
    end
  endtask;
  export "DPI-C" task read_state;

endmodule