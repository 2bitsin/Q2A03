module register #(
  parameter P_width = 8, 
  parameter bit[P_width-1:0] P_init = {P_width{1'b0}}) 

  (I_clock, I_reset, I_write, I_bits, O_bits);

  input   wire                I_clock;
  input   wire                I_reset;
  input   wire                I_write;
  input   wire[P_width-1:0]   I_bits;
  output  wire[P_width-1:0]   O_bits;

  bit[P_width-1:0] bits;

  assign O_bits = bits;  

  always @(posedge I_clock, negedge I_reset) 
  begin    
    if (~I_reset) 
      bits <= P_init;
    else if (I_write)
      bits <= I_bits;  
  end
endmodule