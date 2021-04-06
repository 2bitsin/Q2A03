module util_mux16_inv #(parameter A = 7, B = 0) (clock, ctrl, inp, latch, o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, oA, oB, oC, oD, oE, oF);

  input wire clock;
  input wire latch;
  input wire [3:0] ctrl;
  input wire [A:B] inp;

  output bit [A:B] o0;
  output bit [A:B] o1;
  output bit [A:B] o2;
  output bit [A:B] o3;
  output bit [A:B] o4;
  output bit [A:B] o5;
  output bit [A:B] o6;
  output bit [A:B] o7;
  output bit [A:B] o8;
  output bit [A:B] o9;
  output bit [A:B] oA;
  output bit [A:B] oB;
  output bit [A:B] oC;
  output bit [A:B] oD;
  output bit [A:B] oE;
  output bit [A:B] oF;

  always @(posedge clock)
  begin
    if (latch)
    begin
      case (ctrl)
      4'h0: o0 <= inp;
      4'h1: o1 <= inp;
      4'h2: o2 <= inp;
      4'h3: o3 <= inp;
      4'h4: o4 <= inp;
      4'h5: o5 <= inp;
      4'h6: o6 <= inp;
      4'h7: o7 <= inp;
      4'h8: o8 <= inp;
      4'h9: o9 <= inp;
      4'hA: oA <= inp;
      4'hB: oB <= inp;
      4'hC: oC <= inp;
      4'hD: oD <= inp;
      4'hE: oE <= inp;
      4'hF: oF <= inp;
      endcase
    end      
  end
endmodule