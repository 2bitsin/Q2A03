
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
  bit[3:0]    tick          = 0;
  bit         phy1          = 0;
  wire        edge_rise     = G_phy2 && ~phy1;
  wire        edge_fall     = phy1 && ~G_phy2;

  assign G_sync = ((sync_am_cycle == 0) && G_reset); 
  assign G_phy2 = (tick >= 6);


  reg4_type   sync_am_cycle = 4'hf;
  reg4_type   sync_op_cycle = 4'h0;
  bit         sync_is_op    = 0;

  reg8_type   sync_a        = 0 ;
  reg8_type   sync_x        = 0 ;
  reg8_type   sync_y        = 0 ;
  reg8_type   sync_s        = 0 ;
  reg8_type   sync_pcl      = 0 ;
  reg8_type   sync_pch      = 0 ;
  reg8_type   sync_p        = 0 ;
  reg8_type   sync_ir       = 0 ;
  reg8_type   sync_adl      = 0 ;
  reg8_type   sync_adh      = 0 ;
  wire[15:0]  sync_pc       = {sync_pch, sync_pcl};
  wire[15:0]  sync_ad       = {sync_adh, sync_adl};

  reg4_type   asyn_am_cycle = 4'h0;
  reg4_type   asyn_op_cycle = 4'h0;
  bit         asyn_is_op    = 0;

  reg8_type   asyn_a        = 0 ;
  reg8_type   asyn_x        = 0 ;
  reg8_type   asyn_y        = 0 ;
  reg8_type   asyn_s        = 0 ;
  reg8_type   asyn_pch      = 8'hC0 ;
  reg8_type   asyn_pcl      = 0 ;
  reg8_type   asyn_p        = 0 ;
  reg8_type   asyn_ir       = 0 ;
  reg8_type   asyn_adl      = 0 ;
  reg8_type   asyn_adh      = 0 ;
  wire[15:0]  asyn_pc       = {asyn_pch, asyn_pcl} ;
  wire[15:0]  asyn_ad       = {asyn_adh, asyn_adl} ;

  wire am_cycle_t0          = sync_am_cycle == 0;  
  wire am_cycle_t1          = sync_am_cycle == 1;  
  wire am_cycle_t2          = sync_am_cycle == 2;  
  wire am_cycle_t3          = sync_am_cycle == 3;  
  wire am_cycle_t4          = sync_am_cycle == 4;  
  wire am_cycle_t5          = sync_am_cycle == 5;  
  wire am_cycle_t6          = sync_am_cycle == 6;  
  wire am_cycle_t7          = sync_am_cycle == 7; 

  wire op_cycle_t0          = (sync_is_op || asyn_is_op) && (sync_op_cycle == 0);  
  wire op_cycle_t1          = (sync_is_op || asyn_is_op) && (sync_op_cycle == 1);  
  wire op_cycle_t2          = (sync_is_op || asyn_is_op) && (sync_op_cycle == 2);  
  wire op_cycle_t3          = (sync_is_op || asyn_is_op) && (sync_op_cycle == 3);  
  wire op_cycle_t4          = (sync_is_op || asyn_is_op) && (sync_op_cycle == 4);  
  wire op_cycle_t5          = (sync_is_op || asyn_is_op) && (sync_op_cycle == 5);  
  wire op_cycle_t6          = (sync_is_op || asyn_is_op) && (sync_op_cycle == 6);  
  wire op_cycle_t7          = (sync_is_op || asyn_is_op) && (sync_op_cycle == 7);  

	wire am_implied      = (sync_ir inside { 8'h00, 8'h08, 8'h0A, 8'h18, 8'h1A, 8'h28, 8'h2A, 8'h38, 8'h3A, 8'h40, 8'h48, 8'h4A, 8'h58, 8'h5A, 8'h60, 8'h68, 8'h6A, 8'h78, 8'h7A, 8'h88, 8'h8A, 8'h98, 8'h9A, 8'hA8, 8'hAA, 8'hB8, 8'hBA, 8'hC8, 8'hCA, 8'hD8, 8'hDA, 8'hE8, 8'hEA, 8'hF8, 8'hFA });
	wire am_indirect_x   = (sync_ir inside { 8'h01, 8'h03, 8'h21, 8'h23, 8'h41, 8'h43, 8'h61, 8'h63, 8'h81, 8'h83, 8'hA1, 8'hA3, 8'hC1, 8'hC3, 8'hE1, 8'hE3 });
	wire am_immediate    = (sync_ir inside { 8'h02, 8'h09, 8'h0B, 8'h12, 8'h22, 8'h29, 8'h2B, 8'h32, 8'h42, 8'h49, 8'h4B, 8'h52, 8'h62, 8'h69, 8'h6B, 8'h72, 8'h80, 8'h82, 8'h89, 8'h8B, 8'h92, 8'hA0, 8'hA2, 8'hA9, 8'hAB, 8'hB2, 8'hC0, 8'hC2, 8'hC9, 8'hCB, 8'hD2, 8'hE0, 8'hE2, 8'hE9, 8'hEB, 8'hF2 });
	wire am_zero_page    = (sync_ir inside { 8'h04, 8'h05, 8'h06, 8'h07, 8'h24, 8'h25, 8'h26, 8'h27, 8'h44, 8'h45, 8'h46, 8'h47, 8'h64, 8'h65, 8'h66, 8'h67, 8'h84, 8'h85, 8'h86, 8'h87, 8'hA4, 8'hA5, 8'hA6, 8'hA7, 8'hC4, 8'hC5, 8'hC6, 8'hC7, 8'hE4, 8'hE5, 8'hE6, 8'hE7 });
	wire am_absolute     = (sync_ir inside { 8'h0C, 8'h0D, 8'h0E, 8'h0F, 8'h20, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h6D, 8'h6E, 8'h6F, 8'h8C, 8'h8D, 8'h8E, 8'h8F, 8'hAC, 8'hAD, 8'hAE, 8'hAF, 8'hCC, 8'hCD, 8'hCE, 8'hCF, 8'hEC, 8'hED, 8'hEE, 8'hEF });
	wire am_relative     = (sync_ir inside { 8'h10, 8'h30, 8'h50, 8'h70, 8'h90, 8'hB0, 8'hD0, 8'hF0 });
	wire am_indirect_y   = (sync_ir inside { 8'h11, 8'h13, 8'h31, 8'h33, 8'h51, 8'h53, 8'h71, 8'h73, 8'h91, 8'h93, 8'hB1, 8'hB3, 8'hD1, 8'hD3, 8'hF1, 8'hF3 });
	wire am_zero_page_x  = (sync_ir inside { 8'h14, 8'h15, 8'h16, 8'h17, 8'h34, 8'h35, 8'h36, 8'h37, 8'h54, 8'h55, 8'h56, 8'h57, 8'h74, 8'h75, 8'h76, 8'h77, 8'h94, 8'h95, 8'hB4, 8'hB5, 8'hD4, 8'hD5, 8'hD6, 8'hD7, 8'hF4, 8'hF5, 8'hF6, 8'hF7 });
	wire am_absolute_y   = (sync_ir inside { 8'h19, 8'h1B, 8'h39, 8'h3B, 8'h59, 8'h5B, 8'h79, 8'h7B, 8'h99, 8'h9B, 8'h9E, 8'h9F, 8'hB9, 8'hBB, 8'hBE, 8'hBF, 8'hD9, 8'hDB, 8'hF9, 8'hFB });
	wire am_absolute_x   = (sync_ir inside { 8'h1C, 8'h1D, 8'h1E, 8'h1F, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h5C, 8'h5D, 8'h5E, 8'h5F, 8'h7C, 8'h7D, 8'h7E, 8'h7F, 8'h9C, 8'h9D, 8'hBC, 8'hBD, 8'hDC, 8'hDD, 8'hDE, 8'hDF, 8'hFC, 8'hFD, 8'hFE, 8'hFF });
	wire am_indirect     = (sync_ir inside { 8'h6C });
	wire am_zero_page_y  = (sync_ir inside { 8'h96, 8'h97, 8'hB6, 8'hB7 });
	
	wire op_brk          = (sync_ir inside { 8'h00 });
	wire op_ora          = (sync_ir inside { 8'h01, 8'h05, 8'h09, 8'h0D, 8'h11, 8'h15, 8'h19, 8'h1D });
	wire op_hlt          = (sync_ir inside { 8'h02, 8'h12, 8'h22, 8'h32, 8'h42, 8'h52, 8'h62, 8'h72, 8'h82, 8'h92, 8'hB2, 8'hD2, 8'hF2 });
	wire op_aso          = (sync_ir inside { 8'h03, 8'h07, 8'h0F, 8'h13, 8'h17, 8'h1B, 8'h1F });
	wire op_nop          = (sync_ir inside { 8'h04, 8'h0C, 8'h14, 8'h1A, 8'h1C, 8'h34, 8'h3A, 8'h3C, 8'h44, 8'h54, 8'h5A, 8'h5C, 8'h64, 8'h74, 8'h7A, 8'h7C, 8'h80, 8'h89, 8'hC2, 8'hD4, 8'hDA, 8'hDC, 8'hE2, 8'hF4, 8'hFA, 8'hFC });
	wire op_asl          = (sync_ir inside { 8'h06, 8'h0E, 8'h16, 8'h1E });
	wire op_php          = (sync_ir inside { 8'h08 });
	wire op_asla         = (sync_ir inside { 8'h0A });
	wire op_anc          = (sync_ir inside { 8'h0B, 8'h2B });
	wire op_bpl          = (sync_ir inside { 8'h10 });
	wire op_clc          = (sync_ir inside { 8'h18 });
	wire op_jsr          = (sync_ir inside { 8'h20 });
	wire op_and          = (sync_ir inside { 8'h21, 8'h25, 8'h29, 8'h2D, 8'h31, 8'h35, 8'h39, 8'h3D });
	wire op_rla          = (sync_ir inside { 8'h23, 8'h27, 8'h2F, 8'h33, 8'h37, 8'h3B, 8'h3F });
	wire op_bit          = (sync_ir inside { 8'h24, 8'h2C });
	wire op_rol          = (sync_ir inside { 8'h26, 8'h2E, 8'h36, 8'h3E });
	wire op_plp          = (sync_ir inside { 8'h28 });
	wire op_rola         = (sync_ir inside { 8'h2A });
	wire op_bmi          = (sync_ir inside { 8'h30 });
	wire op_sec          = (sync_ir inside { 8'h38 });
	wire op_rti          = (sync_ir inside { 8'h40 });
	wire op_eor          = (sync_ir inside { 8'h41, 8'h45, 8'h49, 8'h4D, 8'h51, 8'h55, 8'h59, 8'h5D });
	wire op_lse          = (sync_ir inside { 8'h43, 8'h47, 8'h4F, 8'h53, 8'h57, 8'h5B, 8'h5F });
	wire op_lsr          = (sync_ir inside { 8'h46, 8'h4E, 8'h56, 8'h5E });
	wire op_pha          = (sync_ir inside { 8'h48 });
	wire op_lsra         = (sync_ir inside { 8'h4A });
	wire op_alr          = (sync_ir inside { 8'h4B });
	wire op_jmp          = (sync_ir inside { 8'h4C, 8'h6C });
	wire op_bvc          = (sync_ir inside { 8'h50 });
	wire op_cli          = (sync_ir inside { 8'h58 });
	wire op_rts          = (sync_ir inside { 8'h60 });
	wire op_adc          = (sync_ir inside { 8'h61, 8'h65, 8'h69, 8'h6D, 8'h71, 8'h75, 8'h79, 8'h7D });
	wire op_rra          = (sync_ir inside { 8'h63, 8'h67, 8'h6F, 8'h73, 8'h77, 8'h7B, 8'h7F });
	wire op_ror          = (sync_ir inside { 8'h66, 8'h6E, 8'h76, 8'h7E });
	wire op_pla          = (sync_ir inside { 8'h68 });
	wire op_rora         = (sync_ir inside { 8'h6A });
	wire op_arr          = (sync_ir inside { 8'h6B });
	wire op_bvs          = (sync_ir inside { 8'h70 });
	wire op_sei          = (sync_ir inside { 8'h78 });
	wire op_sta          = (sync_ir inside { 8'h81, 8'h85, 8'h8D, 8'h91, 8'h95, 8'h99, 8'h9D });
	wire op_axs          = (sync_ir inside { 8'h83, 8'h87, 8'h8F, 8'h97, 8'hCB });
	wire op_sty          = (sync_ir inside { 8'h84, 8'h8C, 8'h94 });
	wire op_stx          = (sync_ir inside { 8'h86, 8'h8E, 8'h96 });
	wire op_dey          = (sync_ir inside { 8'h88 });
	wire op_txa          = (sync_ir inside { 8'h8A });
	wire op_xaa          = (sync_ir inside { 8'h8B });
	wire op_bcc          = (sync_ir inside { 8'h90 });
	wire op_ahx          = (sync_ir inside { 8'h93, 8'h9F });
	wire op_tya          = (sync_ir inside { 8'h98 });
	wire op_txs          = (sync_ir inside { 8'h9A });
	wire op_tas          = (sync_ir inside { 8'h9B });
	wire op_shy          = (sync_ir inside { 8'h9C });
	wire op_shx          = (sync_ir inside { 8'h9E });
	wire op_ldy          = (sync_ir inside { 8'hA0, 8'hA4, 8'hAC, 8'hB4, 8'hBC });
	wire op_lda          = (sync_ir inside { 8'hA1, 8'hA5, 8'hA9, 8'hAD, 8'hB1, 8'hB5, 8'hB9, 8'hBD });
	wire op_ldx          = (sync_ir inside { 8'hA2, 8'hA6, 8'hAE, 8'hB6, 8'hBE });
	wire op_lax          = (sync_ir inside { 8'hA3, 8'hA7, 8'hAB, 8'hAF, 8'hB3, 8'hB7, 8'hBF });
	wire op_tay          = (sync_ir inside { 8'hA8 });
	wire op_tax          = (sync_ir inside { 8'hAA });
	wire op_bcs          = (sync_ir inside { 8'hB0 });
	wire op_clv          = (sync_ir inside { 8'hB8 });
	wire op_tsx          = (sync_ir inside { 8'hBA });
	wire op_las          = (sync_ir inside { 8'hBB });
	wire op_cpy          = (sync_ir inside { 8'hC0, 8'hC4, 8'hCC });
	wire op_cmp          = (sync_ir inside { 8'hC1, 8'hC5, 8'hC9, 8'hCD, 8'hD1, 8'hD5, 8'hD9, 8'hDD });
	wire op_dcm          = (sync_ir inside { 8'hC3, 8'hC7, 8'hCF, 8'hD3, 8'hD7, 8'hDB, 8'hDF });
	wire op_dec          = (sync_ir inside { 8'hC6, 8'hCE, 8'hD6, 8'hDE });
	wire op_iny          = (sync_ir inside { 8'hC8 });
	wire op_dex          = (sync_ir inside { 8'hCA });
	wire op_bne          = (sync_ir inside { 8'hD0 });
	wire op_cld          = (sync_ir inside { 8'hD8 });
	wire op_cpx          = (sync_ir inside { 8'hE0, 8'hE4, 8'hEC });
	wire op_sbc          = (sync_ir inside { 8'hE1, 8'hE5, 8'hE9, 8'hED, 8'hF1, 8'hF5, 8'hF9, 8'hFD });
	wire op_isb          = (sync_ir inside { 8'hE3, 8'hE7, 8'hEF, 8'hF3, 8'hF7, 8'hFB, 8'hFF });
	wire op_inc          = (sync_ir inside { 8'hE6, 8'hEE, 8'hF6, 8'hFE });
	wire op_inx          = (sync_ir inside { 8'hE8 });
	wire op_nop          = (sync_ir inside { 8'hEA });
	wire op_sbc          = (sync_ir inside { 8'hEB });
	wire op_beq          = (sync_ir inside { 8'hF0 });
	wire op_sed          = (sync_ir inside { 8'hF8 });
	
  always @*
  begin
    if (~sync_is_op) 
      asyn_op_cycle = 0;      

    if (am_cycle_t0 || (am_absolute && (am_cycle_t1 || am_cycle_t2)) )
    begin
      // Read (PC)
      G_addr = sync_pc; 
      G_rdwr = 1; 
    end 

    if (am_cycle_t0 || (am_absolute && am_cycle_t1))   
      {asyn_pch, asyn_pcl}  = sync_pc + 1;  // PC = PC + 1      

    if (am_cycle_t0)
      asyn_ir = G_rd_data;  // IR = (PC)
    else begin

      if (am_absolute && am_cycle_t1)
        asyn_adl = G_rd_data;  // ADL = (PC)

      if (am_absolute && am_cycle_t2)
        asyn_adh = G_rd_data; // ADH = (PC)
        
      if (am_absolute && am_cycle_t2)
        asyn_is_op = 1; // Last cycle of Addressing Mode

      if (op_jmp && op_cycle_t0)
        {asyn_pch, asyn_pcl} = asyn_ad; // PC = ADH, ADL

    end

  end

  always @(posedge G_clock, negedge G_reset)
  begin
    if (~G_reset)
    begin
      /* Reset state */

      debug_tick    <= -3;
      tick          <= 0;
      phy1          <= 1; 
      sync_a        <= 0;
      sync_x        <= 0;
      sync_y        <= 0;
      sync_s        <= 0;
      sync_p        <= 0;
      sync_pch      <= 8'hC0;
      sync_pcl      <= 0;
      sync_ir       <= 0;

      sync_op_cycle <= 4'hf;
      sync_am_cycle <= 0;
      sync_is_op    <= 0;      

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

        sync_a        <= asyn_a         ;   
        sync_x        <= asyn_x         ;   
        sync_y        <= asyn_y         ;   
        sync_s        <= asyn_s         ;   
        sync_p        <= asyn_p         ;   
        sync_pch      <= asyn_pch       ;   
        sync_pcl      <= asyn_pcl       ;   
        sync_ir       <= asyn_ir        ;  
        sync_adh      <= asyn_adh       ;
        sync_adl      <= asyn_adl       ;   

        sync_is_op    <= asyn_is_op     ;
        sync_am_cycle <= asyn_am_cycle  ; 
        sync_op_cycle <= asyn_op_cycle  ;
 
      end

    end
  end

endmodule