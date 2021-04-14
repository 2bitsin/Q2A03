
module Q2A03 (G_clock, G_reset, G_irq, G_nmi, G_addr, G_wr_data, G_rd_data, G_rdwr, G_ready, G_sync, G_phy2);

  `define C_bit   0
  `define Z_bit   1
  `define I_bit   2
  `define D_bit   3
  `define B_bit   4

  `define O_bit   6
  `define N_bit   7

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
  output  wire[7:0]   G_wr_data;
  output  bit         G_rdwr;
  output  bit[15:0]   G_addr;
  output  wire        G_sync;  
  output  wire        G_phy2;

/* Begin debug state */
  reg32_type  debug_tick    = 0;
/* End debug state */
  bit[3:0]    tick          = 4'hf;
  bit         phy1          = 0;
  wire        edge_rise     = G_reset && (G_phy2 && ~phy1);
  wire        edge_fall     = G_reset && (phy1 && ~G_phy2);
  wire        is_op ;

  assign G_sync = ((curr_cycle == 0) && G_reset); 
  assign G_phy2 = (tick >= 6);

  reg4_type   curr_cycle    = 4'hf;  
  reg8_type   curr_a        = 0 ;
  reg8_type   curr_x        = 0 ;
  reg8_type   curr_y        = 0 ;
  reg8_type   curr_s        = 0 ;
  reg8_type   curr_pcl      = 0 ;
  reg8_type   curr_pch      = 0 ;
  reg8_type   curr_p        = 0 ;
  reg8_type   curr_ir       = 0 ;
  reg8_type   curr_adl      = 0 ;
  reg8_type   curr_adh      = 0 ;
  wire[15:0]  curr_pc       = {curr_pch, curr_pcl};
  wire[15:0]  curr_ad       = {curr_adh, curr_adl};

  reg4_type   next_cycle    = 4'h0;
  reg8_type   next_a        = 0 ;
  reg8_type   next_x        = 0 ;
  reg8_type   next_y        = 0 ;
  reg8_type   next_s        = 0 ;
  reg8_type   next_pch      = 8'hC0 ;
  reg8_type   next_pcl      = 0 ;
  reg8_type   next_p        = 0 ;
  reg8_type   next_ir       = 0 ;
  reg8_type   next_adl      = 0 ;
  reg8_type   next_adh      = 0 ;
  wire[15:0]  next_pc       = {next_pch, next_pcl} ;
  wire[15:0]  next_ad       = {next_adh, next_adl} ;

  wire t0 = curr_cycle == 0;  
  wire t1 = curr_cycle == 1;  
  wire t2 = curr_cycle == 2;  
  wire t3 = curr_cycle == 3;  
  wire t4 = curr_cycle == 4;  
  wire t5 = curr_cycle == 5;  
  wire t6 = curr_cycle == 6;  
  wire t7 = curr_cycle == 7; 

  wire o0 = curr_ir[0];
  wire o1 = curr_ir[1];
  wire o2 = curr_ir[2];
  wire o3 = curr_ir[3];
  wire o4 = curr_ir[4];
  wire o5 = curr_ir[5];
  wire o6 = curr_ir[6];
  wire o7 = curr_ir[7];

  always @*
  begin
    `include "cycles.sv"
  end

  always @(posedge G_clock, negedge G_reset)
  begin
    if (~G_reset)
    begin
      /* Reset state */

      debug_tick    <= -3;
      tick          <= 4'hf;
      phy1          <= 1;

      curr_a        <= 0;
      curr_x        <= 0;
      curr_y        <= 0;
      curr_s        <= 0;
      curr_p        <= 0;
      curr_pch      <= 8'hC0;
      curr_pcl      <= 0;
      curr_ir       <= 0;

      curr_cycle    <= 4'hf;

    end else 
    begin
      /* Clock divider */
      tick <= tick + 4'b1;
      if (tick >= 11)
        tick <= 4'b0;
      phy1 <= G_phy2;

      /* Latch state */
      if (edge_fall)
      begin
        debug_tick    <= debug_tick + 3;

        curr_a        <= next_a ;   
        curr_x        <= next_x ;   
        curr_y        <= next_y ;   
        curr_s        <= next_s ;   
        curr_p        <= next_p ;   
        curr_pch      <= next_pch ;   
        curr_pcl      <= next_pcl ;   
        curr_ir       <= next_ir ;  
        curr_adh      <= next_adh ;
        curr_adl      <= next_adl ;   
        curr_cycle    <= next_cycle ; 
 
      end

    end
  end

endmodule