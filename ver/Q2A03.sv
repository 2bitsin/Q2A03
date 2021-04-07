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
  bit         reg_b       = 0;

  bit[3:0]    tick        = 0;
  bit         phy1        = 0;
  bit[3:0]    cycle       = 4'hf;

  assign      G_phy2      = tick >= 6;
  assign      G_sync      = (cycle == 0) && G_reset;

  wire        edge_rise   = G_phy2 && ~phy1;
  wire        edge_fall   = phy1 && ~G_phy2;

  reg8_type   ad_h        = 0;
  reg8_type   ad_l        = 0; 
  reg8_type   ba_h        = 0;
  reg8_type   ba_l        = 0;


  always @(cycle)
  begin
    if (cycle == 0)
    begin
      G_addr = reg_pc;
      G_rdwr = 1;      
    end
    case (reg_ir)
      8'h4c: 
        if (cycle == 1)

          ;

    default:;   
    endcase
  end

  always @(G_rdwr or cycle or G_rd_data)
  begin
    if (G_rdwr && cycle == 0)
      reg_ir = G_rd_data;
  end

  always @(posedge G_clock, negedge G_reset)
  begin
    if (~G_reset)
    begin
      tick        <= 0;
      cycle       <= 4'hf;      
      phy1        <= 1; 

      reg_a        = 0; 
      reg_x        = 0; 
      reg_y        = 0;
      reg_s        = 0;
      reg_pc_h     <= 8'hc0; 
      reg_pc_l     <= 0;       
      reg_ir       = 0;

      reg_c       <= 0; 
      reg_z       <= 0; 
      reg_i       <= 1; 
      reg_d       <= 0; 
      reg_v       <= 0; 
      reg_n       <= 0;
      reg_b       <= 0;

      ad_l        <= 0; 
      ad_h        <= 0; 
      ba_l        <= 0; 
      ba_h        <= 0;      

    end else 
    begin
      /* Clock divider */
      tick <= tick + 4'b1;
      if (tick >= 11)
        tick <= 4'b0;
      phy1 <= G_phy2;

      /* Cycle counter */
      if (edge_fall)
      begin
        cycle <= cycle + 1;
        if (cycle == 0)
          {reg_pc_h, reg_pc_l} <= reg_pc + 1;
      end

    end
  end

endmodule