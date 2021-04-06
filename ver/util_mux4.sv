module util_mux4 #(parameter int A = 7, parameter int B = 0) (ctrl, out, i0, i1, i2, i3);

  input wire[1:0] ctrl;

  input wire[A:B] i0;
  input wire[A:B] i1;
  input wire[A:B] i2;
  input wire[A:B] i3;
  
  output wire[A:B] out;

  function [A:B] mux_out;
    case (ctrl)
      2'h0: mux_out = i0;
      2'h1: mux_out = i1;
      2'h2: mux_out = i2;
      2'h3: mux_out = i3;
    endcase
  endfunction 

  assign out = mux_out ();
  
endmodule