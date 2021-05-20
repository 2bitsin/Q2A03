module memory #(
  parameter P_data_bits = 8, 
  parameter P_addr_bits = 10,

  parameter string P_init_bin0 = "",
  parameter bit[P_addr_bits-1:0] P_init_beg0 = 0,  
  parameter bit[P_addr_bits-1:0] P_init_end0 = 0,  

  parameter string P_init_bin1 = "",
  parameter bit[P_addr_bits-1:0] P_init_beg1 = 0,
  parameter bit[P_addr_bits-1:0] P_init_end1 = 0,  

  parameter string P_init_bin2 = "",
  parameter bit[P_addr_bits-1:0] P_init_beg2 = 0,
  parameter bit[P_addr_bits-1:0] P_init_end2 = 0,  

  parameter string P_init_bin3 = "",
  parameter bit[P_addr_bits-1:0] P_init_beg3 = 0,
  parameter bit[P_addr_bits-1:0] P_init_end3 = 0)
 
 (I_clock, I_addr, I_wren, I_data, O_data);

  input wire I_clock;
  input wire[P_addr_bits - 1:0] I_addr;
  input wire I_wren;
  
  input wire[P_data_bits - 1:0] I_data;
  output bit[P_data_bits - 1:0] O_data;

  (* ramstyle = "no_rw_check, M10K" *)
  bit[P_data_bits - 1:0] bits [0:(2**P_addr_bits) - 1];

  always @(posedge I_clock) 
  begin
    if (I_wren) 
      bits[I_addr] <= I_data;
    O_data <= bits[I_addr];
  end  


  initial begin
    if (P_init_bin0.len () > 0 && P_init_end0 - P_init_beg0 > 0) 
      $readmemh({P_init_bin0}, bits, P_init_beg0, P_init_end0);
      
    if (P_init_bin1.len () > 0 && P_init_end1 - P_init_beg1 > 0) 
      $readmemh({P_init_bin1}, bits, P_init_beg1, P_init_end1);
      
    if (P_init_bin2.len () > 0 && P_init_end2 - P_init_beg2 > 0) 
      $readmemh({P_init_bin2}, bits, P_init_beg2, P_init_end2); 
      
    if (P_init_bin3.len () > 0 && P_init_end3 - P_init_beg3 > 0) 
      $readmemh({P_init_bin3}, bits, P_init_beg3, P_init_end3); 
  end
  
endmodule