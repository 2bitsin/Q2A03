
module core_isexec (I_clock, I_reset, I_irq, I_nmi, O_addr, O_wr_data, I_rd_data, O_rdwr, I_ready, O_sync, O_phy2);

  import core_alu_signals::*;

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
                          
/* Input/Output section */

  input   wire        I_clock;
  input   wire        I_reset;
  input   wire        I_irq;
  input   wire        I_nmi;
  input   wire        I_ready;
  input   wire[7:0]   I_rd_data;
  output  bit[7:0]    O_wr_data;
  output  bit         O_rdwr;
  output  bit[15:0]   O_addr;
  output  wire        O_sync;  
  output  wire        O_phy2;

/* Debug state */
`ifdef VERILATOR
  reg32_type    debug_tick    ;
`endif


/* Timing generation */

  bit           last_phy2     ;
  bit           last_sync     ;
  bit[3:0]      tick          ;
 
  wire          edge_fall     = I_ready && I_reset && (last_phy2 && ~O_phy2);
  wire          sync_rise     = ~last_sync && O_sync;
  
  assign O_sync = ((curr_t == 0) && I_reset); 
  assign O_phy2 = (tick >= 6);  

/* Register interface */

  wire[3:0]     curr_t        ;
  wire[7:0]     curr_ir       ;
  wire[7:0]     curr_a        ;
  wire[7:0]     curr_x        ;
  wire[7:0]     curr_y        ;
  wire[7:0]     curr_s        ;
  wire[7:0]     curr_p        ;
  wire[7:0]     curr_dr       ;
  wire[15:0]    curr_pc       ;
  wire[15:0]    curr_ad       ;
  wire[15:0]    curr_ba       ;
  
  reg4_type     next_t        ;
  reg8_type     next_ir       ;
  reg8_type     next_a        ;
  reg8_type     next_x        ;
  reg8_type     next_y        ;
  reg8_type     next_s        ;
  reg8_type     next_p        ;
  reg8_type     next_dr       ;
  reg16_type    next_pc       ;
  reg16_type    next_ad       ;
  reg16_type    next_ba       ;

/* Decoder logic */

  wire[93:0]    G_control;
  core_decode   inst_decode
                ( .I_ir      (curr_ir),
                  .I_t       (curr_t),
                  .O_control (G_control));

