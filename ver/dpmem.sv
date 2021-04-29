module dpmem #(parameter P_data_bits = 8, parameter P_addr_bits = 10)

  (I_clock0, I_addr0, I_wren0, I_rden0, I_data0, O_data0, I_clock1, I_addr1, I_wren1, I_rden1, I_data1, O_data1);

  input wire I_clock0;
  input wire[P_addr_bits - 1:0] I_addr0;
  input wire I_wren0;
  input wire I_rden0;
  input wire[P_data_bits - 1:0] I_data0;
  output bit[P_data_bits - 1:0] O_data0;

  input wire I_clock1;
  input wire[P_addr_bits - 1:0] I_addr1;
  input wire I_wren1;
  input wire I_rden1;
  input wire[P_data_bits - 1:0] I_data1;
  output bit[P_data_bits - 1:0] O_data1;

  bit[P_data_bits - 1:0] bits [0:(2**P_addr_bits) - 1];

  always @(posedge I_clock0) 
  begin
    if (I_wren0) bits[I_addr0] <= I_data0;
    if (I_rden0) O_data0 <= bits[I_addr0];
  end  

  always @(posedge I_clock1) 
  begin
    if (I_wren1) bits[I_addr1] <= I_data1;
    if (I_rden1) O_data1 <= bits[I_addr1];
  end  

	initial begin
	  $readmemh("assets/8x8.mem", bits, 12'h000);
    $readmemh("assets/vid.mem", bits, 12'h800);
	end
  
endmodule