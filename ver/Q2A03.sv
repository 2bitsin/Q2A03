module Q2A03 (G_clock, G_reset, G_irq, G_nmi, G_addr, G_wr_data, G_rd_data, G_rdwr, G_ready, G_sync, G_phy2);

  typedef bit[7:0] reg8_type;
                          
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

  reg8_type   reg_a       = 0; 
  reg8_type   reg_x       = 0; 
  reg8_type   reg_y       = 0; 
  reg8_type   reg_s       = 0; 

  reg8_type   reg_pc_h    = 8'hC0; 
  reg8_type   reg_pc_l    = 8'h00;
  wire[15:0]  reg_pc      = { reg_pc_h, reg_pc_l };  
  reg8_type   reg_ir      = 0;

  bit         reg_c       = 0; 
  bit         reg_z       = 0; 
  bit         reg_i       = 0; 
  bit         reg_d       = 0; 
  bit         reg_v       = 0;
  bit         reg_n       = 0;

  bit[3:0]    tick        = 0;

  bit[2:0]    op_cycle    = 0;
  bit[1:0]    op_cycle_s  = 0;

  bit         brk_bit     = 0;
  bit         phy1        = 0;

  assign      G_phy2      = tick < 6;
  assign      G_sync      = op_cycle[0];

  wire        edge_rise   = G_phy2 && ~phy1;
  wire        edge_fall   = phy1 && ~G_phy2;

  reg8_type   tmp0_h      = 0;
  reg8_type   tmp0_l      = 0; 
  reg8_type   tmp1_h      = 0;
  reg8_type   tmp1_l      = 0;

  bit[3:0]    rd_dest     = 0;  
  bit[3:0]    wr_dest     = 0;  
  
  util_mux16 #(7, 0) m0 (
    wr_dest, 
    G_wr_data, 
    tmp0_l, 
    tmp0_h, 
    tmp1_l, 
    tmp1_h, 
    reg_a, 
    reg_x, 
    reg_y, 
    reg_s, 
    reg_pc_l, 
    reg_pc_h, 
    {reg_n, reg_v, 1'b1, brk_bit, reg_d, reg_i, reg_z, reg_c},
    {8 {1'b1}},
    {8 {1'b1}},
    {8 {1'b1}},
    {8 {1'b1}},
    {8 {1'b1}}
  );
  

  always @(posedge G_clock, negedge G_reset)
  begin
    if (~G_reset)
    begin
      op_cycle    <= 0;
      op_cycle_s  <= 0;
      phy1        <= 1; 
      tick        <= 0;
      reg_a       <= 0; 
      reg_x       <= 0; 
      reg_y       <= 0;
      reg_s       <= 0;
      reg_pc_h    <= 8'hc0; 
      reg_pc_l    <= 0; 
      reg_ir      <= 0;
      reg_c       <= 0; 
      reg_z       <= 0; 
      reg_i       <= 0; 
      reg_d       <= 0; 
      reg_v       <= 0; 
      reg_n       <= 0;
      tmp0_l      <= 0; 
      tmp0_h      <= 0; 
      tmp1_l      <= 0; 
      tmp1_h      <= 0;      
    end else 
    begin
      /* Clock divider */
      tick <= tick + 4'b1;
      if (tick >= 11)
        tick <= 4'b0;        
      phy1 <= G_phy2;
    end
  end

endmodule