/* Misc derivatives */

  wire[15:0]    curr_pc_p1    = curr_pc + 16'd1;
  wire[15:0]    curr_sp       = {8'h01, curr_s};
  wire[7:0]     curr_s_p1     = curr_s  +  8'd1;
  wire[7:0]     curr_s_m1     = curr_s  -  8'd1;
  wire[3:0]     curr_t_p1     = curr_t  +  4'd1;
  wire[7:0]     curr_p_wr     = {curr_p[7:6], 1'b1, ~force_brk, curr_p[3:0]};

/* Addressing logic */

  bit[7:0]      I_addr_lhs    ;
  bit[7:0]      I_addr_rhs    ;  
  bit           I_addr_carry  ;  

  wire[7:0]     O_addr_lhs_p1 = I_addr_lhs + 1; 
  wire[8:0]     O_addr_full   = 9'(I_addr_lhs) + 9'(I_addr_rhs) + 9'(I_addr_carry);
  wire[7:0]     O_addr_sum    = O_addr_full[7:0];
  wire          O_addr_carry  = O_addr_full[8];

  always @(posedge I_clock) 
    if (edge_fall) 
      I_addr_carry <= O_addr_carry;

/* Registers */
 
  register#(4)  reg_t     (I_clock, I_reset, edge_fall, next_t,     curr_t    );
  register      reg_ir    (I_clock, I_reset, edge_fall, next_ir,    curr_ir   );
  register      reg_a     (I_clock, I_reset, edge_fall, next_a,     curr_a    );
  register      reg_x     (I_clock, I_reset, edge_fall, next_x,     curr_x    );
  register      reg_y     (I_clock, I_reset, edge_fall, next_y,     curr_y    );
  register      reg_s     (I_clock, I_reset, edge_fall, next_s,     curr_s    );
  register      reg_dr    (I_clock, I_reset, edge_fall, next_dr,    curr_dr   );
  register#(16) reg_pc    (I_clock, I_reset, edge_fall, next_pc,    curr_pc   );
  register#(16) reg_ad    (I_clock, I_reset, edge_fall, next_ad,    curr_ad   );
  register#(16) reg_ba    (I_clock, I_reset, edge_fall, next_ba,    curr_ba   );
  register      reg_p     (I_clock, I_reset, edge_fall, {next_p[7:6], 2'b10, next_p[3:0]}, curr_p);

/* Arithmetic / Logic controller */

  control_type  I_alu_ctl;
  bit[7:0]      I_alu_lhs;
  bit[7:0]      I_alu_rhs; 
  bit           I_alu_mask_p;
  bit           I_alu_carry;
  bit           I_alu_overflow;
  bit           I_alu_sign; 
  bit           I_alu_zero;
  wire[7:0]     O_alu_result;
  wire          O_alu_carry;  
  wire          O_alu_overflow;
  wire          O_alu_sign;
  wire          O_alu_zero;  
  core_alu      inst_alu  
                ( .I_control     (I_alu_ctl), 
                  .I_mask_p      (I_alu_mask_p),
                  .I_lhs         (I_alu_lhs), 
                  .I_rhs         (I_alu_rhs),                   
                  .I_carry       (I_alu_carry), 
                  .I_overflow    (I_alu_overflow), 
                  .I_sign        (I_alu_sign), 
                  .I_zero        (I_alu_zero), 
                  .O_result      (O_alu_result), 
                  .O_carry       (O_alu_carry), 
                  .O_overflow    (O_alu_overflow), 
                  .O_sign        (O_alu_sign), 
                  .O_zero        (O_alu_zero)); 
    
/* Interrupt controller */

  wire          force_brk;
  wire          force_irq_mask;
  wire[15:0]    vec_addr_lo;
  wire[15:0]    vec_addr_hi;
  core_irq      inst_irq
                ( .I_clock       (I_clock),
                  .I_sync        (sync_rise),
                  .I_reset       (I_reset),
                  .I_nmi         (I_nmi),
                  .I_irq         (I_irq),
                  .I_irq_mask    (curr_p[I_bit]),
                  .O_force_brk   (force_brk),
                  .O_irq_mask    (force_irq_mask),
                  .O_vec_addr_lo (vec_addr_lo),
                  .O_vec_addr_hi (vec_addr_hi));


  `include "core_control.svh"
  
  always @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset)
    begin
      /* Reset state */   
    `ifdef VERILATOR
      debug_tick <= -21;
    `endif 

      tick       <= 0;
      last_phy2  <= 0;

    end else begin

      /* Timing generation */
      tick <= tick + 4'b1;
      if (tick >= 11)
        tick <= 4'b0;
      last_phy2 <= O_phy2;
      last_sync <= O_sync;

    `ifdef VERILATOR
      if (edge_fall)
        debug_tick <= debug_tick + 3;
    `endif
    end    
  end
  
`ifdef VERILATOR
  task read_state;
    output reg8_type  a;
    output reg8_type  x;
    output reg8_type  y; 
    output reg8_type  s; 
    output reg8_type  p; 
    output reg8_type  ir; 
    output reg16_type pc;     
    output reg32_type t;
    begin
      a   = curr_a;
      x   = curr_x;
      y   = curr_y;
      s   = curr_s;      
      p   = curr_p;
      ir  = curr_ir;
      pc  = curr_pc;      
      t   = debug_tick;
    end
  endtask;
  export "DPI-C" task read_state;

`endif



endmodule