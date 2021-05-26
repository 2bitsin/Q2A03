module video_oam (  I_clock, 
                    I_reset, 
                    I_addr_wren, 
                    I_addr_inc, 
                    I_addr_clr,
                    I_data_wren, 
                    I_data,
                    O_addr, 
                    O_data);

  input  wire       I_clock;
  input  wire       I_reset;

  input  wire       I_addr_wren;
  input  wire       I_addr_inc;
  input  wire       I_addr_clr;

  input  wire       I_data_wren;

  input  wire[7:0]  I_data;

  output wire[7:0]  O_addr;
  output bit[7:0]  	O_data;

  bit[7:0] oam_addr;
  bit[7:0] oam_data [0:255];
  
  assign O_addr = oam_addr;

  always_ff @(posedge I_clock, negedge I_reset) 
  begin
    if (~I_reset) begin
      oam_addr <= 0;
			O_data <= 0;
    end else 
    begin
			O_data <= oam_data[oam_addr];
		
      if (I_addr_clr)
        oam_addr <= 8'd0;
      else if (I_addr_wren)
        oam_addr <= I_data;
      else if (I_addr_inc)
        oam_addr <= oam_addr + 8'd1;
      else if (I_data_wren) 
        oam_data [oam_addr] <= I_data;			
    end
  end

endmodule
