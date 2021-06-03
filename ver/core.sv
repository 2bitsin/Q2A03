module core (I_clock, I_reset, I_irq, I_nmi, O_addr, O_wr_data, I_rd_data, O_rdwr, O_sync, O_phy2);

/* Input/Output section */

  input   wire        I_clock;
  input   wire        I_reset;
  input   wire        I_irq;
  input   wire        I_nmi;
  input   wire[7:0]   I_rd_data;

  output  bit[7:0]    O_wr_data;
  output  bit         O_rdwr;
  output  bit[15:0]   O_addr;
  output  bit         O_sync;  
  output  bit         O_phy2;
  
  typedef enum logic[1:0]
  {
    dma_idle,
    dma_wait,
    dma_pull,
    dma_push
  } dma_state_type;

  wire[7:0]           W_wr_data;
  wire                W_rdwr;
  wire[15:0]          W_addr;
  wire                W_sync;
  wire                W_phy2;
  bit                 W_ready;
  
  core_isexec inst_exec (I_clock, I_reset, I_irq, I_nmi, W_addr, W_wr_data, I_rd_data, W_rdwr, W_ready, W_sync, W_phy2);

  bit                 last_phy2;

  wire                W_phy2_rise = ~last_phy2 & W_phy2;
  wire                W_phy2_fall = last_phy2 & ~W_phy2;

  bit[7:0]            curr_dma_page;
  bit[7:0]            next_dma_page;
  bit[7:0]            curr_dma_offs;
  bit[7:0]            next_dma_offs;
  bit[7:0]            curr_dma_data;
  bit[7:0]            next_dma_data;

  dma_state_type      curr_dma_state;
  dma_state_type      next_dma_state;

  always_ff @(posedge I_clock)
  begin
    if (W_phy2_fall)
    begin
      curr_dma_state <= next_dma_state;
      curr_dma_page <= next_dma_page;
      curr_dma_offs <= next_dma_offs;
      curr_dma_data <= next_dma_data;
    end

    last_phy2 <= W_phy2;    
  end

  always_comb 
  begin    
    O_wr_data       = W_wr_data;
    O_addr          = W_addr;
    O_rdwr          = W_rdwr;
    O_sync          = W_sync;
    O_phy2          = W_phy2;
  
    next_dma_page   = 8'b0;
    next_dma_offs   = 8'b0;    
    next_dma_data   = 8'b0;
    W_ready         = 1'b0;    
    next_dma_state  = dma_idle;

    if (I_reset)
    begin
      next_dma_state  = curr_dma_state;
      next_dma_page   = curr_dma_page;
      next_dma_offs   = curr_dma_offs;
      next_dma_data   = curr_dma_data;
      
      unique case (curr_dma_state)
      dma_idle, dma_wait: W_ready = 1'b1;
      dma_pull, dma_push: W_ready = 1'b0;
      endcase

      unique case (curr_dma_state)
      dma_idle: begin
        if (W_addr == 16'h4014 && ~W_rdwr)
        begin
          next_dma_state = dma_pull;
          next_dma_page = W_wr_data;
          next_dma_offs = 8'b0;
          next_dma_data = 8'b0;
        end
      end

      dma_wait: begin
        if (W_rdwr)
          next_dma_state = dma_pull;
      end

      dma_pull: begin
        next_dma_state = dma_push;
        next_dma_data = I_rd_data;
        O_addr = {curr_dma_page, curr_dma_offs};
        O_wr_data = curr_dma_data;
        O_rdwr = 1'b1;
      end

      dma_push: begin
        next_dma_state = dma_pull;
        next_dma_offs = curr_dma_offs + 8'b1;
        if (curr_dma_offs == 8'hff) 
        begin
          next_dma_state = dma_idle;
          next_dma_offs = 8'h00;
        end
        O_wr_data = curr_dma_data;
        O_addr = 16'h2004;
        O_rdwr = 1'b0;
      end      
      endcase
    end
  end
  
endmodule