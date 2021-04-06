
module util_mux16 #(parameter int A = 7, parameter int B = 0) (ctrl, out, i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, iA, iB, iC, iD, iE, iF);

  input wire[3:0] ctrl;

  input wire[A:B] i0;
  input wire[A:B] i1;
  input wire[A:B] i2;
  input wire[A:B] i3;
  input wire[A:B] i4;
  input wire[A:B] i5;
  input wire[A:B] i6;
  input wire[A:B] i7;
  input wire[A:B] i8;
  input wire[A:B] i9;
  input wire[A:B] iA;
  input wire[A:B] iB;
  input wire[A:B] iC;
  input wire[A:B] iD;
  input wire[A:B] iE;
  input wire[A:B] iF;
  
  output wire[A:B] out;

  function [A:B] mux_out;
    case (ctrl)
      4'h0: mux_out = i0;
      4'h1: mux_out = i1;
      4'h2: mux_out = i2;
      4'h3: mux_out = i3;
      4'h4: mux_out = i4;
      4'h5: mux_out = i5;
      4'h6: mux_out = i6;
      4'h7: mux_out = i7;
      4'h8: mux_out = i8;
      4'h9: mux_out = i9;
      4'hA: mux_out = iA;
      4'hB: mux_out = iB;
      4'hC: mux_out = iC;
      4'hD: mux_out = iD;
      4'hE: mux_out = iE;
      4'hF: mux_out = iF;
    endcase
  endfunction 

  assign out = mux_out ();
  
endmodule