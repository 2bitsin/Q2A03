
module core_decoder(I_ir, I_t, O_control);
	input wire[7:0] I_ir;
	input wire[3:0] I_t;
	output wire[100:0] O_control;
	assign O_control[  0] = (((I_t == 4'd2)&((I_ir == 8'h5F)|(I_ir == 8'h8F)|(I_ir == 8'h4E)|(I_ir == 8'h59)|(I_ir == 8'h3D)|(I_ir == 8'hFE)|(I_ir == 8'hEE)|(I_ir == 8'h2C)|(I_ir == 8'hED)|(I_ir == 8'hDD)|(I_ir == 8'h79)|(I_ir == 8'hDC)|(I_ir == 8'h8D)|(I_ir == 8'h2F)|(I_ir == 8'h7C)|(I_ir == 8'h1E)|(I_ir == 8'hDF)|(I_ir == 8'hFF)|(I_ir == 8'h4F)|(I_ir == 8'hCC)|(I_ir == 8'hDE)|(I_ir == 8'hCE)|(I_ir == 8'h19)|(I_ir == 8'h8E)|(I_ir == 8'h99)|(I_ir == 8'h3E)|(I_ir == 8'h2E)|(I_ir == 8'h7E)|(I_ir == 8'h6E)|(I_ir == 8'hCD)|(I_ir == 8'h39)|(I_ir == 8'h2D)|(I_ir == 8'hBE)|(I_ir == 8'h1C)|(I_ir == 8'h7D)|(I_ir == 8'hF9)|(I_ir == 8'hBD)|(I_ir == 8'hAD)|(I_ir == 8'h6C)|(I_ir == 8'hAC)|(I_ir == 8'h1D)|(I_ir == 8'h5D)|(I_ir == 8'h3F)|(I_ir == 8'h7F)|(I_ir == 8'h0C)|(I_ir == 8'h4C)|(I_ir == 8'h1F)|(I_ir == 8'hFC)|(I_ir == 8'h6F)|(I_ir == 8'hBC)|(I_ir == 8'h5E)|(I_ir == 8'h0E)|(I_ir == 8'hDB)|(I_ir == 8'hCF)|(I_ir == 8'hFB)|(I_ir == 8'h5B)|(I_ir == 8'hFD)|(I_ir == 8'h6D)|(I_ir == 8'hEC)|(I_ir == 8'h5C)|(I_ir == 8'hD9)|(I_ir == 8'h0D)|(I_ir == 8'h4D)|(I_ir == 8'hAE)|(I_ir == 8'hB9)|(I_ir == 8'h9D)|(I_ir == 8'h8C)|(I_ir == 8'hEF)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h3C)|(I_ir == 8'hBF)|(I_ir == 8'hAF)|(I_ir == 8'h1B)|(I_ir == 8'h0F)))|
	                         ((I_t == 4'd1)&((I_ir == 8'h5A)|(I_ir == 8'h3E)|(I_ir == 8'h7E)|(I_ir == 8'hC3)|(I_ir == 8'h65)|(I_ir == 8'hCD)|(I_ir == 8'h49)|(I_ir == 8'h8E)|(I_ir == 8'hCE)|(I_ir == 8'hA2)|(I_ir == 8'h2E)|(I_ir == 8'h7D)|(I_ir == 8'hBD)|(I_ir == 8'h25)|(I_ir == 8'hA1)|(I_ir == 8'h09)|(I_ir == 8'h6E)|(I_ir == 8'hE6)|(I_ir == 8'h2D)|(I_ir == 8'h6C)|(I_ir == 8'hAC)|(I_ir == 8'h90)|(I_ir == 8'hF1)|(I_ir == 8'h5D)|(I_ir == 8'h38)|(I_ir == 8'hD5)|(I_ir == 8'h41)|(I_ir == 8'h1C)|(I_ir == 8'h05)|(I_ir == 8'hE0)|(I_ir == 8'h4C)|(I_ir == 8'hC4)|(I_ir == 8'h40)|(I_ir == 8'h30)|(I_ir == 8'h91)|(I_ir == 8'h75)|(I_ir == 8'hB5)|(I_ir == 8'h1D)|(I_ir == 8'h80)|(I_ir == 8'h74)|(I_ir == 8'h64)|(I_ir == 8'hA4)|(I_ir == 8'h0C)|(I_ir == 8'hE9)|(I_ir == 8'h7F)|(I_ir == 8'h6F)|(I_ir == 8'h63)|(I_ir == 8'hF4)|(I_ir == 8'hE8)|(I_ir == 8'hD8)|(I_ir == 8'hBC)|(I_ir == 8'hFC)|(I_ir == 8'hB3)|(I_ir == 8'hF3)|(I_ir == 8'hE3)|(I_ir == 8'hD7)|(I_ir == 8'hC7)|(I_ir == 8'h3F)|(I_ir == 8'h88)|(I_ir == 8'h86)|(I_ir == 8'h14)|(I_ir == 8'hC6)|(I_ir == 8'h53)|(I_ir == 8'hFB)|(I_ir == 8'h77)|(I_ir == 8'h67)|(I_ir == 8'h5B)|(I_ir == 8'h1F)|(I_ir == 8'h0F)|(I_ir == 8'h03)|(I_ir == 8'hFA)|(I_ir == 8'h66)|(I_ir == 8'h4A)|(I_ir == 8'h33)|(I_ir == 8'h0E)|(I_ir == 8'hAB)|(I_ir == 8'hEB)|(I_ir == 8'hDB)|(I_ir == 8'hCF)|(I_ir == 8'h55)|(I_ir == 8'hB6)|(I_ir == 8'h9A)|(I_ir == 8'h06)|(I_ir == 8'hDA)|(I_ir == 8'hBE)|(I_ir == 8'h26)|(I_ir == 8'hA5)|(I_ir == 8'h99)|(I_ir == 8'h89)|(I_ir == 8'h6D)|(I_ir == 8'hEA)|(I_ir == 8'h31)|(I_ir == 8'h3A)|(I_ir == 8'h15)|(I_ir == 8'h7A)|(I_ir == 8'hD9)|(I_ir == 8'h39)|(I_ir == 8'hFD)|(I_ir == 8'hE1)|(I_ir == 8'h4D)|(I_ir == 8'hAE)|(I_ir == 8'h44)|(I_ir == 8'hEC)|(I_ir == 8'hB9)|(I_ir == 8'hAD)|(I_ir == 8'h9D)|(I_ir == 8'h81)|(I_ir == 8'hC1)|(I_ir == 8'hE2)|(I_ir == 8'h29)|(I_ir == 8'h0D)|(I_ir == 8'h78)|(I_ir == 8'h5C)|(I_ir == 8'hA8)|(I_ir == 8'h8C)|(I_ir == 8'h04)|(I_ir == 8'hD1)|(I_ir == 8'h28)|(I_ir == 8'h18)|(I_ir == 8'hF5)|(I_ir == 8'hD0)|(I_ir == 8'hC0)|(I_ir == 8'h3C)|(I_ir == 8'h17)|(I_ir == 8'hB4)|(I_ir == 8'h20)|(I_ir == 8'hBF)|(I_ir == 8'hA3)|(I_ir == 8'h70)|(I_ir == 8'h54)|(I_ir == 8'h94)|(I_ir == 8'h1A)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'h43)|(I_ir == 8'h07)|(I_ir == 8'h83)|(I_ir == 8'hE4)|(I_ir == 8'hC8)|(I_ir == 8'h6A)|(I_ir == 8'h5E)|(I_ir == 8'h4E)|(I_ir == 8'hEF)|(I_ir == 8'hD3)|(I_ir == 8'h3B)|(I_ir == 8'hB7)|(I_ir == 8'h59)|(I_ir == 8'hDE)|(I_ir == 8'hC2)|(I_ir == 8'h2A)|(I_ir == 8'hA6)|(I_ir == 8'h71)|(I_ir == 8'hB1)|(I_ir == 8'h19)|(I_ir == 8'hF6)|(I_ir == 8'h56)|(I_ir == 8'h0A)|(I_ir == 8'hA7)|(I_ir == 8'hE7)|(I_ir == 8'hE5)|(I_ir == 8'h61)|(I_ir == 8'h51)|(I_ir == 8'h45)|(I_ir == 8'h96)|(I_ir == 8'h8A)|(I_ir == 8'hD6)|(I_ir == 8'hCA)|(I_ir == 8'hBA)|(I_ir == 8'h50)|(I_ir == 8'h34)|(I_ir == 8'h95)|(I_ir == 8'h85)|(I_ir == 8'h01)|(I_ir == 8'h79)|(I_ir == 8'hC5)|(I_ir == 8'h3D)|(I_ir == 8'h21)|(I_ir == 8'h11)|(I_ir == 8'hFE)|(I_ir == 8'hEE)|(I_ir == 8'hA0)|(I_ir == 8'h84)|(I_ir == 8'h68)|(I_ir == 8'h2C)|(I_ir == 8'hC9)|(I_ir == 8'h35)|(I_ir == 8'h10)|(I_ir == 8'hF9)|(I_ir == 8'hED)|(I_ir == 8'hDD)|(I_ir == 8'h73)|(I_ir == 8'h57)|(I_ir == 8'hB8)|(I_ir == 8'hF8)|(I_ir == 8'hDC)|(I_ir == 8'h48)|(I_ir == 8'h69)|(I_ir == 8'hA9)|(I_ir == 8'h8D)|(I_ir == 8'h2F)|(I_ir == 8'hCB)|(I_ir == 8'h37)|(I_ir == 8'h58)|(I_ir == 8'h98)|(I_ir == 8'h00)|(I_ir == 8'h7C)|(I_ir == 8'h60)|(I_ir == 8'h24)|(I_ir == 8'h08)|(I_ir == 8'h97)|(I_ir == 8'h87)|(I_ir == 8'hFF)|(I_ir == 8'hCC)|(I_ir == 8'h23)|(I_ir == 8'h13)|(I_ir == 8'hB0)|(I_ir == 8'hF0)|(I_ir == 8'hD4)|(I_ir == 8'h76)|(I_ir == 8'h1E)|(I_ir == 8'h27)|(I_ir == 8'hAF)|(I_ir == 8'h1B)|(I_ir == 8'hDF)|(I_ir == 8'h47)|(I_ir == 8'hAA)|(I_ir == 8'h16)|(I_ir == 8'h46)|(I_ir == 8'h36)|(I_ir == 8'h4F)|(I_ir == 8'h8F)|(I_ir == 8'hF7)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h60)|(I_ir == 8'h20)))|
	                         ((I_t == 4'd0)));
	
	assign O_control[  1] = (((I_t == 4'd2)&((I_ir == 8'h43)|(I_ir == 8'h8F)|(I_ir == 8'h83)|(I_ir == 8'h4E)|(I_ir == 8'hC3)|(I_ir == 8'hB7)|(I_ir == 8'h21)|(I_ir == 8'hFE)|(I_ir == 8'hE7)|(I_ir == 8'h71)|(I_ir == 8'hD6)|(I_ir == 8'hB1)|(I_ir == 8'h95)|(I_ir == 8'hF6)|(I_ir == 8'h11)|(I_ir == 8'h61)|(I_ir == 8'h51)|(I_ir == 8'hEE)|(I_ir == 8'h35)|(I_ir == 8'h96)|(I_ir == 8'h2C)|(I_ir == 8'h00)|(I_ir == 8'h40)|(I_ir == 8'hED)|(I_ir == 8'h01)|(I_ir == 8'h74)|(I_ir == 8'h68)|(I_ir == 8'h73)|(I_ir == 8'h57)|(I_ir == 8'h8D)|(I_ir == 8'h46)|(I_ir == 8'h2F)|(I_ir == 8'h13)|(I_ir == 8'h37)|(I_ir == 8'hD4)|(I_ir == 8'h1E)|(I_ir == 8'h60)|(I_ir == 8'h47)|(I_ir == 8'h4F)|(I_ir == 8'hCC)|(I_ir == 8'hDE)|(I_ir == 8'hCE)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'hF7)|(I_ir == 8'h27)|(I_ir == 8'h16)|(I_ir == 8'h8E)|(I_ir == 8'h99)|(I_ir == 8'h3E)|(I_ir == 8'h2E)|(I_ir == 8'h7E)|(I_ir == 8'h6E)|(I_ir == 8'hE6)|(I_ir == 8'hCD)|(I_ir == 8'h2D)|(I_ir == 8'hF1)|(I_ir == 8'hAD)|(I_ir == 8'hA1)|(I_ir == 8'h91)|(I_ir == 8'h6C)|(I_ir == 8'hAC)|(I_ir == 8'hB5)|(I_ir == 8'hD5)|(I_ir == 8'h41)|(I_ir == 8'hF3)|(I_ir == 8'h0C)|(I_ir == 8'h14)|(I_ir == 8'h75)|(I_ir == 8'hB3)|(I_ir == 8'h6F)|(I_ir == 8'h63)|(I_ir == 8'h53)|(I_ir == 8'h5E)|(I_ir == 8'h03)|(I_ir == 8'hD7)|(I_ir == 8'hC7)|(I_ir == 8'h33)|(I_ir == 8'h0E)|(I_ir == 8'hC6)|(I_ir == 8'hCF)|(I_ir == 8'h77)|(I_ir == 8'h67)|(I_ir == 8'h26)|(I_ir == 8'h66)|(I_ir == 8'h56)|(I_ir == 8'h31)|(I_ir == 8'h15)|(I_ir == 8'h55)|(I_ir == 8'hB6)|(I_ir == 8'h06)|(I_ir == 8'h6D)|(I_ir == 8'hEC)|(I_ir == 8'hC1)|(I_ir == 8'h0D)|(I_ir == 8'hE1)|(I_ir == 8'h4D)|(I_ir == 8'hAE)|(I_ir == 8'h34)|(I_ir == 8'h28)|(I_ir == 8'hF5)|(I_ir == 8'h9D)|(I_ir == 8'h81)|(I_ir == 8'h23)|(I_ir == 8'h17)|(I_ir == 8'hF4)|(I_ir == 8'h8C)|(I_ir == 8'hD1)|(I_ir == 8'hEF)|(I_ir == 8'hE3)|(I_ir == 8'h97)|(I_ir == 8'hB4)|(I_ir == 8'h20)|(I_ir == 8'h07)|(I_ir == 8'hAF)|(I_ir == 8'hA3)|(I_ir == 8'h0F)|(I_ir == 8'h54)|(I_ir == 8'h94)|(I_ir == 8'hD3)))|
	                         ((I_t == 4'd1)&((I_ir == 8'h3E)|(I_ir == 8'h7E)|(I_ir == 8'hC3)|(I_ir == 8'h65)|(I_ir == 8'hCD)|(I_ir == 8'h8E)|(I_ir == 8'hCE)|(I_ir == 8'h2E)|(I_ir == 8'h7D)|(I_ir == 8'hBD)|(I_ir == 8'h25)|(I_ir == 8'hA1)|(I_ir == 8'h6E)|(I_ir == 8'hE6)|(I_ir == 8'h2D)|(I_ir == 8'h6C)|(I_ir == 8'hAC)|(I_ir == 8'hF1)|(I_ir == 8'h5D)|(I_ir == 8'hD5)|(I_ir == 8'h41)|(I_ir == 8'h1C)|(I_ir == 8'h05)|(I_ir == 8'h4C)|(I_ir == 8'hC4)|(I_ir == 8'h40)|(I_ir == 8'h91)|(I_ir == 8'h75)|(I_ir == 8'hB5)|(I_ir == 8'h1D)|(I_ir == 8'h74)|(I_ir == 8'h64)|(I_ir == 8'hA4)|(I_ir == 8'h0C)|(I_ir == 8'h7F)|(I_ir == 8'h6F)|(I_ir == 8'h63)|(I_ir == 8'hF4)|(I_ir == 8'hBC)|(I_ir == 8'hFC)|(I_ir == 8'hB3)|(I_ir == 8'hF3)|(I_ir == 8'hE3)|(I_ir == 8'hD7)|(I_ir == 8'hC7)|(I_ir == 8'h3F)|(I_ir == 8'h86)|(I_ir == 8'h14)|(I_ir == 8'hC6)|(I_ir == 8'h53)|(I_ir == 8'hFB)|(I_ir == 8'h77)|(I_ir == 8'h67)|(I_ir == 8'h5B)|(I_ir == 8'h1F)|(I_ir == 8'h0F)|(I_ir == 8'h03)|(I_ir == 8'h66)|(I_ir == 8'h33)|(I_ir == 8'h0E)|(I_ir == 8'hDB)|(I_ir == 8'hCF)|(I_ir == 8'h55)|(I_ir == 8'hB6)|(I_ir == 8'h06)|(I_ir == 8'hBE)|(I_ir == 8'h26)|(I_ir == 8'hA5)|(I_ir == 8'h99)|(I_ir == 8'h6D)|(I_ir == 8'h31)|(I_ir == 8'h15)|(I_ir == 8'hD9)|(I_ir == 8'h39)|(I_ir == 8'hFD)|(I_ir == 8'hE1)|(I_ir == 8'h4D)|(I_ir == 8'hAE)|(I_ir == 8'h44)|(I_ir == 8'hEC)|(I_ir == 8'hB9)|(I_ir == 8'hAD)|(I_ir == 8'h9D)|(I_ir == 8'h81)|(I_ir == 8'hC1)|(I_ir == 8'h0D)|(I_ir == 8'h5C)|(I_ir == 8'h8C)|(I_ir == 8'h04)|(I_ir == 8'hD1)|(I_ir == 8'h28)|(I_ir == 8'hF5)|(I_ir == 8'h3C)|(I_ir == 8'h17)|(I_ir == 8'hB4)|(I_ir == 8'h20)|(I_ir == 8'hBF)|(I_ir == 8'hA3)|(I_ir == 8'h54)|(I_ir == 8'h94)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'h43)|(I_ir == 8'h07)|(I_ir == 8'h83)|(I_ir == 8'hE4)|(I_ir == 8'h5E)|(I_ir == 8'h4E)|(I_ir == 8'hEF)|(I_ir == 8'hD3)|(I_ir == 8'h3B)|(I_ir == 8'hB7)|(I_ir == 8'h59)|(I_ir == 8'hDE)|(I_ir == 8'hA6)|(I_ir == 8'h71)|(I_ir == 8'hB1)|(I_ir == 8'h19)|(I_ir == 8'hF6)|(I_ir == 8'h56)|(I_ir == 8'hA7)|(I_ir == 8'hE7)|(I_ir == 8'hE5)|(I_ir == 8'h61)|(I_ir == 8'h51)|(I_ir == 8'h45)|(I_ir == 8'h96)|(I_ir == 8'hD6)|(I_ir == 8'h34)|(I_ir == 8'h95)|(I_ir == 8'h85)|(I_ir == 8'h01)|(I_ir == 8'h79)|(I_ir == 8'hC5)|(I_ir == 8'h3D)|(I_ir == 8'h21)|(I_ir == 8'h11)|(I_ir == 8'hFE)|(I_ir == 8'hEE)|(I_ir == 8'h84)|(I_ir == 8'h68)|(I_ir == 8'h2C)|(I_ir == 8'h35)|(I_ir == 8'hF9)|(I_ir == 8'hED)|(I_ir == 8'hDD)|(I_ir == 8'h73)|(I_ir == 8'h57)|(I_ir == 8'hDC)|(I_ir == 8'h48)|(I_ir == 8'h8D)|(I_ir == 8'h2F)|(I_ir == 8'h37)|(I_ir == 8'h00)|(I_ir == 8'h7C)|(I_ir == 8'h60)|(I_ir == 8'h24)|(I_ir == 8'h08)|(I_ir == 8'h97)|(I_ir == 8'h87)|(I_ir == 8'hFF)|(I_ir == 8'hCC)|(I_ir == 8'h23)|(I_ir == 8'h13)|(I_ir == 8'hD4)|(I_ir == 8'h76)|(I_ir == 8'h1E)|(I_ir == 8'h27)|(I_ir == 8'hAF)|(I_ir == 8'h1B)|(I_ir == 8'hDF)|(I_ir == 8'h47)|(I_ir == 8'h16)|(I_ir == 8'h46)|(I_ir == 8'h36)|(I_ir == 8'h4F)|(I_ir == 8'h8F)|(I_ir == 8'hF7)))|
	                         ((I_t == 4'd3)&((I_ir == 8'hC7)|(I_ir == 8'h0E)|(I_ir == 8'hC6)|(I_ir == 8'h5E)|(I_ir == 8'hFB)|(I_ir == 8'h67)|(I_ir == 8'h5B)|(I_ir == 8'h66)|(I_ir == 8'h56)|(I_ir == 8'hDB)|(I_ir == 8'hD9)|(I_ir == 8'hBE)|(I_ir == 8'h26)|(I_ir == 8'hB9)|(I_ir == 8'h06)|(I_ir == 8'hFD)|(I_ir == 8'hE1)|(I_ir == 8'h3C)|(I_ir == 8'h9D)|(I_ir == 8'h81)|(I_ir == 8'h5C)|(I_ir == 8'hC1)|(I_ir == 8'h7B)|(I_ir == 8'h6F)|(I_ir == 8'h23)|(I_ir == 8'h17)|(I_ir == 8'h07)|(I_ir == 8'hBF)|(I_ir == 8'hA3)|(I_ir == 8'hEF)|(I_ir == 8'hE3)|(I_ir == 8'h3B)|(I_ir == 8'h5F)|(I_ir == 8'hDE)|(I_ir == 8'h83)|(I_ir == 8'h1B)|(I_ir == 8'h0F)|(I_ir == 8'h7E)|(I_ir == 8'hE7)|(I_ir == 8'h4F)|(I_ir == 8'h43)|(I_ir == 8'h61)|(I_ir == 8'h4E)|(I_ir == 8'h3E)|(I_ir == 8'h19)|(I_ir == 8'h59)|(I_ir == 8'h79)|(I_ir == 8'hF6)|(I_ir == 8'h3D)|(I_ir == 8'h21)|(I_ir == 8'hFE)|(I_ir == 8'hD6)|(I_ir == 8'h01)|(I_ir == 8'hEE)|(I_ir == 8'h00)|(I_ir == 8'h40)|(I_ir == 8'hDD)|(I_ir == 8'hDC)|(I_ir == 8'h37)|(I_ir == 8'h63)|(I_ir == 8'h7C)|(I_ir == 8'h57)|(I_ir == 8'h60)|(I_ir == 8'hFF)|(I_ir == 8'h46)|(I_ir == 8'h2F)|(I_ir == 8'h76)|(I_ir == 8'h1E)|(I_ir == 8'hDF)|(I_ir == 8'hCF)|(I_ir == 8'h47)|(I_ir == 8'hC3)|(I_ir == 8'hCE)|(I_ir == 8'h36)|(I_ir == 8'hF7)|(I_ir == 8'h99)|(I_ir == 8'h27)|(I_ir == 8'hBD)|(I_ir == 8'h6E)|(I_ir == 8'hE6)|(I_ir == 8'h16)|(I_ir == 8'h5D)|(I_ir == 8'h7D)|(I_ir == 8'h2E)|(I_ir == 8'hA1)|(I_ir == 8'h91)|(I_ir == 8'h39)|(I_ir == 8'h1D)|(I_ir == 8'h41)|(I_ir == 8'h1C)|(I_ir == 8'hF9)|(I_ir == 8'h7F)|(I_ir == 8'h6C)|(I_ir == 8'hD7)|(I_ir == 8'h3F)|(I_ir == 8'h20)|(I_ir == 8'h77)|(I_ir == 8'h1F)|(I_ir == 8'hBC)|(I_ir == 8'h03)|(I_ir == 8'hFC)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hD7)|(I_ir == 8'h37)|(I_ir == 8'h60)|(I_ir == 8'hFF)|(I_ir == 8'h5B)|(I_ir == 8'h4F)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'h3E)|(I_ir == 8'hDF)|(I_ir == 8'hCF)|(I_ir == 8'hC3)|(I_ir == 8'h16)|(I_ir == 8'hCE)|(I_ir == 8'hF7)|(I_ir == 8'hA1)|(I_ir == 8'h2E)|(I_ir == 8'h6E)|(I_ir == 8'hF1)|(I_ir == 8'h11)|(I_ir == 8'h41)|(I_ir == 8'h91)|(I_ir == 8'h3F)|(I_ir == 8'h7F)|(I_ir == 8'h63)|(I_ir == 8'hB3)|(I_ir == 8'hA3)|(I_ir == 8'h1F)|(I_ir == 8'hF3)|(I_ir == 8'h03)|(I_ir == 8'h1E)|(I_ir == 8'h0E)|(I_ir == 8'h53)|(I_ir == 8'h77)|(I_ir == 8'h5E)|(I_ir == 8'hE3)|(I_ir == 8'h33)|(I_ir == 8'h31)|(I_ir == 8'hFB)|(I_ir == 8'h56)|(I_ir == 8'h17)|(I_ir == 8'hE1)|(I_ir == 8'hD1)|(I_ir == 8'h20)|(I_ir == 8'h81)|(I_ir == 8'hC1)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h6F)|(I_ir == 8'h5F)|(I_ir == 8'h43)|(I_ir == 8'h1B)|(I_ir == 8'hEF)|(I_ir == 8'h0F)|(I_ir == 8'hD3)|(I_ir == 8'hDE)|(I_ir == 8'hDB)|(I_ir == 8'h83)|(I_ir == 8'hD6)|(I_ir == 8'h4E)|(I_ir == 8'h7E)|(I_ir == 8'hF6)|(I_ir == 8'h21)|(I_ir == 8'h61)|(I_ir == 8'h71)|(I_ir == 8'hB1)|(I_ir == 8'h01)|(I_ir == 8'hEE)|(I_ir == 8'hFE)|(I_ir == 8'h51)|(I_ir == 8'h40)|(I_ir == 8'h2F)|(I_ir == 8'h23)|(I_ir == 8'h13)|(I_ir == 8'h00)|(I_ir == 8'h73)|(I_ir == 8'h57)))|
	                         ((I_t == 4'd6)&((I_ir == 8'hF3)|(I_ir == 8'h63)|(I_ir == 8'h53)|(I_ir == 8'hE3)|(I_ir == 8'h33)|(I_ir == 8'h03)|(I_ir == 8'h23)|(I_ir == 8'h43)|(I_ir == 8'hD3)|(I_ir == 8'h73)|(I_ir == 8'h13)|(I_ir == 8'hC3)))|
	                         ((I_t == 4'd5)&((I_ir == 8'hD3)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'h43)|(I_ir == 8'hDE)|(I_ir == 8'h1B)|(I_ir == 8'hFE)|(I_ir == 8'h73)|(I_ir == 8'hFF)|(I_ir == 8'h23)|(I_ir == 8'h13)|(I_ir == 8'h1E)|(I_ir == 8'h63)|(I_ir == 8'hDF)|(I_ir == 8'h7E)|(I_ir == 8'hC3)|(I_ir == 8'h5B)|(I_ir == 8'h3E)|(I_ir == 8'h00)|(I_ir == 8'hE3)|(I_ir == 8'hF3)|(I_ir == 8'h3F)|(I_ir == 8'h7F)|(I_ir == 8'hFB)|(I_ir == 8'h1F)|(I_ir == 8'h03)|(I_ir == 8'hDB)|(I_ir == 8'h53)|(I_ir == 8'h5E)|(I_ir == 8'h33)))|
	                         ((I_t == 4'd0)));
	
	assign O_control[  2] = (((I_t == 4'd3)&((I_ir == 8'h28)|(I_ir == 8'h00)|(I_ir == 8'h40)|(I_ir == 8'h60)|(I_ir == 8'h20)|(I_ir == 8'h68)))|
	                         ((I_t == 4'd2)&((I_ir == 8'h20)|(I_ir == 8'h68)|(I_ir == 8'h00)|(I_ir == 8'h40)|(I_ir == 8'h60)|(I_ir == 8'h28)|(I_ir == 8'h08)|(I_ir == 8'h48)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h20)|(I_ir == 8'h00)|(I_ir == 8'h40)|(I_ir == 8'h60)))|
	                         ((I_t == 4'd5)&(I_ir == 8'h40)));
	
	assign O_control[  3] = (((I_t == 4'd3)&((I_ir == 8'h8C)|(I_ir == 8'h27)|(I_ir == 8'hC7)|(I_ir == 8'h94)|(I_ir == 8'hE6)|(I_ir == 8'hC6)|(I_ir == 8'h07)|(I_ir == 8'h8D)|(I_ir == 8'h67)|(I_ir == 8'h96)|(I_ir == 8'h00)|(I_ir == 8'h66)|(I_ir == 8'h97)|(I_ir == 8'h26)|(I_ir == 8'hE7)|(I_ir == 8'h46)|(I_ir == 8'h06)|(I_ir == 8'h8F)|(I_ir == 8'h95)|(I_ir == 8'h20)|(I_ir == 8'h47)|(I_ir == 8'h8E)))|
	                         ((I_t == 4'd6)&((I_ir == 8'hFE)|(I_ir == 8'hFF)|(I_ir == 8'hDE)|(I_ir == 8'hF3)|(I_ir == 8'hDF)|(I_ir == 8'hC3)|(I_ir == 8'h63)|(I_ir == 8'h53)|(I_ir == 8'h23)|(I_ir == 8'h5E)|(I_ir == 8'hE3)|(I_ir == 8'h33)|(I_ir == 8'h3E)|(I_ir == 8'h7E)|(I_ir == 8'hFB)|(I_ir == 8'h03)|(I_ir == 8'h73)|(I_ir == 8'hDB)|(I_ir == 8'h43)|(I_ir == 8'h13)|(I_ir == 8'h1E)|(I_ir == 8'hD3)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hE7)|(I_ir == 8'h46)|(I_ir == 8'hD7)|(I_ir == 8'h37)|(I_ir == 8'hD6)|(I_ir == 8'h4E)|(I_ir == 8'hF6)|(I_ir == 8'hC6)|(I_ir == 8'h9D)|(I_ir == 8'h17)|(I_ir == 8'h4F)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'h0E)|(I_ir == 8'hCF)|(I_ir == 8'h20)|(I_ir == 8'hEE)|(I_ir == 8'h16)|(I_ir == 8'h77)|(I_ir == 8'hCE)|(I_ir == 8'hF7)|(I_ir == 8'h26)|(I_ir == 8'h99)|(I_ir == 8'h66)|(I_ir == 8'hC7)|(I_ir == 8'h2E)|(I_ir == 8'h6E)|(I_ir == 8'hE6)|(I_ir == 8'h6F)|(I_ir == 8'h2F)|(I_ir == 8'h06)|(I_ir == 8'h00)|(I_ir == 8'hEF)|(I_ir == 8'h0F)|(I_ir == 8'h56)|(I_ir == 8'h57)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h3E)|(I_ir == 8'h0E)|(I_ir == 8'hDB)|(I_ir == 8'h6E)|(I_ir == 8'hCF)|(I_ir == 8'h1F)|(I_ir == 8'h83)|(I_ir == 8'h5E)|(I_ir == 8'hEF)|(I_ir == 8'h2E)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'h91)|(I_ir == 8'hFF)|(I_ir == 8'hDE)|(I_ir == 8'h4E)|(I_ir == 8'h1B)|(I_ir == 8'h1E)|(I_ir == 8'h56)|(I_ir == 8'hDF)|(I_ir == 8'hF6)|(I_ir == 8'h81)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'hF7)|(I_ir == 8'hD6)|(I_ir == 8'hD7)|(I_ir == 8'h3F)|(I_ir == 8'h7F)|(I_ir == 8'h7E)|(I_ir == 8'h16)|(I_ir == 8'h5B)|(I_ir == 8'hFE)|(I_ir == 8'hEE)|(I_ir == 8'hFB)|(I_ir == 8'hCE)))|
	                         ((I_t == 4'd7)&((I_ir == 8'hE3)|(I_ir == 8'hD3)|(I_ir == 8'hF3)|(I_ir == 8'hC3)))|
	                         ((I_t == 4'd2)&((I_ir == 8'h87)|(I_ir == 8'h00)|(I_ir == 8'h85)|(I_ir == 8'h86)|(I_ir == 8'h84)|(I_ir == 8'h08)|(I_ir == 8'h48)))|
	                         ((I_t == 4'd1)&(I_ir == 8'hCB)));
	
	assign O_control[  4] = (((I_t == 4'd2)&(I_ir == 8'h00))|
	                         ((I_t == 4'd3)&(I_ir == 8'h20)));
	
	assign O_control[  5] = (((I_t == 4'd2)&((I_ir == 8'h00)|(I_ir == 8'h08)|(I_ir == 8'h48)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h00)|(I_ir == 8'h20)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h20)|(I_ir == 8'h00))));
	
	assign O_control[  6] = (((I_t == 4'd2)&(I_ir == 8'h00)));
	
	assign O_control[  7] = (((I_t == 4'd3)&(I_ir == 8'h00))|
	                         ((I_t == 4'd4)&(I_ir == 8'h20)));
	
	assign O_control[  8] = (((I_t == 4'd2)&(I_ir == 8'h08))|
	                         ((I_t == 4'd4)&(I_ir == 8'h00)));
	
	assign O_control[  9] = (((I_t == 4'd5)&(I_ir == 8'h00)));
	
	assign O_control[ 10] = (((I_t == 4'd1)&((I_ir == 8'hD1)|(I_ir == 8'hD7)|(I_ir == 8'hC7)|(I_ir == 8'hF5)|(I_ir == 8'h34)|(I_ir == 8'h95)|(I_ir == 8'h85)|(I_ir == 8'hC5)|(I_ir == 8'h86)|(I_ir == 8'h14)|(I_ir == 8'h65)|(I_ir == 8'hC6)|(I_ir == 8'h17)|(I_ir == 8'h11)|(I_ir == 8'h53)|(I_ir == 8'hB4)|(I_ir == 8'hCD)|(I_ir == 8'h20)|(I_ir == 8'hEE)|(I_ir == 8'h77)|(I_ir == 8'h67)|(I_ir == 8'h8E)|(I_ir == 8'h84)|(I_ir == 8'hCE)|(I_ir == 8'h0F)|(I_ir == 8'h2C)|(I_ir == 8'h35)|(I_ir == 8'hED)|(I_ir == 8'h2E)|(I_ir == 8'h66)|(I_ir == 8'h54)|(I_ir == 8'h73)|(I_ir == 8'h33)|(I_ir == 8'h0E)|(I_ir == 8'h57)|(I_ir == 8'h94)|(I_ir == 8'h25)|(I_ir == 8'h6E)|(I_ir == 8'hCF)|(I_ir == 8'hE6)|(I_ir == 8'h2D)|(I_ir == 8'h55)|(I_ir == 8'hB6)|(I_ir == 8'h8D)|(I_ir == 8'h07)|(I_ir == 8'hAC)|(I_ir == 8'h2F)|(I_ir == 8'h06)|(I_ir == 8'hE4)|(I_ir == 8'hF1)|(I_ir == 8'hD5)|(I_ir == 8'h26)|(I_ir == 8'h37)|(I_ir == 8'h4E)|(I_ir == 8'h05)|(I_ir == 8'hA5)|(I_ir == 8'hEF)|(I_ir == 8'hD3)|(I_ir == 8'h24)|(I_ir == 8'h6D)|(I_ir == 8'h31)|(I_ir == 8'h4C)|(I_ir == 8'hB7)|(I_ir == 8'hC4)|(I_ir == 8'h15)|(I_ir == 8'h91)|(I_ir == 8'h97)|(I_ir == 8'h87)|(I_ir == 8'h75)|(I_ir == 8'hB5)|(I_ir == 8'hCC)|(I_ir == 8'h13)|(I_ir == 8'hA6)|(I_ir == 8'hD4)|(I_ir == 8'h76)|(I_ir == 8'h4D)|(I_ir == 8'h74)|(I_ir == 8'h64)|(I_ir == 8'h71)|(I_ir == 8'hAE)|(I_ir == 8'hA4)|(I_ir == 8'h0C)|(I_ir == 8'h27)|(I_ir == 8'hB1)|(I_ir == 8'hAF)|(I_ir == 8'h44)|(I_ir == 8'hF6)|(I_ir == 8'h47)|(I_ir == 8'hEC)|(I_ir == 8'h56)|(I_ir == 8'h6F)|(I_ir == 8'hA7)|(I_ir == 8'hAD)|(I_ir == 8'hE7)|(I_ir == 8'h16)|(I_ir == 8'hF4)|(I_ir == 8'h46)|(I_ir == 8'hE5)|(I_ir == 8'h36)|(I_ir == 8'h51)|(I_ir == 8'h0D)|(I_ir == 8'h4F)|(I_ir == 8'h45)|(I_ir == 8'h8F)|(I_ir == 8'h96)|(I_ir == 8'hF7)|(I_ir == 8'h8C)|(I_ir == 8'hB3)|(I_ir == 8'h04)|(I_ir == 8'hD6)|(I_ir == 8'hF3)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h01)|(I_ir == 8'h23)|(I_ir == 8'hA3)|(I_ir == 8'hE3)|(I_ir == 8'hA1)|(I_ir == 8'h83)|(I_ir == 8'h41)|(I_ir == 8'h63)|(I_ir == 8'h6C)|(I_ir == 8'h43)|(I_ir == 8'h61)|(I_ir == 8'hE1)|(I_ir == 8'hC3)|(I_ir == 8'h21)|(I_ir == 8'h81)|(I_ir == 8'hC1)|(I_ir == 8'h03)))|
	                         ((I_t == 4'd5)&(I_ir == 8'h00)));
	
	assign O_control[ 11] = (((I_t == 4'd6)&(I_ir == 8'h00)));
	
	assign O_control[ 12] = (((I_t == 4'd2)&((I_ir == 8'h5F)|(I_ir == 8'h8F)|(I_ir == 8'h8D)|(I_ir == 8'hAC)|(I_ir == 8'h2F)|(I_ir == 8'h1D)|(I_ir == 8'h5D)|(I_ir == 8'hFD)|(I_ir == 8'h4E)|(I_ir == 8'h3F)|(I_ir == 8'h7C)|(I_ir == 8'h1E)|(I_ir == 8'h7F)|(I_ir == 8'h0C)|(I_ir == 8'h6D)|(I_ir == 8'h4C)|(I_ir == 8'h59)|(I_ir == 8'hDF)|(I_ir == 8'hEC)|(I_ir == 8'h3D)|(I_ir == 8'hFF)|(I_ir == 8'hFE)|(I_ir == 8'h4F)|(I_ir == 8'hCC)|(I_ir == 8'h5C)|(I_ir == 8'hD9)|(I_ir == 8'hDE)|(I_ir == 8'hCE)|(I_ir == 8'h1F)|(I_ir == 8'h0D)|(I_ir == 8'hFC)|(I_ir == 8'h4D)|(I_ir == 8'hAE)|(I_ir == 8'h19)|(I_ir == 8'h6F)|(I_ir == 8'hB9)|(I_ir == 8'h9D)|(I_ir == 8'h8E)|(I_ir == 8'hBC)|(I_ir == 8'hEE)|(I_ir == 8'h5E)|(I_ir == 8'h8C)|(I_ir == 8'h99)|(I_ir == 8'h2C)|(I_ir == 8'hEF)|(I_ir == 8'hED)|(I_ir == 8'h3E)|(I_ir == 8'hDD)|(I_ir == 8'h2E)|(I_ir == 8'h3B)|(I_ir == 8'h7E)|(I_ir == 8'h6E)|(I_ir == 8'h7B)|(I_ir == 8'h79)|(I_ir == 8'h0E)|(I_ir == 8'h3C)|(I_ir == 8'hDB)|(I_ir == 8'hCD)|(I_ir == 8'hCF)|(I_ir == 8'h39)|(I_ir == 8'h2D)|(I_ir == 8'hFB)|(I_ir == 8'h5B)|(I_ir == 8'hBE)|(I_ir == 8'hBF)|(I_ir == 8'hAF)|(I_ir == 8'h1B)|(I_ir == 8'h0F)|(I_ir == 8'h1C)|(I_ir == 8'h7D)|(I_ir == 8'hF9)|(I_ir == 8'hBD)|(I_ir == 8'hAD)|(I_ir == 8'hDC)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h71)|(I_ir == 8'hD1)|(I_ir == 8'h33)|(I_ir == 8'h53)|(I_ir == 8'h11)|(I_ir == 8'hF1)|(I_ir == 8'hD3)|(I_ir == 8'h91)|(I_ir == 8'h73)|(I_ir == 8'h31)|(I_ir == 8'h13)|(I_ir == 8'hB3)|(I_ir == 8'hF3)|(I_ir == 8'hB1)|(I_ir == 8'h51)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h83)|(I_ir == 8'h63)|(I_ir == 8'h21)|(I_ir == 8'h61)|(I_ir == 8'hA3)|(I_ir == 8'h03)|(I_ir == 8'hE1)|(I_ir == 8'h01)|(I_ir == 8'hC3)|(I_ir == 8'h81)|(I_ir == 8'hC1)|(I_ir == 8'hE3)|(I_ir == 8'hA1)|(I_ir == 8'h6C)|(I_ir == 8'h43)|(I_ir == 8'h23)|(I_ir == 8'h41)))|
	                         ((I_t == 4'd6)&(I_ir == 8'h00))|
	                         ((I_t == 4'd5)&(I_ir == 8'h20)));
	
	assign O_control[ 13] = (((I_t == 4'd5)&(I_ir == 8'h20))|
	                         ((I_t == 4'd6)&(I_ir == 8'h00))|
	                         ((I_t == 4'd2)&(I_ir == 8'h4C))|
	                         ((I_t == 4'd4)&(I_ir == 8'h6C)));
	
	assign O_control[ 14] = (((I_t == 4'd5)&((I_ir == 8'h0F)|(I_ir == 8'h57)|(I_ir == 8'h01)|(I_ir == 8'h0E)|(I_ir == 8'hA1)|(I_ir == 8'h6E)|(I_ir == 8'hCF)|(I_ir == 8'h83)|(I_ir == 8'hF1)|(I_ir == 8'h60)|(I_ir == 8'h40)|(I_ir == 8'hEF)|(I_ir == 8'h2E)|(I_ir == 8'h31)|(I_ir == 8'h91)|(I_ir == 8'h2F)|(I_ir == 8'h41)|(I_ir == 8'h4E)|(I_ir == 8'hE1)|(I_ir == 8'h56)|(I_ir == 8'hF6)|(I_ir == 8'h81)|(I_ir == 8'hC1)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'h71)|(I_ir == 8'hF7)|(I_ir == 8'h37)|(I_ir == 8'hD6)|(I_ir == 8'hD1)|(I_ir == 8'hD7)|(I_ir == 8'h6F)|(I_ir == 8'hB1)|(I_ir == 8'h20)|(I_ir == 8'h16)|(I_ir == 8'h21)|(I_ir == 8'h11)|(I_ir == 8'h17)|(I_ir == 8'h61)|(I_ir == 8'h51)|(I_ir == 8'h4F)|(I_ir == 8'hEE)|(I_ir == 8'h77)|(I_ir == 8'hB3)|(I_ir == 8'hCE)|(I_ir == 8'hA3)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h8C)|(I_ir == 8'hED)|(I_ir == 8'h70)|(I_ir == 8'h34)|(I_ir == 8'h94)|(I_ir == 8'h50)|(I_ir == 8'hF5)|(I_ir == 8'hB6)|(I_ir == 8'h8D)|(I_ir == 8'hF4)|(I_ir == 8'h35)|(I_ir == 8'h10)|(I_ir == 8'h96)|(I_ir == 8'hAF)|(I_ir == 8'h97)|(I_ir == 8'h75)|(I_ir == 8'h2D)|(I_ir == 8'hCC)|(I_ir == 8'hB0)|(I_ir == 8'hCD)|(I_ir == 8'h68)|(I_ir == 8'hAC)|(I_ir == 8'h90)|(I_ir == 8'h74)|(I_ir == 8'h28)|(I_ir == 8'hAE)|(I_ir == 8'hD5)|(I_ir == 8'hB7)|(I_ir == 8'hAD)|(I_ir == 8'h15)|(I_ir == 8'hB4)|(I_ir == 8'h55)|(I_ir == 8'hB5)|(I_ir == 8'h8F)|(I_ir == 8'hF0)|(I_ir == 8'hD4)|(I_ir == 8'h4D)|(I_ir == 8'h0C)|(I_ir == 8'h6D)|(I_ir == 8'h95)|(I_ir == 8'h30)|(I_ir == 8'hEC)|(I_ir == 8'h14)|(I_ir == 8'hD0)|(I_ir == 8'h8E)|(I_ir == 8'h0D)|(I_ir == 8'h2C)|(I_ir == 8'h54)))|
	                         ((I_t == 4'd1)&((I_ir == 8'h18)|(I_ir == 8'h5A)|(I_ir == 8'h88)|(I_ir == 8'hC0)|(I_ir == 8'h49)|(I_ir == 8'hA0)|(I_ir == 8'hA2)|(I_ir == 8'hC9)|(I_ir == 8'hFA)|(I_ir == 8'h4A)|(I_ir == 8'hAB)|(I_ir == 8'hB8)|(I_ir == 8'h09)|(I_ir == 8'hEB)|(I_ir == 8'h1A)|(I_ir == 8'hF8)|(I_ir == 8'h69)|(I_ir == 8'hA9)|(I_ir == 8'h9A)|(I_ir == 8'hCA)|(I_ir == 8'hDA)|(I_ir == 8'h38)|(I_ir == 8'hC8)|(I_ir == 8'h6A)|(I_ir == 8'hCB)|(I_ir == 8'h58)|(I_ir == 8'h98)|(I_ir == 8'h89)|(I_ir == 8'hEA)|(I_ir == 8'hE0)|(I_ir == 8'h3A)|(I_ir == 8'h7A)|(I_ir == 8'hC2)|(I_ir == 8'h2A)|(I_ir == 8'h80)|(I_ir == 8'hE9)|(I_ir == 8'hBA)|(I_ir == 8'h0A)|(I_ir == 8'hAA)|(I_ir == 8'hE2)|(I_ir == 8'hD8)|(I_ir == 8'hE8)|(I_ir == 8'h29)|(I_ir == 8'h78)|(I_ir == 8'hA8)|(I_ir == 8'h8A)))|
	                         ((I_t == 4'd6)&((I_ir == 8'hFE)|(I_ir == 8'hFF)|(I_ir == 8'hDE)|(I_ir == 8'h1F)|(I_ir == 8'h3F)|(I_ir == 8'hDF)|(I_ir == 8'h5E)|(I_ir == 8'h3E)|(I_ir == 8'h7E)|(I_ir == 8'hFB)|(I_ir == 8'h5B)|(I_ir == 8'h00)|(I_ir == 8'h1B)|(I_ir == 8'h3B)|(I_ir == 8'hDB)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'h1E)|(I_ir == 8'h7F)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hE7)|(I_ir == 8'hD9)|(I_ir == 8'h39)|(I_ir == 8'h46)|(I_ir == 8'hFD)|(I_ir == 8'hBE)|(I_ir == 8'h27)|(I_ir == 8'hF9)|(I_ir == 8'hB9)|(I_ir == 8'hC6)|(I_ir == 8'h9D)|(I_ir == 8'h59)|(I_ir == 8'h3D)|(I_ir == 8'h5C)|(I_ir == 8'hFC)|(I_ir == 8'h19)|(I_ir == 8'h79)|(I_ir == 8'hDC)|(I_ir == 8'h3C)|(I_ir == 8'h07)|(I_ir == 8'hBC)|(I_ir == 8'hBF)|(I_ir == 8'h26)|(I_ir == 8'h99)|(I_ir == 8'h66)|(I_ir == 8'h7D)|(I_ir == 8'hC7)|(I_ir == 8'hBD)|(I_ir == 8'hE6)|(I_ir == 8'h6C)|(I_ir == 8'h06)|(I_ir == 8'h1D)|(I_ir == 8'h5D)|(I_ir == 8'h67)|(I_ir == 8'h7C)|(I_ir == 8'h1C)|(I_ir == 8'hDD)|(I_ir == 8'h47)))|
	                         ((I_t == 4'd7)&((I_ir == 8'h33)|(I_ir == 8'hE3)|(I_ir == 8'hD3)|(I_ir == 8'h73)|(I_ir == 8'h63)|(I_ir == 8'h43)|(I_ir == 8'h13)|(I_ir == 8'hF3)|(I_ir == 8'hC3)|(I_ir == 8'h03)|(I_ir == 8'h53)|(I_ir == 8'h23)))|
	                         ((I_t == 4'd2)&((I_ir == 8'h04)|(I_ir == 8'h44)|(I_ir == 8'hA5)|(I_ir == 8'h4C)|(I_ir == 8'hC4)|(I_ir == 8'h87)|(I_ir == 8'h45)|(I_ir == 8'hA6)|(I_ir == 8'h64)|(I_ir == 8'hA4)|(I_ir == 8'h25)|(I_ir == 8'h65)|(I_ir == 8'hA7)|(I_ir == 8'hC5)|(I_ir == 8'h48)|(I_ir == 8'hE5)|(I_ir == 8'hE4)|(I_ir == 8'h05)|(I_ir == 8'h85)|(I_ir == 8'h86)|(I_ir == 8'h84)|(I_ir == 8'h24)|(I_ir == 8'h08))));
	
	assign O_control[ 15] = (((I_t == 4'd1)&((I_ir == 8'hD1)|(I_ir == 8'hC7)|(I_ir == 8'hD7)|(I_ir == 8'h3F)|(I_ir == 8'h50)|(I_ir == 8'h3E)|(I_ir == 8'h34)|(I_ir == 8'hF5)|(I_ir == 8'h7E)|(I_ir == 8'h95)|(I_ir == 8'h85)|(I_ir == 8'h01)|(I_ir == 8'h79)|(I_ir == 8'hC5)|(I_ir == 8'h3D)|(I_ir == 8'h86)|(I_ir == 8'h14)|(I_ir == 8'hC3)|(I_ir == 8'hD0)|(I_ir == 8'h65)|(I_ir == 8'h21)|(I_ir == 8'h3C)|(I_ir == 8'h11)|(I_ir == 8'h17)|(I_ir == 8'hC0)|(I_ir == 8'h53)|(I_ir == 8'hB4)|(I_ir == 8'h49)|(I_ir == 8'hC6)|(I_ir == 8'h20)|(I_ir == 8'hCD)|(I_ir == 8'hFE)|(I_ir == 8'hEE)|(I_ir == 8'hA0)|(I_ir == 8'hFB)|(I_ir == 8'h77)|(I_ir == 8'h67)|(I_ir == 8'h8E)|(I_ir == 8'h84)|(I_ir == 8'h5B)|(I_ir == 8'hCE)|(I_ir == 8'h1F)|(I_ir == 8'h0F)|(I_ir == 8'h2C)|(I_ir == 8'h03)|(I_ir == 8'hA2)|(I_ir == 8'hC9)|(I_ir == 8'hBF)|(I_ir == 8'h35)|(I_ir == 8'h10)|(I_ir == 8'hA3)|(I_ir == 8'hF9)|(I_ir == 8'hED)|(I_ir == 8'hDD)|(I_ir == 8'h2E)|(I_ir == 8'h70)|(I_ir == 8'h66)|(I_ir == 8'h7D)|(I_ir == 8'h54)|(I_ir == 8'h73)|(I_ir == 8'hBD)|(I_ir == 8'h33)|(I_ir == 8'h0E)|(I_ir == 8'h57)|(I_ir == 8'h94)|(I_ir == 8'h25)|(I_ir == 8'hAB)|(I_ir == 8'hA1)|(I_ir == 8'h09)|(I_ir == 8'hEB)|(I_ir == 8'hDB)|(I_ir == 8'h6E)|(I_ir == 8'hCF)|(I_ir == 8'hE6)|(I_ir == 8'h7B)|(I_ir == 8'hDC)|(I_ir == 8'h2D)|(I_ir == 8'h69)|(I_ir == 8'h5F)|(I_ir == 8'h55)|(I_ir == 8'h6C)|(I_ir == 8'hA9)|(I_ir == 8'h43)|(I_ir == 8'hB6)|(I_ir == 8'h07)|(I_ir == 8'h8D)|(I_ir == 8'h83)|(I_ir == 8'hAC)|(I_ir == 8'h2F)|(I_ir == 8'h90)|(I_ir == 8'h06)|(I_ir == 8'hE4)|(I_ir == 8'hF1)|(I_ir == 8'h5D)|(I_ir == 8'hBE)|(I_ir == 8'hD5)|(I_ir == 8'h26)|(I_ir == 8'h41)|(I_ir == 8'h1C)|(I_ir == 8'h37)|(I_ir == 8'hCB)|(I_ir == 8'h5E)|(I_ir == 8'h05)|(I_ir == 8'h4E)|(I_ir == 8'hA5)|(I_ir == 8'h7C)|(I_ir == 8'h99)|(I_ir == 8'hEF)|(I_ir == 8'h89)|(I_ir == 8'hD3)|(I_ir == 8'h24)|(I_ir == 8'h6D)|(I_ir == 8'h3B)|(I_ir == 8'hE0)|(I_ir == 8'h31)|(I_ir == 8'h4C)|(I_ir == 8'hB7)|(I_ir == 8'hC4)|(I_ir == 8'h59)|(I_ir == 8'h15)|(I_ir == 8'h30)|(I_ir == 8'h91)|(I_ir == 8'h97)|(I_ir == 8'h87)|(I_ir == 8'h75)|(I_ir == 8'hFF)|(I_ir == 8'hDE)|(I_ir == 8'hB5)|(I_ir == 8'hCC)|(I_ir == 8'h1D)|(I_ir == 8'h23)|(I_ir == 8'h13)|(I_ir == 8'hC2)|(I_ir == 8'hD9)|(I_ir == 8'hB0)|(I_ir == 8'hA6)|(I_ir == 8'h39)|(I_ir == 8'hF0)|(I_ir == 8'hFD)|(I_ir == 8'hD4)|(I_ir == 8'h76)|(I_ir == 8'h80)|(I_ir == 8'h4D)|(I_ir == 8'hE1)|(I_ir == 8'h74)|(I_ir == 8'h64)|(I_ir == 8'h71)|(I_ir == 8'h1E)|(I_ir == 8'hA4)|(I_ir == 8'hAE)|(I_ir == 8'h0C)|(I_ir == 8'h27)|(I_ir == 8'hB1)|(I_ir == 8'hAF)|(I_ir == 8'h44)|(I_ir == 8'h19)|(I_ir == 8'h1B)|(I_ir == 8'hE9)|(I_ir == 8'hDF)|(I_ir == 8'hF6)|(I_ir == 8'h47)|(I_ir == 8'hEC)|(I_ir == 8'h7F)|(I_ir == 8'h56)|(I_ir == 8'h6F)|(I_ir == 8'h63)|(I_ir == 8'hB9)|(I_ir == 8'hA7)|(I_ir == 8'hAD)|(I_ir == 8'h9D)|(I_ir == 8'hE3)|(I_ir == 8'hE7)|(I_ir == 8'h81)|(I_ir == 8'h16)|(I_ir == 8'hF4)|(I_ir == 8'hC1)|(I_ir == 8'hE2)|(I_ir == 8'h29)|(I_ir == 8'h46)|(I_ir == 8'h61)|(I_ir == 8'h36)|(I_ir == 8'h51)|(I_ir == 8'h0D)|(I_ir == 8'hBC)|(I_ir == 8'hE5)|(I_ir == 8'h4F)|(I_ir == 8'h45)|(I_ir == 8'hFC)|(I_ir == 8'h5C)|(I_ir == 8'h8F)|(I_ir == 8'h96)|(I_ir == 8'hF7)|(I_ir == 8'h8C)|(I_ir == 8'hB3)|(I_ir == 8'h04)|(I_ir == 8'hD6)|(I_ir == 8'hF3)))|
	                         ((I_t == 4'd2)&((I_ir == 8'h5F)|(I_ir == 8'h6C)|(I_ir == 8'h8F)|(I_ir == 8'h8D)|(I_ir == 8'hAC)|(I_ir == 8'h2F)|(I_ir == 8'h1D)|(I_ir == 8'h5D)|(I_ir == 8'h4E)|(I_ir == 8'h3F)|(I_ir == 8'h7C)|(I_ir == 8'h1E)|(I_ir == 8'h7F)|(I_ir == 8'h0C)|(I_ir == 8'h6D)|(I_ir == 8'h59)|(I_ir == 8'hDF)|(I_ir == 8'h3D)|(I_ir == 8'hEC)|(I_ir == 8'hFF)|(I_ir == 8'hFE)|(I_ir == 8'h4F)|(I_ir == 8'hCC)|(I_ir == 8'h5C)|(I_ir == 8'hD9)|(I_ir == 8'hCE)|(I_ir == 8'hDE)|(I_ir == 8'h1F)|(I_ir == 8'h0D)|(I_ir == 8'hFC)|(I_ir == 8'h4D)|(I_ir == 8'hAE)|(I_ir == 8'h19)|(I_ir == 8'h6F)|(I_ir == 8'hB9)|(I_ir == 8'h9D)|(I_ir == 8'h8E)|(I_ir == 8'hBC)|(I_ir == 8'h5E)|(I_ir == 8'hEE)|(I_ir == 8'h8C)|(I_ir == 8'h99)|(I_ir == 8'h2C)|(I_ir == 8'hEF)|(I_ir == 8'hED)|(I_ir == 8'h3E)|(I_ir == 8'h2E)|(I_ir == 8'hDD)|(I_ir == 8'h3B)|(I_ir == 8'h7E)|(I_ir == 8'h6E)|(I_ir == 8'h7B)|(I_ir == 8'h79)|(I_ir == 8'h0E)|(I_ir == 8'h3C)|(I_ir == 8'hDB)|(I_ir == 8'hCD)|(I_ir == 8'hCF)|(I_ir == 8'h39)|(I_ir == 8'h2D)|(I_ir == 8'hFD)|(I_ir == 8'hFB)|(I_ir == 8'h5B)|(I_ir == 8'hBE)|(I_ir == 8'hAF)|(I_ir == 8'hBF)|(I_ir == 8'h1B)|(I_ir == 8'h0F)|(I_ir == 8'h1C)|(I_ir == 8'h7D)|(I_ir == 8'hF9)|(I_ir == 8'hBD)|(I_ir == 8'hAD)|(I_ir == 8'hDC)))|
	                         ((I_t == 4'd5)&(I_ir == 8'h60)));
	
	assign O_control[ 16] = (((I_t == 4'd1)&((I_ir == 8'hA1)|(I_ir == 8'h01)|(I_ir == 8'hC1)|(I_ir == 8'h43)|(I_ir == 8'h03)|(I_ir == 8'h63)|(I_ir == 8'h23)|(I_ir == 8'hE1)|(I_ir == 8'h41)|(I_ir == 8'h83)|(I_ir == 8'hC3)|(I_ir == 8'h61)|(I_ir == 8'hA3)|(I_ir == 8'h21)|(I_ir == 8'hE3)|(I_ir == 8'h81))));
	
	assign O_control[ 17] = (((I_t == 4'd1)&((I_ir == 8'hDD)|(I_ir == 8'h7C)|(I_ir == 8'h3F)|(I_ir == 8'h19)|(I_ir == 8'h1B)|(I_ir == 8'h7D)|(I_ir == 8'h99)|(I_ir == 8'hF9)|(I_ir == 8'h3E)|(I_ir == 8'hDF)|(I_ir == 8'hBD)|(I_ir == 8'h7E)|(I_ir == 8'h3B)|(I_ir == 8'hA1)|(I_ir == 8'h7F)|(I_ir == 8'h01)|(I_ir == 8'h59)|(I_ir == 8'h79)|(I_ir == 8'hDB)|(I_ir == 8'h63)|(I_ir == 8'hB9)|(I_ir == 8'h3D)|(I_ir == 8'hC3)|(I_ir == 8'h9D)|(I_ir == 8'h7B)|(I_ir == 8'hDC)|(I_ir == 8'h21)|(I_ir == 8'h3C)|(I_ir == 8'hFF)|(I_ir == 8'h81)|(I_ir == 8'h5F)|(I_ir == 8'hDE)|(I_ir == 8'h6C)|(I_ir == 8'hC1)|(I_ir == 8'h43)|(I_ir == 8'hFE)|(I_ir == 8'h1D)|(I_ir == 8'h23)|(I_ir == 8'hFB)|(I_ir == 8'h83)|(I_ir == 8'hD9)|(I_ir == 8'h61)|(I_ir == 8'hBC)|(I_ir == 8'h5B)|(I_ir == 8'h39)|(I_ir == 8'hFC)|(I_ir == 8'h1F)|(I_ir == 8'h5C)|(I_ir == 8'hFD)|(I_ir == 8'h5D)|(I_ir == 8'hBE)|(I_ir == 8'h03)|(I_ir == 8'hE1)|(I_ir == 8'hBF)|(I_ir == 8'h41)|(I_ir == 8'h1C)|(I_ir == 8'h5E)|(I_ir == 8'hA3)|(I_ir == 8'hE3)|(I_ir == 8'h1E)))|
	                         ((I_t == 4'd2)&((I_ir == 8'h11)|(I_ir == 8'h51)|(I_ir == 8'hB3)|(I_ir == 8'h13)|(I_ir == 8'hF1)|(I_ir == 8'hF3)|(I_ir == 8'h71)|(I_ir == 8'hD1)|(I_ir == 8'h33)|(I_ir == 8'hB1)|(I_ir == 8'h73)|(I_ir == 8'h91)|(I_ir == 8'hD3)|(I_ir == 8'h31)|(I_ir == 8'h53))));
	
	assign O_control[ 18] = (((I_t == 4'd2)&((I_ir == 8'h81)|(I_ir == 8'h23)|(I_ir == 8'h43)|(I_ir == 8'h83)|(I_ir == 8'h61)|(I_ir == 8'hC1)|(I_ir == 8'hE1)|(I_ir == 8'h41)|(I_ir == 8'hA3)|(I_ir == 8'h03)|(I_ir == 8'hE3)|(I_ir == 8'hC3)|(I_ir == 8'hA1)|(I_ir == 8'h01)|(I_ir == 8'h63)|(I_ir == 8'h21)))|
	                         ((I_t == 4'd3)&((I_ir == 8'hE1)|(I_ir == 8'h41)|(I_ir == 8'hA3)|(I_ir == 8'h01)|(I_ir == 8'h63)|(I_ir == 8'hE3)|(I_ir == 8'hC3)|(I_ir == 8'hA1)|(I_ir == 8'h21)|(I_ir == 8'h23)|(I_ir == 8'h6C)|(I_ir == 8'h43)|(I_ir == 8'h81)|(I_ir == 8'h61)|(I_ir == 8'hC1)|(I_ir == 8'h83)|(I_ir == 8'h03)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h6C)|(I_ir == 8'h43)|(I_ir == 8'h21)|(I_ir == 8'h81)|(I_ir == 8'h61)|(I_ir == 8'hC1)|(I_ir == 8'h23)|(I_ir == 8'h83)|(I_ir == 8'h41)|(I_ir == 8'hA3)|(I_ir == 8'h03)|(I_ir == 8'hE1)|(I_ir == 8'hE3)|(I_ir == 8'hA1)|(I_ir == 8'h01)|(I_ir == 8'h63)|(I_ir == 8'hC3))));
	
	assign O_control[ 19] = (((I_t == 4'd2)&((I_ir == 8'h5F)|(I_ir == 8'h43)|(I_ir == 8'h83)|(I_ir == 8'h1D)|(I_ir == 8'h5D)|(I_ir == 8'h41)|(I_ir == 8'hFD)|(I_ir == 8'h3F)|(I_ir == 8'h7C)|(I_ir == 8'h1E)|(I_ir == 8'h7F)|(I_ir == 8'hC3)|(I_ir == 8'h59)|(I_ir == 8'hDF)|(I_ir == 8'h3D)|(I_ir == 8'h21)|(I_ir == 8'hFF)|(I_ir == 8'hFE)|(I_ir == 8'h5C)|(I_ir == 8'hD9)|(I_ir == 8'hC1)|(I_ir == 8'hDE)|(I_ir == 8'h1F)|(I_ir == 8'hE1)|(I_ir == 8'hFC)|(I_ir == 8'h19)|(I_ir == 8'h63)|(I_ir == 8'hB9)|(I_ir == 8'h9D)|(I_ir == 8'h81)|(I_ir == 8'h23)|(I_ir == 8'h61)|(I_ir == 8'hBC)|(I_ir == 8'h5E)|(I_ir == 8'h99)|(I_ir == 8'h03)|(I_ir == 8'h3E)|(I_ir == 8'hDD)|(I_ir == 8'hE3)|(I_ir == 8'h3B)|(I_ir == 8'h7E)|(I_ir == 8'h01)|(I_ir == 8'h7B)|(I_ir == 8'h79)|(I_ir == 8'hDB)|(I_ir == 8'h3C)|(I_ir == 8'h39)|(I_ir == 8'hFB)|(I_ir == 8'h5B)|(I_ir == 8'hBE)|(I_ir == 8'hBF)|(I_ir == 8'h1B)|(I_ir == 8'hA3)|(I_ir == 8'h1C)|(I_ir == 8'h7D)|(I_ir == 8'hF9)|(I_ir == 8'hBD)|(I_ir == 8'hA1)|(I_ir == 8'hDC)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h71)|(I_ir == 8'h01)|(I_ir == 8'hD1)|(I_ir == 8'h33)|(I_ir == 8'h53)|(I_ir == 8'h23)|(I_ir == 8'h11)|(I_ir == 8'hF1)|(I_ir == 8'hA3)|(I_ir == 8'hE3)|(I_ir == 8'hD3)|(I_ir == 8'hA1)|(I_ir == 8'h91)|(I_ir == 8'h83)|(I_ir == 8'h41)|(I_ir == 8'h73)|(I_ir == 8'h63)|(I_ir == 8'h31)|(I_ir == 8'h6C)|(I_ir == 8'h43)|(I_ir == 8'h61)|(I_ir == 8'h13)|(I_ir == 8'hB3)|(I_ir == 8'hF3)|(I_ir == 8'hE1)|(I_ir == 8'hB1)|(I_ir == 8'hC3)|(I_ir == 8'h21)|(I_ir == 8'h81)|(I_ir == 8'hC1)|(I_ir == 8'h51)|(I_ir == 8'h03))));
	
	assign O_control[ 20] = (((I_t == 4'd2)&((I_ir == 8'hFF)|(I_ir == 8'h75)|(I_ir == 8'h16)|(I_ir == 8'h5F)|(I_ir == 8'h81)|(I_ir == 8'h55)|(I_ir == 8'hB4)|(I_ir == 8'h23)|(I_ir == 8'hFE)|(I_ir == 8'h43)|(I_ir == 8'h17)|(I_ir == 8'h5C)|(I_ir == 8'h77)|(I_ir == 8'h83)|(I_ir == 8'h61)|(I_ir == 8'hBC)|(I_ir == 8'hB5)|(I_ir == 8'hC1)|(I_ir == 8'h74)|(I_ir == 8'hF4)|(I_ir == 8'h5E)|(I_ir == 8'hDE)|(I_ir == 8'h1D)|(I_ir == 8'h35)|(I_ir == 8'h1F)|(I_ir == 8'h36)|(I_ir == 8'h5D)|(I_ir == 8'hD5)|(I_ir == 8'h76)|(I_ir == 8'hE1)|(I_ir == 8'h41)|(I_ir == 8'hFC)|(I_ir == 8'h37)|(I_ir == 8'hFD)|(I_ir == 8'hD4)|(I_ir == 8'hA3)|(I_ir == 8'h03)|(I_ir == 8'hF7)|(I_ir == 8'hD7)|(I_ir == 8'h1C)|(I_ir == 8'hD6)|(I_ir == 8'h3F)|(I_ir == 8'h7C)|(I_ir == 8'h56)|(I_ir == 8'h34)|(I_ir == 8'h7D)|(I_ir == 8'h1E)|(I_ir == 8'h54)|(I_ir == 8'h7F)|(I_ir == 8'h3E)|(I_ir == 8'h95)|(I_ir == 8'hDD)|(I_ir == 8'hE3)|(I_ir == 8'hBD)|(I_ir == 8'h15)|(I_ir == 8'h57)|(I_ir == 8'h94)|(I_ir == 8'h7E)|(I_ir == 8'hC3)|(I_ir == 8'hF6)|(I_ir == 8'hA1)|(I_ir == 8'h01)|(I_ir == 8'hF5)|(I_ir == 8'hDF)|(I_ir == 8'h63)|(I_ir == 8'h3D)|(I_ir == 8'h14)|(I_ir == 8'h9D)|(I_ir == 8'hDC)|(I_ir == 8'h21)|(I_ir == 8'h3C))));
	
	assign O_control[ 21] = (((I_t == 4'd2)&((I_ir == 8'h81)|(I_ir == 8'hA1)|(I_ir == 8'h01)|(I_ir == 8'h23)|(I_ir == 8'hA3)|(I_ir == 8'hC3)|(I_ir == 8'h43)|(I_ir == 8'h63)|(I_ir == 8'hE1)|(I_ir == 8'h41)|(I_ir == 8'h83)|(I_ir == 8'hE3)|(I_ir == 8'h61)|(I_ir == 8'hC1)|(I_ir == 8'h21)|(I_ir == 8'h03))));
	
	assign O_control[ 22] = (((I_t == 4'd3)&((I_ir == 8'hE1)|(I_ir == 8'h63)|(I_ir == 8'h41)|(I_ir == 8'h83)|(I_ir == 8'h23)|(I_ir == 8'h6C)|(I_ir == 8'hA1)|(I_ir == 8'h43)|(I_ir == 8'h03)|(I_ir == 8'hA3)|(I_ir == 8'hE3)|(I_ir == 8'h81)|(I_ir == 8'hC3)|(I_ir == 8'h01)|(I_ir == 8'h61)|(I_ir == 8'hC1)|(I_ir == 8'h21))));
	
	assign O_control[ 23] = (((I_t == 4'd3)&((I_ir == 8'hC7)|(I_ir == 8'h33)|(I_ir == 8'h0E)|(I_ir == 8'h53)|(I_ir == 8'hC6)|(I_ir == 8'hB6)|(I_ir == 8'h5E)|(I_ir == 8'hFB)|(I_ir == 8'h67)|(I_ir == 8'h5B)|(I_ir == 8'h66)|(I_ir == 8'h56)|(I_ir == 8'hDB)|(I_ir == 8'hD9)|(I_ir == 8'hCD)|(I_ir == 8'hBE)|(I_ir == 8'hAE)|(I_ir == 8'h26)|(I_ir == 8'hB9)|(I_ir == 8'h31)|(I_ir == 8'hAD)|(I_ir == 8'h15)|(I_ir == 8'h55)|(I_ir == 8'h06)|(I_ir == 8'hFD)|(I_ir == 8'h4D)|(I_ir == 8'h6D)|(I_ir == 8'hEC)|(I_ir == 8'hD0)|(I_ir == 8'h3C)|(I_ir == 8'h9D)|(I_ir == 8'h5C)|(I_ir == 8'h0D)|(I_ir == 8'h8C)|(I_ir == 8'h70)|(I_ir == 8'h34)|(I_ir == 8'hD1)|(I_ir == 8'h94)|(I_ir == 8'hF5)|(I_ir == 8'h7B)|(I_ir == 8'h6F)|(I_ir == 8'h17)|(I_ir == 8'h07)|(I_ir == 8'hF4)|(I_ir == 8'hBF)|(I_ir == 8'hAF)|(I_ir == 8'hEF)|(I_ir == 8'hD3)|(I_ir == 8'h3B)|(I_ir == 8'h5F)|(I_ir == 8'hDE)|(I_ir == 8'h1B)|(I_ir == 8'h0F)|(I_ir == 8'h7E)|(I_ir == 8'hB7)|(I_ir == 8'hE7)|(I_ir == 8'h4F)|(I_ir == 8'h4E)|(I_ir == 8'h3E)|(I_ir == 8'hB1)|(I_ir == 8'h19)|(I_ir == 8'h95)|(I_ir == 8'h59)|(I_ir == 8'h79)|(I_ir == 8'hF6)|(I_ir == 8'h3D)|(I_ir == 8'hFE)|(I_ir == 8'h51)|(I_ir == 8'h2C)|(I_ir == 8'h71)|(I_ir == 8'hED)|(I_ir == 8'hD6)|(I_ir == 8'h50)|(I_ir == 8'h11)|(I_ir == 8'h8D)|(I_ir == 8'hEE)|(I_ir == 8'h35)|(I_ir == 8'h10)|(I_ir == 8'hDD)|(I_ir == 8'h97)|(I_ir == 8'hDC)|(I_ir == 8'hCC)|(I_ir == 8'hB0)|(I_ir == 8'h37)|(I_ir == 8'h73)|(I_ir == 8'h7C)|(I_ir == 8'h57)|(I_ir == 8'hFF)|(I_ir == 8'h46)|(I_ir == 8'h2F)|(I_ir == 8'h13)|(I_ir == 8'h8F)|(I_ir == 8'hF0)|(I_ir == 8'hD4)|(I_ir == 8'h76)|(I_ir == 8'h1E)|(I_ir == 8'hDF)|(I_ir == 8'hCF)|(I_ir == 8'h47)|(I_ir == 8'h8E)|(I_ir == 8'hCE)|(I_ir == 8'h36)|(I_ir == 8'hF7)|(I_ir == 8'h99)|(I_ir == 8'h27)|(I_ir == 8'hBD)|(I_ir == 8'h6E)|(I_ir == 8'hE6)|(I_ir == 8'h16)|(I_ir == 8'hF1)|(I_ir == 8'h5D)|(I_ir == 8'h7D)|(I_ir == 8'h96)|(I_ir == 8'h2E)|(I_ir == 8'h91)|(I_ir == 8'h75)|(I_ir == 8'h39)|(I_ir == 8'h2D)|(I_ir == 8'h1D)|(I_ir == 8'hAC)|(I_ir == 8'h90)|(I_ir == 8'h74)|(I_ir == 8'hD5)|(I_ir == 8'h1C)|(I_ir == 8'hF9)|(I_ir == 8'h7F)|(I_ir == 8'hB4)|(I_ir == 8'hB5)|(I_ir == 8'hB3)|(I_ir == 8'hF3)|(I_ir == 8'hD7)|(I_ir == 8'h3F)|(I_ir == 8'h0C)|(I_ir == 8'h30)|(I_ir == 8'h14)|(I_ir == 8'h77)|(I_ir == 8'h1F)|(I_ir == 8'hBC)|(I_ir == 8'hFC)|(I_ir == 8'h54)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h57)|(I_ir == 8'h83)|(I_ir == 8'hEF)|(I_ir == 8'hD3)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'h43)|(I_ir == 8'hDE)|(I_ir == 8'h4E)|(I_ir == 8'h1B)|(I_ir == 8'hF6)|(I_ir == 8'h71)|(I_ir == 8'hD6)|(I_ir == 8'hB1)|(I_ir == 8'h21)|(I_ir == 8'h11)|(I_ir == 8'h61)|(I_ir == 8'h51)|(I_ir == 8'hFE)|(I_ir == 8'hEE)|(I_ir == 8'h01)|(I_ir == 8'h73)|(I_ir == 8'hFF)|(I_ir == 8'h2F)|(I_ir == 8'h23)|(I_ir == 8'h13)|(I_ir == 8'h1E)|(I_ir == 8'h63)|(I_ir == 8'hDF)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'hF7)|(I_ir == 8'h37)|(I_ir == 8'h7E)|(I_ir == 8'h16)|(I_ir == 8'hC3)|(I_ir == 8'h5B)|(I_ir == 8'h4F)|(I_ir == 8'hCE)|(I_ir == 8'h3E)|(I_ir == 8'hA1)|(I_ir == 8'h6E)|(I_ir == 8'hF1)|(I_ir == 8'h2E)|(I_ir == 8'h91)|(I_ir == 8'h41)|(I_ir == 8'hE3)|(I_ir == 8'hF3)|(I_ir == 8'hD7)|(I_ir == 8'h3F)|(I_ir == 8'h7F)|(I_ir == 8'h6F)|(I_ir == 8'hFB)|(I_ir == 8'h77)|(I_ir == 8'hB3)|(I_ir == 8'hA3)|(I_ir == 8'h1F)|(I_ir == 8'h0F)|(I_ir == 8'h03)|(I_ir == 8'h0E)|(I_ir == 8'hDB)|(I_ir == 8'h53)|(I_ir == 8'hCF)|(I_ir == 8'h5E)|(I_ir == 8'h33)|(I_ir == 8'h31)|(I_ir == 8'hE1)|(I_ir == 8'h56)|(I_ir == 8'h81)|(I_ir == 8'hC1)|(I_ir == 8'hD1)|(I_ir == 8'h17)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h46)|(I_ir == 8'hD7)|(I_ir == 8'h37)|(I_ir == 8'h27)|(I_ir == 8'hC6)|(I_ir == 8'hFF)|(I_ir == 8'h5B)|(I_ir == 8'h4F)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'h3E)|(I_ir == 8'hDF)|(I_ir == 8'hCF)|(I_ir == 8'h16)|(I_ir == 8'hCE)|(I_ir == 8'hF7)|(I_ir == 8'h99)|(I_ir == 8'h7D)|(I_ir == 8'hBD)|(I_ir == 8'h2E)|(I_ir == 8'h6E)|(I_ir == 8'hE6)|(I_ir == 8'h1D)|(I_ir == 8'hF1)|(I_ir == 8'h11)|(I_ir == 8'h5D)|(I_ir == 8'h1C)|(I_ir == 8'h91)|(I_ir == 8'hF9)|(I_ir == 8'h3F)|(I_ir == 8'h7F)|(I_ir == 8'hB3)|(I_ir == 8'h1F)|(I_ir == 8'hF3)|(I_ir == 8'hFC)|(I_ir == 8'h1E)|(I_ir == 8'h0E)|(I_ir == 8'h53)|(I_ir == 8'h77)|(I_ir == 8'hBC)|(I_ir == 8'h5E)|(I_ir == 8'h26)|(I_ir == 8'h66)|(I_ir == 8'hC7)|(I_ir == 8'h33)|(I_ir == 8'h31)|(I_ir == 8'h06)|(I_ir == 8'hFB)|(I_ir == 8'h67)|(I_ir == 8'h56)|(I_ir == 8'hD9)|(I_ir == 8'h39)|(I_ir == 8'hFD)|(I_ir == 8'hBE)|(I_ir == 8'hB9)|(I_ir == 8'h9D)|(I_ir == 8'h17)|(I_ir == 8'h5C)|(I_ir == 8'hD1)|(I_ir == 8'hDC)|(I_ir == 8'h3C)|(I_ir == 8'h07)|(I_ir == 8'hBF)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h6F)|(I_ir == 8'h5F)|(I_ir == 8'h1B)|(I_ir == 8'hEF)|(I_ir == 8'h0F)|(I_ir == 8'hD3)|(I_ir == 8'hDE)|(I_ir == 8'hE7)|(I_ir == 8'hDB)|(I_ir == 8'hD6)|(I_ir == 8'h4E)|(I_ir == 8'h7E)|(I_ir == 8'hF6)|(I_ir == 8'h59)|(I_ir == 8'h3D)|(I_ir == 8'h71)|(I_ir == 8'hB1)|(I_ir == 8'h19)|(I_ir == 8'h79)|(I_ir == 8'hFE)|(I_ir == 8'hEE)|(I_ir == 8'h51)|(I_ir == 8'h2F)|(I_ir == 8'h13)|(I_ir == 8'h7C)|(I_ir == 8'hDD)|(I_ir == 8'h73)|(I_ir == 8'h57)|(I_ir == 8'h47)))|
	                         ((I_t == 4'd6)&((I_ir == 8'h1F)|(I_ir == 8'hF3)|(I_ir == 8'h3F)|(I_ir == 8'h63)|(I_ir == 8'h53)|(I_ir == 8'h5E)|(I_ir == 8'hE3)|(I_ir == 8'h33)|(I_ir == 8'hFB)|(I_ir == 8'h5B)|(I_ir == 8'h03)|(I_ir == 8'hDB)|(I_ir == 8'hFE)|(I_ir == 8'h23)|(I_ir == 8'h1B)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'h43)|(I_ir == 8'hD3)|(I_ir == 8'hDE)|(I_ir == 8'h73)|(I_ir == 8'h13)|(I_ir == 8'h1E)|(I_ir == 8'hFF)|(I_ir == 8'hDF)|(I_ir == 8'hC3)|(I_ir == 8'h3E)|(I_ir == 8'h7E)|(I_ir == 8'h7F)))|
	                         ((I_t == 4'd2)&((I_ir == 8'hB7)|(I_ir == 8'hE7)|(I_ir == 8'hA6)|(I_ir == 8'h71)|(I_ir == 8'hD6)|(I_ir == 8'hB1)|(I_ir == 8'h95)|(I_ir == 8'hF6)|(I_ir == 8'hA7)|(I_ir == 8'hC5)|(I_ir == 8'h11)|(I_ir == 8'hE5)|(I_ir == 8'h51)|(I_ir == 8'h35)|(I_ir == 8'h96)|(I_ir == 8'h10)|(I_ir == 8'h50)|(I_ir == 8'h85)|(I_ir == 8'h84)|(I_ir == 8'h74)|(I_ir == 8'h73)|(I_ir == 8'h57)|(I_ir == 8'h24)|(I_ir == 8'h46)|(I_ir == 8'h13)|(I_ir == 8'hF0)|(I_ir == 8'h37)|(I_ir == 8'hD4)|(I_ir == 8'h47)|(I_ir == 8'h87)|(I_ir == 8'hB0)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'hF7)|(I_ir == 8'h27)|(I_ir == 8'h25)|(I_ir == 8'h65)|(I_ir == 8'h16)|(I_ir == 8'h05)|(I_ir == 8'hE6)|(I_ir == 8'hF1)|(I_ir == 8'h91)|(I_ir == 8'hB5)|(I_ir == 8'h90)|(I_ir == 8'hD5)|(I_ir == 8'hF3)|(I_ir == 8'hC4)|(I_ir == 8'h30)|(I_ir == 8'h14)|(I_ir == 8'h75)|(I_ir == 8'hB3)|(I_ir == 8'h64)|(I_ir == 8'hA4)|(I_ir == 8'h53)|(I_ir == 8'hD7)|(I_ir == 8'hC7)|(I_ir == 8'h33)|(I_ir == 8'h86)|(I_ir == 8'hC6)|(I_ir == 8'h77)|(I_ir == 8'h67)|(I_ir == 8'h26)|(I_ir == 8'h66)|(I_ir == 8'h56)|(I_ir == 8'h31)|(I_ir == 8'h15)|(I_ir == 8'h55)|(I_ir == 8'hB6)|(I_ir == 8'h06)|(I_ir == 8'h04)|(I_ir == 8'h44)|(I_ir == 8'hA5)|(I_ir == 8'h45)|(I_ir == 8'h34)|(I_ir == 8'hD0)|(I_ir == 8'hF5)|(I_ir == 8'h17)|(I_ir == 8'hF4)|(I_ir == 8'hE4)|(I_ir == 8'h70)|(I_ir == 8'hD1)|(I_ir == 8'h97)|(I_ir == 8'hB4)|(I_ir == 8'h07)|(I_ir == 8'h54)|(I_ir == 8'h94)|(I_ir == 8'hD3)))|
	                         ((I_t == 4'd7)&((I_ir == 8'h73)|(I_ir == 8'h63)|(I_ir == 8'h13)|(I_ir == 8'hC3)|(I_ir == 8'hF3)|(I_ir == 8'h03)|(I_ir == 8'h53)|(I_ir == 8'h33)|(I_ir == 8'h23)|(I_ir == 8'hD3)|(I_ir == 8'hE3)|(I_ir == 8'h43))));
	
	assign O_control[ 24] = (((I_t == 4'd5)&((I_ir == 8'h0F)|(I_ir == 8'h01)|(I_ir == 8'h17)|(I_ir == 8'h11)))|
	                         ((I_t == 4'd6)&((I_ir == 8'h1F)|(I_ir == 8'h1B)))|
	                         ((I_t == 4'd7)&((I_ir == 8'h13)|(I_ir == 8'h03)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h19)|(I_ir == 8'h07)|(I_ir == 8'h1D)))|
	                         ((I_t == 4'd1)&(I_ir == 8'h09))|
	                         ((I_t == 4'd3)&((I_ir == 8'h0D)|(I_ir == 8'h15)))|
	                         ((I_t == 4'd2)&(I_ir == 8'h05)));
	
	assign O_control[ 25] = (((I_t == 4'd5)&((I_ir == 8'h0F)|(I_ir == 8'h57)|(I_ir == 8'h01)|(I_ir == 8'hDB)|(I_ir == 8'h83)|(I_ir == 8'hF1)|(I_ir == 8'h31)|(I_ir == 8'hFF)|(I_ir == 8'h2F)|(I_ir == 8'h41)|(I_ir == 8'hE1)|(I_ir == 8'hDF)|(I_ir == 8'hC1)|(I_ir == 8'h71)|(I_ir == 8'h37)|(I_ir == 8'hD1)|(I_ir == 8'h6F)|(I_ir == 8'h21)|(I_ir == 8'h17)|(I_ir == 8'h11)|(I_ir == 8'h61)|(I_ir == 8'h51)|(I_ir == 8'h4F)|(I_ir == 8'hFB)|(I_ir == 8'h77)))|
	                         ((I_t == 4'd3)&((I_ir == 8'hED)|(I_ir == 8'hC7)|(I_ir == 8'hF5)|(I_ir == 8'h35)|(I_ir == 8'h97)|(I_ir == 8'h75)|(I_ir == 8'h2D)|(I_ir == 8'hCD)|(I_ir == 8'hD5)|(I_ir == 8'h15)|(I_ir == 8'hE7)|(I_ir == 8'h55)|(I_ir == 8'h8F)|(I_ir == 8'h4D)|(I_ir == 8'h6D)|(I_ir == 8'h0D)|(I_ir == 8'h2C)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hD9)|(I_ir == 8'h39)|(I_ir == 8'hFD)|(I_ir == 8'hD7)|(I_ir == 8'h27)|(I_ir == 8'hF9)|(I_ir == 8'h59)|(I_ir == 8'h3D)|(I_ir == 8'h19)|(I_ir == 8'h79)|(I_ir == 8'hCF)|(I_ir == 8'h07)|(I_ir == 8'hF7)|(I_ir == 8'h7D)|(I_ir == 8'h1D)|(I_ir == 8'h67)|(I_ir == 8'h5D)|(I_ir == 8'hEF)|(I_ir == 8'hDD)|(I_ir == 8'h47)))|
	                         ((I_t == 4'd7)&((I_ir == 8'h33)|(I_ir == 8'h73)|(I_ir == 8'h63)|(I_ir == 8'h43)|(I_ir == 8'h13)|(I_ir == 8'h03)|(I_ir == 8'h53)|(I_ir == 8'h23)))|
	                         ((I_t == 4'd6)&((I_ir == 8'h1F)|(I_ir == 8'hF3)|(I_ir == 8'h3F)|(I_ir == 8'hC3)|(I_ir == 8'hE3)|(I_ir == 8'h5B)|(I_ir == 8'h1B)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'h7F)|(I_ir == 8'hD3)))|
	                         ((I_t == 4'd1)&((I_ir == 8'h49)|(I_ir == 8'hC9)|(I_ir == 8'h4A)|(I_ir == 8'h09)|(I_ir == 8'hEB)|(I_ir == 8'h69)|(I_ir == 8'h6A)|(I_ir == 8'hCB)|(I_ir == 8'h2A)|(I_ir == 8'hE9)|(I_ir == 8'h0A)|(I_ir == 8'hAA)|(I_ir == 8'h29)|(I_ir == 8'hA8)))|
	                         ((I_t == 4'd2)&((I_ir == 8'h87)|(I_ir == 8'h45)|(I_ir == 8'h25)|(I_ir == 8'h65)|(I_ir == 8'hC5)|(I_ir == 8'hE5)|(I_ir == 8'h05)|(I_ir == 8'h24))));
	
	assign O_control[ 26] = (((I_t == 4'd5)&((I_ir == 8'h0F)|(I_ir == 8'h57)|(I_ir == 8'h01)|(I_ir == 8'hA1)|(I_ir == 8'hF1)|(I_ir == 8'h31)|(I_ir == 8'h2F)|(I_ir == 8'h41)|(I_ir == 8'hE1)|(I_ir == 8'hC1)|(I_ir == 8'h71)|(I_ir == 8'h37)|(I_ir == 8'hD1)|(I_ir == 8'h6F)|(I_ir == 8'hB1)|(I_ir == 8'h21)|(I_ir == 8'h17)|(I_ir == 8'h11)|(I_ir == 8'h61)|(I_ir == 8'h51)|(I_ir == 8'h4F)|(I_ir == 8'h77)|(I_ir == 8'hB3)|(I_ir == 8'hA3)))|
	                         ((I_t == 4'd3)&((I_ir == 8'hED)|(I_ir == 8'hF5)|(I_ir == 8'hB6)|(I_ir == 8'h35)|(I_ir == 8'hAF)|(I_ir == 8'h75)|(I_ir == 8'h2D)|(I_ir == 8'hCC)|(I_ir == 8'hCD)|(I_ir == 8'h68)|(I_ir == 8'hAC)|(I_ir == 8'hAE)|(I_ir == 8'hD5)|(I_ir == 8'hB7)|(I_ir == 8'hAD)|(I_ir == 8'h15)|(I_ir == 8'hB4)|(I_ir == 8'h55)|(I_ir == 8'hB5)|(I_ir == 8'h4D)|(I_ir == 8'h6D)|(I_ir == 8'hEC)|(I_ir == 8'h0D)|(I_ir == 8'h2C)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hD9)|(I_ir == 8'h39)|(I_ir == 8'hFD)|(I_ir == 8'hBE)|(I_ir == 8'h27)|(I_ir == 8'hF9)|(I_ir == 8'hB9)|(I_ir == 8'h59)|(I_ir == 8'h3D)|(I_ir == 8'h19)|(I_ir == 8'h79)|(I_ir == 8'h07)|(I_ir == 8'hBC)|(I_ir == 8'hBF)|(I_ir == 8'h7D)|(I_ir == 8'hBD)|(I_ir == 8'h1D)|(I_ir == 8'h67)|(I_ir == 8'h5D)|(I_ir == 8'hDD)|(I_ir == 8'h47)))|
	                         ((I_t == 4'd7)&((I_ir == 8'h33)|(I_ir == 8'h73)|(I_ir == 8'h63)|(I_ir == 8'h43)|(I_ir == 8'h13)|(I_ir == 8'h03)|(I_ir == 8'h53)|(I_ir == 8'h23)))|
	                         ((I_t == 4'd1)&((I_ir == 8'hC0)|(I_ir == 8'h49)|(I_ir == 8'hA0)|(I_ir == 8'hA2)|(I_ir == 8'hC9)|(I_ir == 8'hAB)|(I_ir == 8'h09)|(I_ir == 8'hEB)|(I_ir == 8'h69)|(I_ir == 8'hA9)|(I_ir == 8'hE0)|(I_ir == 8'hE9)|(I_ir == 8'h29)))|
	                         ((I_t == 4'd6)&((I_ir == 8'h1F)|(I_ir == 8'h3F)|(I_ir == 8'h5B)|(I_ir == 8'h1B)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'h7F)))|
	                         ((I_t == 4'd2)&((I_ir == 8'hA5)|(I_ir == 8'hC4)|(I_ir == 8'h45)|(I_ir == 8'hA6)|(I_ir == 8'hA4)|(I_ir == 8'h25)|(I_ir == 8'h65)|(I_ir == 8'hA7)|(I_ir == 8'hC5)|(I_ir == 8'hE5)|(I_ir == 8'hE4)|(I_ir == 8'h05)|(I_ir == 8'h24))));
	
	assign O_control[ 27] = (((I_t == 4'd5)&((I_ir == 8'h0F)|(I_ir == 8'h57)|(I_ir == 8'h01)|(I_ir == 8'hA1)|(I_ir == 8'hF1)|(I_ir == 8'h31)|(I_ir == 8'hFF)|(I_ir == 8'h2F)|(I_ir == 8'h41)|(I_ir == 8'hE1)|(I_ir == 8'h71)|(I_ir == 8'h37)|(I_ir == 8'h6F)|(I_ir == 8'hB1)|(I_ir == 8'h21)|(I_ir == 8'h17)|(I_ir == 8'h11)|(I_ir == 8'h61)|(I_ir == 8'h51)|(I_ir == 8'h4F)|(I_ir == 8'hFB)|(I_ir == 8'h77)|(I_ir == 8'hB3)|(I_ir == 8'hA3)))|
	                         ((I_t == 4'd3)&((I_ir == 8'hED)|(I_ir == 8'hF5)|(I_ir == 8'h35)|(I_ir == 8'hAF)|(I_ir == 8'h75)|(I_ir == 8'h2D)|(I_ir == 8'h68)|(I_ir == 8'hB7)|(I_ir == 8'hAD)|(I_ir == 8'h15)|(I_ir == 8'hE7)|(I_ir == 8'h55)|(I_ir == 8'hB5)|(I_ir == 8'h4D)|(I_ir == 8'h6D)|(I_ir == 8'h0D)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h39)|(I_ir == 8'hFD)|(I_ir == 8'h27)|(I_ir == 8'hF9)|(I_ir == 8'hB9)|(I_ir == 8'h59)|(I_ir == 8'h3D)|(I_ir == 8'h19)|(I_ir == 8'h79)|(I_ir == 8'h07)|(I_ir == 8'hBF)|(I_ir == 8'hF7)|(I_ir == 8'h7D)|(I_ir == 8'hBD)|(I_ir == 8'h1D)|(I_ir == 8'h67)|(I_ir == 8'h5D)|(I_ir == 8'hEF)|(I_ir == 8'h47)))|
	                         ((I_t == 4'd7)&((I_ir == 8'h33)|(I_ir == 8'h73)|(I_ir == 8'h63)|(I_ir == 8'h43)|(I_ir == 8'h13)|(I_ir == 8'h03)|(I_ir == 8'h53)|(I_ir == 8'h23)))|
	                         ((I_t == 4'd6)&((I_ir == 8'h1F)|(I_ir == 8'hF3)|(I_ir == 8'h3F)|(I_ir == 8'hE3)|(I_ir == 8'h5B)|(I_ir == 8'h1B)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'h7F)))|
	                         ((I_t == 4'd1)&((I_ir == 8'h49)|(I_ir == 8'h4A)|(I_ir == 8'hAB)|(I_ir == 8'h09)|(I_ir == 8'hEB)|(I_ir == 8'h69)|(I_ir == 8'hA9)|(I_ir == 8'h6A)|(I_ir == 8'h98)|(I_ir == 8'h2A)|(I_ir == 8'hE9)|(I_ir == 8'h0A)|(I_ir == 8'h29)|(I_ir == 8'h8A)))|
	                         ((I_t == 4'd2)&((I_ir == 8'hA5)|(I_ir == 8'h45)|(I_ir == 8'h25)|(I_ir == 8'h65)|(I_ir == 8'hA7)|(I_ir == 8'hE5)|(I_ir == 8'h05))));
	
	assign O_control[ 28] = (((I_t == 4'd3)&((I_ir == 8'h06)|(I_ir == 8'h0F)|(I_ir == 8'h17)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h06)|(I_ir == 8'h1B)|(I_ir == 8'h0E)|(I_ir == 8'h16)|(I_ir == 8'h1F)))|
	                         ((I_t == 4'd2)&(I_ir == 8'h07))|
	                         ((I_t == 4'd5)&((I_ir == 8'h03)|(I_ir == 8'h16)|(I_ir == 8'h13)|(I_ir == 8'h0E)|(I_ir == 8'h1E)))|
	                         ((I_t == 4'd1)&(I_ir == 8'h0A))|
	                         ((I_t == 4'd6)&(I_ir == 8'h1E)));
	
	assign O_control[ 29] = (((I_t == 4'd3)&((I_ir == 8'h0F)|(I_ir == 8'hF7)|(I_ir == 8'hD7)|(I_ir == 8'h37)|(I_ir == 8'hEF)|(I_ir == 8'h57)|(I_ir == 8'hCF)|(I_ir == 8'h6F)|(I_ir == 8'h4F)|(I_ir == 8'h17)|(I_ir == 8'h77)|(I_ir == 8'h2F)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h03)|(I_ir == 8'hF3)|(I_ir == 8'hE3)|(I_ir == 8'h73)|(I_ir == 8'h33)|(I_ir == 8'h63)|(I_ir == 8'hD3)|(I_ir == 8'h53)|(I_ir == 8'hC3)|(I_ir == 8'h43)|(I_ir == 8'h23)|(I_ir == 8'h13)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h5F)|(I_ir == 8'hFF)|(I_ir == 8'h5B)|(I_ir == 8'hDB)|(I_ir == 8'hFB)|(I_ir == 8'h1F)|(I_ir == 8'h1B)|(I_ir == 8'h3F)|(I_ir == 8'h7F)|(I_ir == 8'hDF)|(I_ir == 8'h3B)|(I_ir == 8'h7B)))|
	                         ((I_t == 4'd2)&((I_ir == 8'hE7)|(I_ir == 8'h67)|(I_ir == 8'h07)|(I_ir == 8'hC7)|(I_ir == 8'h27)|(I_ir == 8'h47))));
	
	assign O_control[ 30] = (((I_t == 4'd3)&((I_ir == 8'h0F)|(I_ir == 8'hF7)|(I_ir == 8'h26)|(I_ir == 8'h37)|(I_ir == 8'hD7)|(I_ir == 8'hEF)|(I_ir == 8'h57)|(I_ir == 8'h66)|(I_ir == 8'hCF)|(I_ir == 8'hE6)|(I_ir == 8'h6F)|(I_ir == 8'h4F)|(I_ir == 8'hC6)|(I_ir == 8'h17)|(I_ir == 8'h77)|(I_ir == 8'h2F)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h03)|(I_ir == 8'hF3)|(I_ir == 8'hE3)|(I_ir == 8'h73)|(I_ir == 8'h3E)|(I_ir == 8'h33)|(I_ir == 8'h63)|(I_ir == 8'hD3)|(I_ir == 8'h7E)|(I_ir == 8'h53)|(I_ir == 8'hC3)|(I_ir == 8'h43)|(I_ir == 8'hDE)|(I_ir == 8'hFE)|(I_ir == 8'h23)|(I_ir == 8'h13)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h5F)|(I_ir == 8'hEE)|(I_ir == 8'hFF)|(I_ir == 8'h5B)|(I_ir == 8'hDB)|(I_ir == 8'hCE)|(I_ir == 8'hFB)|(I_ir == 8'h1F)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'hD6)|(I_ir == 8'h1B)|(I_ir == 8'h3F)|(I_ir == 8'hF6)|(I_ir == 8'h7F)|(I_ir == 8'h2E)|(I_ir == 8'hDF)|(I_ir == 8'h3B)|(I_ir == 8'h6E)|(I_ir == 8'h7B)))|
	                         ((I_t == 4'd2)&((I_ir == 8'hE7)|(I_ir == 8'h67)|(I_ir == 8'h07)|(I_ir == 8'hC7)|(I_ir == 8'h27)|(I_ir == 8'h47))));
	
	assign O_control[ 31] = (((I_t == 4'd3)&((I_ir == 8'h27)|(I_ir == 8'hC7)|(I_ir == 8'hE6)|(I_ir == 8'hC6)|(I_ir == 8'h07)|(I_ir == 8'h67)|(I_ir == 8'h66)|(I_ir == 8'h26)|(I_ir == 8'hE7)|(I_ir == 8'h47)))|
	                         ((I_t == 4'd6)&((I_ir == 8'hFE)|(I_ir == 8'hFF)|(I_ir == 8'hDE)|(I_ir == 8'hF3)|(I_ir == 8'hDF)|(I_ir == 8'hC3)|(I_ir == 8'h63)|(I_ir == 8'h53)|(I_ir == 8'h23)|(I_ir == 8'hE3)|(I_ir == 8'h33)|(I_ir == 8'h3E)|(I_ir == 8'h7E)|(I_ir == 8'hFB)|(I_ir == 8'h03)|(I_ir == 8'h73)|(I_ir == 8'hDB)|(I_ir == 8'h43)|(I_ir == 8'h13)|(I_ir == 8'hD3)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hE7)|(I_ir == 8'hD7)|(I_ir == 8'h37)|(I_ir == 8'hD6)|(I_ir == 8'hF6)|(I_ir == 8'hC6)|(I_ir == 8'h17)|(I_ir == 8'h4F)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'hCF)|(I_ir == 8'hEE)|(I_ir == 8'h77)|(I_ir == 8'hCE)|(I_ir == 8'hF7)|(I_ir == 8'h26)|(I_ir == 8'h66)|(I_ir == 8'hC7)|(I_ir == 8'h2E)|(I_ir == 8'h6E)|(I_ir == 8'hE6)|(I_ir == 8'h6F)|(I_ir == 8'h2F)|(I_ir == 8'hEF)|(I_ir == 8'h0F)|(I_ir == 8'h57)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h3E)|(I_ir == 8'hDB)|(I_ir == 8'h6E)|(I_ir == 8'hCF)|(I_ir == 8'hEF)|(I_ir == 8'h2E)|(I_ir == 8'h3B)|(I_ir == 8'h7B)|(I_ir == 8'h5F)|(I_ir == 8'hFF)|(I_ir == 8'hDE)|(I_ir == 8'h1B)|(I_ir == 8'hDF)|(I_ir == 8'hF6)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'hF7)|(I_ir == 8'hD6)|(I_ir == 8'hD7)|(I_ir == 8'h3F)|(I_ir == 8'h7F)|(I_ir == 8'h7E)|(I_ir == 8'h5B)|(I_ir == 8'hFE)|(I_ir == 8'hEE)|(I_ir == 8'hFB)|(I_ir == 8'hCE)|(I_ir == 8'h1F)))|
	                         ((I_t == 4'd7)&((I_ir == 8'hE3)|(I_ir == 8'hD3)|(I_ir == 8'hF3)|(I_ir == 8'hC3))));
	
	assign O_control[ 32] = (((I_t == 4'd1)&((I_ir == 8'hD1)|(I_ir == 8'hD7)|(I_ir == 8'hC7)|(I_ir == 8'hF5)|(I_ir == 8'h34)|(I_ir == 8'h95)|(I_ir == 8'h85)|(I_ir == 8'hC5)|(I_ir == 8'h86)|(I_ir == 8'h14)|(I_ir == 8'h65)|(I_ir == 8'hC6)|(I_ir == 8'h17)|(I_ir == 8'h11)|(I_ir == 8'h53)|(I_ir == 8'hB4)|(I_ir == 8'h77)|(I_ir == 8'h67)|(I_ir == 8'h84)|(I_ir == 8'h35)|(I_ir == 8'h66)|(I_ir == 8'h54)|(I_ir == 8'h73)|(I_ir == 8'h33)|(I_ir == 8'h57)|(I_ir == 8'h94)|(I_ir == 8'h25)|(I_ir == 8'hE6)|(I_ir == 8'h55)|(I_ir == 8'hB6)|(I_ir == 8'h07)|(I_ir == 8'h06)|(I_ir == 8'hE4)|(I_ir == 8'hF1)|(I_ir == 8'hD5)|(I_ir == 8'h26)|(I_ir == 8'h37)|(I_ir == 8'h05)|(I_ir == 8'hA5)|(I_ir == 8'hD3)|(I_ir == 8'h24)|(I_ir == 8'h31)|(I_ir == 8'hB7)|(I_ir == 8'hC4)|(I_ir == 8'h15)|(I_ir == 8'h91)|(I_ir == 8'h97)|(I_ir == 8'h87)|(I_ir == 8'h75)|(I_ir == 8'hB5)|(I_ir == 8'h13)|(I_ir == 8'hA6)|(I_ir == 8'hD4)|(I_ir == 8'h76)|(I_ir == 8'h74)|(I_ir == 8'h64)|(I_ir == 8'h71)|(I_ir == 8'hA4)|(I_ir == 8'hB1)|(I_ir == 8'h27)|(I_ir == 8'h44)|(I_ir == 8'hF6)|(I_ir == 8'h47)|(I_ir == 8'h56)|(I_ir == 8'hA7)|(I_ir == 8'hE7)|(I_ir == 8'h16)|(I_ir == 8'hF4)|(I_ir == 8'h46)|(I_ir == 8'hE5)|(I_ir == 8'h36)|(I_ir == 8'h51)|(I_ir == 8'h45)|(I_ir == 8'h96)|(I_ir == 8'hF7)|(I_ir == 8'hB3)|(I_ir == 8'h04)|(I_ir == 8'hD6)|(I_ir == 8'hF3))));
	
	assign O_control[ 33] = (((I_t == 4'd3)&((I_ir == 8'h76)|(I_ir == 8'hD6)|(I_ir == 8'h2E)|(I_ir == 8'h0E)|(I_ir == 8'h56)|(I_ir == 8'hF6)|(I_ir == 8'h6E)|(I_ir == 8'h16)|(I_ir == 8'hEE)|(I_ir == 8'hCE)|(I_ir == 8'h36)|(I_ir == 8'h4E)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hDE)|(I_ir == 8'hFE)|(I_ir == 8'h5E)|(I_ir == 8'h3E)|(I_ir == 8'h7E)|(I_ir == 8'h1E)))|
	                         ((I_t == 4'd2)&((I_ir == 8'h46)|(I_ir == 8'h06)|(I_ir == 8'h26)|(I_ir == 8'h66)|(I_ir == 8'hE6)|(I_ir == 8'hC6))));
	
	assign O_control[ 34] = (((I_t == 4'd5)&((I_ir == 8'h4E)|(I_ir == 8'h1E)|(I_ir == 8'h3E)|(I_ir == 8'h56)|(I_ir == 8'h0E)|(I_ir == 8'h7E)|(I_ir == 8'h16)|(I_ir == 8'hDE)|(I_ir == 8'hFE)|(I_ir == 8'h5E)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h26)|(I_ir == 8'h66)|(I_ir == 8'hE6)|(I_ir == 8'hC6)|(I_ir == 8'h46)|(I_ir == 8'h06)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hEE)|(I_ir == 8'h16)|(I_ir == 8'h06)|(I_ir == 8'hCE)|(I_ir == 8'h46)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'hD6)|(I_ir == 8'h4E)|(I_ir == 8'hF6)|(I_ir == 8'h56)|(I_ir == 8'h2E)|(I_ir == 8'h0E)|(I_ir == 8'h6E)))|
	                         ((I_t == 4'd6)&((I_ir == 8'h5E)|(I_ir == 8'h1E))));
	
	assign O_control[ 35] = (((I_t == 4'd5)&((I_ir == 8'h4E)|(I_ir == 8'h1E)|(I_ir == 8'h56)|(I_ir == 8'h0E)|(I_ir == 8'h16)|(I_ir == 8'h5E)|(I_ir == 8'h83)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h16)|(I_ir == 8'h06)|(I_ir == 8'h46)|(I_ir == 8'h4E)|(I_ir == 8'h56)|(I_ir == 8'h0E)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h97)|(I_ir == 8'h46)|(I_ir == 8'h06)|(I_ir == 8'h8F)))|
	                         ((I_t == 4'd6)&((I_ir == 8'h5E)|(I_ir == 8'h1E)))|
	                         ((I_t == 4'd1)&(I_ir == 8'hCB))|
	                         ((I_t == 4'd2)&(I_ir == 8'h87)));
	
	assign O_control[ 36] = (((I_t == 4'd3)&((I_ir == 8'h0F)|(I_ir == 8'hAE)|(I_ir == 8'h8C)|(I_ir == 8'hED)|(I_ir == 8'h4D)|(I_ir == 8'hAF)|(I_ir == 8'hEF)|(I_ir == 8'h2E)|(I_ir == 8'h0C)|(I_ir == 8'h6D)|(I_ir == 8'h0E)|(I_ir == 8'hCF)|(I_ir == 8'hEC)|(I_ir == 8'h6E)|(I_ir == 8'hAD)|(I_ir == 8'h6F)|(I_ir == 8'h4F)|(I_ir == 8'h2D)|(I_ir == 8'hCC)|(I_ir == 8'h8D)|(I_ir == 8'h8E)|(I_ir == 8'h2F)|(I_ir == 8'hCD)|(I_ir == 8'hEE)|(I_ir == 8'hCE)|(I_ir == 8'hAC)|(I_ir == 8'h8F)|(I_ir == 8'h2C)|(I_ir == 8'h0D)|(I_ir == 8'h4E))));
	
	assign O_control[ 37] = (((I_t == 4'd1)&(I_ir == 8'h10)));
	
	assign O_control[ 38] = (((I_t == 4'd1)&((I_ir == 8'h70)|(I_ir == 8'h30)|(I_ir == 8'h50)|(I_ir == 8'h10)|(I_ir == 8'hB0)|(I_ir == 8'hD0)|(I_ir == 8'h90)|(I_ir == 8'hF0))));
	
	assign O_control[ 39] = (((I_t == 4'd1)&((I_ir == 8'h70)|(I_ir == 8'h30)|(I_ir == 8'h50)|(I_ir == 8'h10)|(I_ir == 8'hB0)|(I_ir == 8'hD0)|(I_ir == 8'h90)|(I_ir == 8'hF0))));
	
	assign O_control[ 40] = (((I_t == 4'd2)&((I_ir == 8'h5F)|(I_ir == 8'h55)|(I_ir == 8'hB6)|(I_ir == 8'hB5)|(I_ir == 8'h1D)|(I_ir == 8'h5D)|(I_ir == 8'hD5)|(I_ir == 8'h37)|(I_ir == 8'hFD)|(I_ir == 8'hD4)|(I_ir == 8'h3F)|(I_ir == 8'h7C)|(I_ir == 8'h1E)|(I_ir == 8'h7F)|(I_ir == 8'hB7)|(I_ir == 8'h59)|(I_ir == 8'hDF)|(I_ir == 8'h3D)|(I_ir == 8'h14)|(I_ir == 8'hFF)|(I_ir == 8'h75)|(I_ir == 8'hFE)|(I_ir == 8'h5C)|(I_ir == 8'hD9)|(I_ir == 8'hDE)|(I_ir == 8'h1F)|(I_ir == 8'h36)|(I_ir == 8'h76)|(I_ir == 8'hFC)|(I_ir == 8'hF7)|(I_ir == 8'hD6)|(I_ir == 8'h34)|(I_ir == 8'h95)|(I_ir == 8'hF6)|(I_ir == 8'h19)|(I_ir == 8'hF5)|(I_ir == 8'hB9)|(I_ir == 8'h9D)|(I_ir == 8'h16)|(I_ir == 8'h17)|(I_ir == 8'hBC)|(I_ir == 8'hF4)|(I_ir == 8'h5E)|(I_ir == 8'h35)|(I_ir == 8'h96)|(I_ir == 8'h99)|(I_ir == 8'hD7)|(I_ir == 8'h3E)|(I_ir == 8'hDD)|(I_ir == 8'h3B)|(I_ir == 8'h7E)|(I_ir == 8'h97)|(I_ir == 8'h7B)|(I_ir == 8'h79)|(I_ir == 8'h3C)|(I_ir == 8'hDB)|(I_ir == 8'hB4)|(I_ir == 8'h39)|(I_ir == 8'hFB)|(I_ir == 8'h77)|(I_ir == 8'h5B)|(I_ir == 8'h74)|(I_ir == 8'hBE)|(I_ir == 8'hBF)|(I_ir == 8'h1B)|(I_ir == 8'h1C)|(I_ir == 8'h56)|(I_ir == 8'h7D)|(I_ir == 8'h54)|(I_ir == 8'hF9)|(I_ir == 8'hBD)|(I_ir == 8'h57)|(I_ir == 8'h94)|(I_ir == 8'hDC)|(I_ir == 8'h15)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h71)|(I_ir == 8'hD1)|(I_ir == 8'h33)|(I_ir == 8'h53)|(I_ir == 8'h11)|(I_ir == 8'hF1)|(I_ir == 8'hD3)|(I_ir == 8'h91)|(I_ir == 8'h73)|(I_ir == 8'h31)|(I_ir == 8'h13)|(I_ir == 8'hB3)|(I_ir == 8'hF3)|(I_ir == 8'hB1)|(I_ir == 8'h51)))|
	                         ((I_t == 4'd1)&((I_ir == 8'h50)|(I_ir == 8'hD0)|(I_ir == 8'h10)|(I_ir == 8'h70)|(I_ir == 8'h90)|(I_ir == 8'h30)|(I_ir == 8'hB0)|(I_ir == 8'hF0))));
	
	assign O_control[ 41] = (((I_t == 4'd1)&((I_ir == 8'h70)|(I_ir == 8'h30)|(I_ir == 8'h50)|(I_ir == 8'h10)|(I_ir == 8'hB0)|(I_ir == 8'hD0)|(I_ir == 8'h90)|(I_ir == 8'hF0))));
	
	assign O_control[ 42] = (((I_t == 4'd2)&((I_ir == 8'hFF)|(I_ir == 8'h5F)|(I_ir == 8'h39)|(I_ir == 8'hFE)|(I_ir == 8'h5C)|(I_ir == 8'hFB)|(I_ir == 8'hD9)|(I_ir == 8'hBC)|(I_ir == 8'h5B)|(I_ir == 8'h5E)|(I_ir == 8'hDE)|(I_ir == 8'h1D)|(I_ir == 8'h1F)|(I_ir == 8'hBE)|(I_ir == 8'h5D)|(I_ir == 8'hFC)|(I_ir == 8'hBF)|(I_ir == 8'h99)|(I_ir == 8'h1B)|(I_ir == 8'hFD)|(I_ir == 8'h1C)|(I_ir == 8'h3F)|(I_ir == 8'h7C)|(I_ir == 8'h7D)|(I_ir == 8'h1E)|(I_ir == 8'h7F)|(I_ir == 8'h3E)|(I_ir == 8'hDD)|(I_ir == 8'hF9)|(I_ir == 8'hBD)|(I_ir == 8'h3B)|(I_ir == 8'h7E)|(I_ir == 8'hDB)|(I_ir == 8'h19)|(I_ir == 8'h7B)|(I_ir == 8'h59)|(I_ir == 8'hDF)|(I_ir == 8'h79)|(I_ir == 8'hB9)|(I_ir == 8'h3D)|(I_ir == 8'h9D)|(I_ir == 8'hDC)|(I_ir == 8'h3C)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h71)|(I_ir == 8'h73)|(I_ir == 8'hD1)|(I_ir == 8'hD3)|(I_ir == 8'hB1)|(I_ir == 8'h33)|(I_ir == 8'h53)|(I_ir == 8'h31)|(I_ir == 8'h91)|(I_ir == 8'h11)|(I_ir == 8'h13)|(I_ir == 8'hF1)|(I_ir == 8'h51)|(I_ir == 8'hF3)|(I_ir == 8'hB3)))|
	                         ((I_t == 4'd1)&((I_ir == 8'h70)|(I_ir == 8'h50)|(I_ir == 8'h30)|(I_ir == 8'hD0)|(I_ir == 8'hB0)|(I_ir == 8'h90)|(I_ir == 8'hF0)|(I_ir == 8'h10))));
	
	assign O_control[ 43] = (((I_t == 4'd1)&((I_ir == 8'h70)|(I_ir == 8'h30)|(I_ir == 8'h50)|(I_ir == 8'h10)|(I_ir == 8'hB0)|(I_ir == 8'hD0)|(I_ir == 8'h90)|(I_ir == 8'hF0))));
	
	assign O_control[ 44] = (((I_t == 4'd3)&((I_ir == 8'h3E)|(I_ir == 8'hBE)|(I_ir == 8'h7D)|(I_ir == 8'hBF)|(I_ir == 8'h1C)|(I_ir == 8'h99)|(I_ir == 8'h3F)|(I_ir == 8'h1E)|(I_ir == 8'hF9)|(I_ir == 8'hDD)|(I_ir == 8'h7E)|(I_ir == 8'hBD)|(I_ir == 8'h7C)|(I_ir == 8'h3B)|(I_ir == 8'h19)|(I_ir == 8'h7F)|(I_ir == 8'h59)|(I_ir == 8'h79)|(I_ir == 8'hB9)|(I_ir == 8'hDF)|(I_ir == 8'h5F)|(I_ir == 8'h3D)|(I_ir == 8'h7B)|(I_ir == 8'h3C)|(I_ir == 8'hDB)|(I_ir == 8'h39)|(I_ir == 8'h9D)|(I_ir == 8'hDE)|(I_ir == 8'hFE)|(I_ir == 8'hDC)|(I_ir == 8'h1D)|(I_ir == 8'hFF)|(I_ir == 8'h5C)|(I_ir == 8'hD9)|(I_ir == 8'h5E)|(I_ir == 8'h1F)|(I_ir == 8'hFB)|(I_ir == 8'h5D)|(I_ir == 8'hBC)|(I_ir == 8'h5B)|(I_ir == 8'hFC)|(I_ir == 8'h1B)|(I_ir == 8'hFD)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h53)|(I_ir == 8'h13)|(I_ir == 8'h11)|(I_ir == 8'h51)|(I_ir == 8'hF1)|(I_ir == 8'hB3)|(I_ir == 8'hF3)|(I_ir == 8'hD1)|(I_ir == 8'h71)|(I_ir == 8'hD3)|(I_ir == 8'hB1)|(I_ir == 8'h33)|(I_ir == 8'h73)|(I_ir == 8'h31)|(I_ir == 8'h91)))|
	                         ((I_t == 4'd2)&((I_ir == 8'hB0)|(I_ir == 8'h90)|(I_ir == 8'hF0)|(I_ir == 8'h70)|(I_ir == 8'h10)|(I_ir == 8'h50)|(I_ir == 8'hD0)|(I_ir == 8'h30))));
	
	assign O_control[ 45] = (((I_t == 4'd3)&((I_ir == 8'h3E)|(I_ir == 8'hBE)|(I_ir == 8'h7D)|(I_ir == 8'hBF)|(I_ir == 8'h1C)|(I_ir == 8'h99)|(I_ir == 8'h3F)|(I_ir == 8'h1E)|(I_ir == 8'hF9)|(I_ir == 8'hDD)|(I_ir == 8'h7E)|(I_ir == 8'hBD)|(I_ir == 8'h7C)|(I_ir == 8'h3B)|(I_ir == 8'h19)|(I_ir == 8'h7F)|(I_ir == 8'h59)|(I_ir == 8'h79)|(I_ir == 8'hB9)|(I_ir == 8'hDF)|(I_ir == 8'h5F)|(I_ir == 8'h3D)|(I_ir == 8'h7B)|(I_ir == 8'h3C)|(I_ir == 8'hDB)|(I_ir == 8'h39)|(I_ir == 8'h9D)|(I_ir == 8'hDE)|(I_ir == 8'hFE)|(I_ir == 8'hDC)|(I_ir == 8'h1D)|(I_ir == 8'hFF)|(I_ir == 8'h5C)|(I_ir == 8'hD9)|(I_ir == 8'h5E)|(I_ir == 8'h1F)|(I_ir == 8'hFB)|(I_ir == 8'h5D)|(I_ir == 8'hBC)|(I_ir == 8'h5B)|(I_ir == 8'hFC)|(I_ir == 8'h1B)|(I_ir == 8'hFD)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h53)|(I_ir == 8'h13)|(I_ir == 8'h11)|(I_ir == 8'h51)|(I_ir == 8'hF1)|(I_ir == 8'hB3)|(I_ir == 8'hF3)|(I_ir == 8'hD1)|(I_ir == 8'h71)|(I_ir == 8'hD3)|(I_ir == 8'hB1)|(I_ir == 8'h33)|(I_ir == 8'h73)|(I_ir == 8'h31)|(I_ir == 8'h91)))|
	                         ((I_t == 4'd2)&((I_ir == 8'hB0)|(I_ir == 8'h90)|(I_ir == 8'hF0)|(I_ir == 8'h70)|(I_ir == 8'h10)|(I_ir == 8'h50)|(I_ir == 8'hD0)|(I_ir == 8'h30))));
	
	assign O_control[ 46] = (((I_t == 4'd2)&((I_ir == 8'h10)|(I_ir == 8'hD0)|(I_ir == 8'h30)|(I_ir == 8'h50)|(I_ir == 8'hF0)|(I_ir == 8'hB0)|(I_ir == 8'h70)|(I_ir == 8'h90))));
	
	assign O_control[ 47] = (((I_t == 4'd3)&((I_ir == 8'h3E)|(I_ir == 8'hBE)|(I_ir == 8'h7D)|(I_ir == 8'hBF)|(I_ir == 8'h1C)|(I_ir == 8'h99)|(I_ir == 8'h3F)|(I_ir == 8'h1E)|(I_ir == 8'hF9)|(I_ir == 8'hDD)|(I_ir == 8'h7E)|(I_ir == 8'hBD)|(I_ir == 8'h7C)|(I_ir == 8'h3B)|(I_ir == 8'h19)|(I_ir == 8'h7F)|(I_ir == 8'h59)|(I_ir == 8'h79)|(I_ir == 8'hB9)|(I_ir == 8'hDF)|(I_ir == 8'h5F)|(I_ir == 8'h3D)|(I_ir == 8'h7B)|(I_ir == 8'h3C)|(I_ir == 8'hDB)|(I_ir == 8'h39)|(I_ir == 8'h9D)|(I_ir == 8'hDE)|(I_ir == 8'hFE)|(I_ir == 8'hDC)|(I_ir == 8'h1D)|(I_ir == 8'hFF)|(I_ir == 8'h5C)|(I_ir == 8'hD9)|(I_ir == 8'h5E)|(I_ir == 8'h1F)|(I_ir == 8'hFB)|(I_ir == 8'h5D)|(I_ir == 8'hBC)|(I_ir == 8'h5B)|(I_ir == 8'hFC)|(I_ir == 8'h1B)|(I_ir == 8'hFD)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h53)|(I_ir == 8'h13)|(I_ir == 8'h11)|(I_ir == 8'h51)|(I_ir == 8'hF1)|(I_ir == 8'hB3)|(I_ir == 8'hF3)|(I_ir == 8'hD1)|(I_ir == 8'h71)|(I_ir == 8'hD3)|(I_ir == 8'hB1)|(I_ir == 8'h33)|(I_ir == 8'h73)|(I_ir == 8'h31)|(I_ir == 8'h91)))|
	                         ((I_t == 4'd2)&((I_ir == 8'hB0)|(I_ir == 8'h90)|(I_ir == 8'hF0)|(I_ir == 8'h70)|(I_ir == 8'h10)|(I_ir == 8'h50)|(I_ir == 8'hD0)|(I_ir == 8'h30))));
	
	assign O_control[ 48] = (((I_t == 4'd3)&((I_ir == 8'h50)|(I_ir == 8'h10)|(I_ir == 8'h70)|(I_ir == 8'h30)|(I_ir == 8'h90)|(I_ir == 8'hF0)|(I_ir == 8'hB0)|(I_ir == 8'hD0)))|
	                         ((I_t == 4'd2)&((I_ir == 8'h10)|(I_ir == 8'hD0)|(I_ir == 8'h30)|(I_ir == 8'h50)|(I_ir == 8'hF0)|(I_ir == 8'hB0)|(I_ir == 8'h70)|(I_ir == 8'h90))));
	
	assign O_control[ 49] = (((I_t == 4'd2)&((I_ir == 8'h10)|(I_ir == 8'hD0)|(I_ir == 8'h30)|(I_ir == 8'h50)|(I_ir == 8'hF0)|(I_ir == 8'hB0)|(I_ir == 8'h70)|(I_ir == 8'h90))));
	
	assign O_control[ 50] = (((I_t == 4'd2)&((I_ir == 8'h75)|(I_ir == 8'h16)|(I_ir == 8'hB4)|(I_ir == 8'h55)|(I_ir == 8'h11)|(I_ir == 8'h17)|(I_ir == 8'hB6)|(I_ir == 8'h77)|(I_ir == 8'h51)|(I_ir == 8'hB5)|(I_ir == 8'h74)|(I_ir == 8'hF4)|(I_ir == 8'hB3)|(I_ir == 8'h35)|(I_ir == 8'h13)|(I_ir == 8'h36)|(I_ir == 8'h96)|(I_ir == 8'hD5)|(I_ir == 8'h76)|(I_ir == 8'h37)|(I_ir == 8'hF1)|(I_ir == 8'hD4)|(I_ir == 8'hF3)|(I_ir == 8'h71)|(I_ir == 8'hF7)|(I_ir == 8'hD1)|(I_ir == 8'hD7)|(I_ir == 8'hD6)|(I_ir == 8'hB1)|(I_ir == 8'h33)|(I_ir == 8'h56)|(I_ir == 8'h34)|(I_ir == 8'h95)|(I_ir == 8'h54)|(I_ir == 8'h73)|(I_ir == 8'h57)|(I_ir == 8'h94)|(I_ir == 8'h97)|(I_ir == 8'hF6)|(I_ir == 8'hB7)|(I_ir == 8'h91)|(I_ir == 8'hF5)|(I_ir == 8'hD3)|(I_ir == 8'h53)|(I_ir == 8'h31)|(I_ir == 8'h14)|(I_ir == 8'h15))));
	
	assign O_control[ 51] = (((I_t == 4'd2)&((I_ir == 8'h71)|(I_ir == 8'hB3)|(I_ir == 8'h13)|(I_ir == 8'hD1)|(I_ir == 8'h91)|(I_ir == 8'hB1)|(I_ir == 8'h33)|(I_ir == 8'hD3)|(I_ir == 8'hF3)|(I_ir == 8'h11)|(I_ir == 8'h53)|(I_ir == 8'h31)|(I_ir == 8'h73)|(I_ir == 8'h51)|(I_ir == 8'hF1))));
	
	assign O_control[ 52] = (((I_t == 4'd3)&((I_ir == 8'h71)|(I_ir == 8'h73)|(I_ir == 8'hD1)|(I_ir == 8'hD3)|(I_ir == 8'hB1)|(I_ir == 8'h33)|(I_ir == 8'h53)|(I_ir == 8'h31)|(I_ir == 8'h91)|(I_ir == 8'h11)|(I_ir == 8'h13)|(I_ir == 8'hF1)|(I_ir == 8'h51)|(I_ir == 8'hF3)|(I_ir == 8'hB3)))|
	                         ((I_t == 4'd2)&((I_ir == 8'h39)|(I_ir == 8'hB6)|(I_ir == 8'hFB)|(I_ir == 8'hD9)|(I_ir == 8'h5B)|(I_ir == 8'hBE)|(I_ir == 8'h96)|(I_ir == 8'hBF)|(I_ir == 8'h99)|(I_ir == 8'h1B)|(I_ir == 8'hF9)|(I_ir == 8'h97)|(I_ir == 8'h3B)|(I_ir == 8'hB7)|(I_ir == 8'h19)|(I_ir == 8'h7B)|(I_ir == 8'h59)|(I_ir == 8'h79)|(I_ir == 8'hB9)|(I_ir == 8'hDB))));
	
	assign O_control[ 53] = (((I_t == 4'd2)&((I_ir == 8'hFF)|(I_ir == 8'h5F)|(I_ir == 8'h39)|(I_ir == 8'h5C)|(I_ir == 8'hFB)|(I_ir == 8'hD9)|(I_ir == 8'hBC)|(I_ir == 8'h5B)|(I_ir == 8'h1D)|(I_ir == 8'h1F)|(I_ir == 8'hBE)|(I_ir == 8'h5D)|(I_ir == 8'hFC)|(I_ir == 8'hBF)|(I_ir == 8'h1B)|(I_ir == 8'hFD)|(I_ir == 8'h1C)|(I_ir == 8'h3F)|(I_ir == 8'h7C)|(I_ir == 8'h7D)|(I_ir == 8'h7F)|(I_ir == 8'hF9)|(I_ir == 8'hDD)|(I_ir == 8'hBD)|(I_ir == 8'h3B)|(I_ir == 8'hDB)|(I_ir == 8'h19)|(I_ir == 8'h7B)|(I_ir == 8'h59)|(I_ir == 8'hDF)|(I_ir == 8'h79)|(I_ir == 8'hB9)|(I_ir == 8'h3D)|(I_ir == 8'hDC)|(I_ir == 8'h3C)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h71)|(I_ir == 8'h73)|(I_ir == 8'hD1)|(I_ir == 8'hD3)|(I_ir == 8'hB1)|(I_ir == 8'h33)|(I_ir == 8'h53)|(I_ir == 8'h31)|(I_ir == 8'h11)|(I_ir == 8'h13)|(I_ir == 8'hF1)|(I_ir == 8'h51)|(I_ir == 8'hF3)|(I_ir == 8'hB3))));
	
	assign O_control[ 54] = (((I_t == 4'd1)&(I_ir == 8'h18)));
	
	assign O_control[ 55] = (((I_t == 4'd4)&((I_ir == 8'h3D)|(I_ir == 8'h39)|(I_ir == 8'h27)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h37)|(I_ir == 8'h31)|(I_ir == 8'h21)|(I_ir == 8'h2F)|(I_ir == 8'h83)))|
	                         ((I_t == 4'd7)&((I_ir == 8'h33)|(I_ir == 8'h23)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h97)|(I_ir == 8'h2D)|(I_ir == 8'h35)|(I_ir == 8'h8F)))|
	                         ((I_t == 4'd1)&((I_ir == 8'h29)|(I_ir == 8'hCB)))|
	                         ((I_t == 4'd6)&((I_ir == 8'h3F)|(I_ir == 8'h3B)))|
	                         ((I_t == 4'd2)&((I_ir == 8'h25)|(I_ir == 8'h87))));
	
	assign O_control[ 56] = (((I_t == 4'd4)&((I_ir == 8'h36)|(I_ir == 8'h3F)|(I_ir == 8'h2E)|(I_ir == 8'h3B)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h33)|(I_ir == 8'h23)|(I_ir == 8'h3E)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h26)|(I_ir == 8'h37)|(I_ir == 8'h2F)))|
	                         ((I_t == 4'd2)&(I_ir == 8'h27))|
	                         ((I_t == 4'd1)&(I_ir == 8'h2A)));
	
	assign O_control[ 57] = (((I_t == 4'd2)&(I_ir == 8'h24))|
	                         ((I_t == 4'd3)&(I_ir == 8'h2C)));
	
	assign O_control[ 58] = (((I_t == 4'd2)&((I_ir == 8'h68)|(I_ir == 8'h40)|(I_ir == 8'h60)|(I_ir == 8'h28)))|
	                         ((I_t == 4'd4)&(I_ir == 8'h40))|
	                         ((I_t == 4'd3)&((I_ir == 8'h60)|(I_ir == 8'h40))));
	
	assign O_control[ 59] = (((I_t == 4'd3)&((I_ir == 8'h28)|(I_ir == 8'h40))));
	
	assign O_control[ 60] = (((I_t == 4'd1)&(I_ir == 8'h30)));
	
	assign O_control[ 61] = (((I_t == 4'd1)&(I_ir == 8'h38)));
	
	assign O_control[ 62] = (((I_t == 4'd4)&(I_ir == 8'h40))|
	                         ((I_t == 4'd3)&(I_ir == 8'h60)));
	
	assign O_control[ 63] = (((I_t == 4'd5)&(I_ir == 8'h40))|
	                         ((I_t == 4'd4)&(I_ir == 8'h60)));
	
	assign O_control[ 64] = (((I_t == 4'd5)&((I_ir == 8'h51)|(I_ir == 8'h4F)|(I_ir == 8'h41)|(I_ir == 8'h57)))|
	                         ((I_t == 4'd1)&(I_ir == 8'h49))|
	                         ((I_t == 4'd4)&((I_ir == 8'h59)|(I_ir == 8'h5D)|(I_ir == 8'h47)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h4D)|(I_ir == 8'h55)))|
	                         ((I_t == 4'd7)&((I_ir == 8'h43)|(I_ir == 8'h53)))|
	                         ((I_t == 4'd2)&(I_ir == 8'h45))|
	                         ((I_t == 4'd6)&((I_ir == 8'h5B)|(I_ir == 8'h5F))));
	
	assign O_control[ 65] = (((I_t == 4'd3)&((I_ir == 8'h57)|(I_ir == 8'h4F)|(I_ir == 8'h46)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h4E)|(I_ir == 8'h56)|(I_ir == 8'h53)|(I_ir == 8'h43)|(I_ir == 8'h5E)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h56)|(I_ir == 8'h5F)|(I_ir == 8'h46)|(I_ir == 8'h4E)|(I_ir == 8'h5B)))|
	                         ((I_t == 4'd2)&(I_ir == 8'h47))|
	                         ((I_t == 4'd1)&(I_ir == 8'h4A))|
	                         ((I_t == 4'd6)&(I_ir == 8'h5E)));
	
	assign O_control[ 66] = (((I_t == 4'd2)&((I_ir == 8'h85)|(I_ir == 8'h48)))|
	                         ((I_t == 4'd3)&((I_ir == 8'h95)|(I_ir == 8'h8D)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h99)|(I_ir == 8'h9D)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h91)|(I_ir == 8'h81))));
	
	assign O_control[ 67] = (((I_t == 4'd1)&(I_ir == 8'h50)));
	
	assign O_control[ 68] = (((I_t == 4'd1)&(I_ir == 8'h58)));
	
	assign O_control[ 69] = (((I_t == 4'd3)&((I_ir == 8'h6D)|(I_ir == 8'h75)))|
	                         ((I_t == 4'd5)&((I_ir == 8'h71)|(I_ir == 8'h77)|(I_ir == 8'h6F)|(I_ir == 8'h61)))|
	                         ((I_t == 4'd2)&(I_ir == 8'h65))|
	                         ((I_t == 4'd4)&((I_ir == 8'h67)|(I_ir == 8'h79)|(I_ir == 8'h7D)))|
	                         ((I_t == 4'd6)&((I_ir == 8'h7F)|(I_ir == 8'h7B)))|
	                         ((I_t == 4'd7)&((I_ir == 8'h73)|(I_ir == 8'h63)))|
	                         ((I_t == 4'd1)&(I_ir == 8'h69)));
	
	assign O_control[ 70] = (((I_t == 4'd3)&((I_ir == 8'h66)|(I_ir == 8'h6F)|(I_ir == 8'h77)))|
	                         ((I_t == 4'd4)&((I_ir == 8'h76)|(I_ir == 8'h7F)|(I_ir == 8'h6E)|(I_ir == 8'h7B)))|
	                         ((I_t == 4'd1)&(I_ir == 8'h6A))|
	                         ((I_t == 4'd5)&((I_ir == 8'h63)|(I_ir == 8'h7E)|(I_ir == 8'h73)))|
	                         ((I_t == 4'd2)&(I_ir == 8'h67)));
	
	assign O_control[ 71] = (((I_t == 4'd3)&((I_ir == 8'hAE)|(I_ir == 8'hAF)|(I_ir == 8'hB7)|(I_ir == 8'hAD)|(I_ir == 8'hB4)|(I_ir == 8'hB6)|(I_ir == 8'hB5)|(I_ir == 8'hAC)|(I_ir == 8'h68)))|
	                         ((I_t == 4'd2)&((I_ir == 8'hA6)|(I_ir == 8'hA4)|(I_ir == 8'hA5)|(I_ir == 8'hA7)))|
	                         ((I_t == 4'd1)&((I_ir == 8'hAB)|(I_ir == 8'hA9)|(I_ir == 8'hA0)|(I_ir == 8'hA2)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hBC)|(I_ir == 8'hBF)|(I_ir == 8'hBE)|(I_ir == 8'hBD)|(I_ir == 8'hB9)))|
	                         ((I_t == 4'd5)&((I_ir == 8'hB1)|(I_ir == 8'hA1)|(I_ir == 8'hB3)|(I_ir == 8'hA3))));
	
	assign O_control[ 72] = (((I_t == 4'd2)&(I_ir == 8'h6C)));
	
	assign O_control[ 73] = (((I_t == 4'd1)&(I_ir == 8'h70)));
	
	assign O_control[ 74] = (((I_t == 4'd1)&(I_ir == 8'h78)));
	
	assign O_control[ 75] = (((I_t == 4'd3)&((I_ir == 8'h8F)|(I_ir == 8'h97)))|
	                         ((I_t == 4'd5)&(I_ir == 8'h83))|
	                         ((I_t == 4'd1)&(I_ir == 8'hCB))|
	                         ((I_t == 4'd2)&(I_ir == 8'h87)));
	
	assign O_control[ 76] = (((I_t == 4'd3)&((I_ir == 8'h8F)|(I_ir == 8'h97)))|
	                         ((I_t == 4'd5)&(I_ir == 8'h83))|
	                         ((I_t == 4'd1)&(I_ir == 8'hCB))|
	                         ((I_t == 4'd2)&(I_ir == 8'h87)));
	
	assign O_control[ 77] = (((I_t == 4'd2)&(I_ir == 8'h84))|
	                         ((I_t == 4'd3)&((I_ir == 8'h8C)|(I_ir == 8'h94))));
	
	assign O_control[ 78] = (((I_t == 4'd3)&((I_ir == 8'h96)|(I_ir == 8'h8E)))|
	                         ((I_t == 4'd2)&(I_ir == 8'h86)));
	
	assign O_control[ 79] = (((I_t == 4'd1)&((I_ir == 8'hC0)|(I_ir == 8'hC8)|(I_ir == 8'h88)|(I_ir == 8'h98)))|
	                         ((I_t == 4'd2)&(I_ir == 8'hC4))|
	                         ((I_t == 4'd3)&(I_ir == 8'hCC)));
	
	assign O_control[ 80] = (((I_t == 4'd5)&((I_ir == 8'hDE)|(I_ir == 8'hC3)|(I_ir == 8'hD3)))|
	                         ((I_t == 4'd2)&(I_ir == 8'hC7))|
	                         ((I_t == 4'd4)&((I_ir == 8'hCE)|(I_ir == 8'hD6)|(I_ir == 8'hDF)|(I_ir == 8'hDB)))|
	                         ((I_t == 4'd3)&((I_ir == 8'hD7)|(I_ir == 8'hCF)|(I_ir == 8'hC6)))|
	                         ((I_t == 4'd1)&((I_ir == 8'h88)|(I_ir == 8'hCA))));
	
	assign O_control[ 81] = (((I_t == 4'd2)&(I_ir == 8'hA4))|
	                         ((I_t == 4'd1)&((I_ir == 8'hA8)|(I_ir == 8'hC8)|(I_ir == 8'hA0)|(I_ir == 8'h88)))|
	                         ((I_t == 4'd3)&((I_ir == 8'hAC)|(I_ir == 8'hB4)))|
	                         ((I_t == 4'd4)&(I_ir == 8'hBC)));
	
	assign O_control[ 82] = (((I_t == 4'd2)&(I_ir == 8'hE4))|
	                         ((I_t == 4'd1)&((I_ir == 8'hE8)|(I_ir == 8'h8A)|(I_ir == 8'h9A)|(I_ir == 8'hCA)|(I_ir == 8'hE0)))|
	                         ((I_t == 4'd3)&(I_ir == 8'hEC)));
	
	assign O_control[ 83] = (((I_t == 4'd1)&((I_ir == 8'hA8)|(I_ir == 8'h8A)|(I_ir == 8'hAA)|(I_ir == 8'hBA)|(I_ir == 8'h98))));
	
	assign O_control[ 84] = (((I_t == 4'd1)&(I_ir == 8'h90)));
	
	assign O_control[ 85] = (((I_t == 4'd1)&(I_ir == 8'h9A)));
	
	assign O_control[ 86] = (((I_t == 4'd1)&(I_ir == 8'h9A)));
	
	assign O_control[ 87] = (((I_t == 4'd1)&((I_ir == 8'hBA)|(I_ir == 8'hE8)|(I_ir == 8'hA2)|(I_ir == 8'hCA)|(I_ir == 8'hAA)|(I_ir == 8'hAB)))|
	                         ((I_t == 4'd3)&((I_ir == 8'hAE)|(I_ir == 8'hAF)|(I_ir == 8'hB6)|(I_ir == 8'hB7)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hBE)|(I_ir == 8'hBF)))|
	                         ((I_t == 4'd2)&((I_ir == 8'hA7)|(I_ir == 8'hA6)))|
	                         ((I_t == 4'd5)&((I_ir == 8'hB3)|(I_ir == 8'hA3))));
	
	assign O_control[ 88] = (((I_t == 4'd1)&(I_ir == 8'hB0)));
	
	assign O_control[ 89] = (((I_t == 4'd1)&(I_ir == 8'hB8)));
	
	assign O_control[ 90] = (((I_t == 4'd1)&(I_ir == 8'hBA)));
	
	assign O_control[ 91] = (((I_t == 4'd2)&((I_ir == 8'hC5)|(I_ir == 8'hE4)|(I_ir == 8'hC4)))|
	                         ((I_t == 4'd3)&((I_ir == 8'hD5)|(I_ir == 8'hC7)|(I_ir == 8'hEC)|(I_ir == 8'hCC)|(I_ir == 8'hCD)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hD9)|(I_ir == 8'hD7)|(I_ir == 8'hDD)|(I_ir == 8'hCF)))|
	                         ((I_t == 4'd1)&((I_ir == 8'hE0)|(I_ir == 8'hC0)|(I_ir == 8'hC9)))|
	                         ((I_t == 4'd5)&((I_ir == 8'hD1)|(I_ir == 8'hDF)|(I_ir == 8'hDB)|(I_ir == 8'hC1)))|
	                         ((I_t == 4'd6)&((I_ir == 8'hD3)|(I_ir == 8'hC3))));
	
	assign O_control[ 92] = (((I_t == 4'd3)&((I_ir == 8'hE7)|(I_ir == 8'hC7)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hD7)|(I_ir == 8'hF7)|(I_ir == 8'hCF)|(I_ir == 8'hEF)))|
	                         ((I_t == 4'd5)&((I_ir == 8'hDB)|(I_ir == 8'hFB)|(I_ir == 8'hDF)|(I_ir == 8'hFF)))|
	                         ((I_t == 4'd6)&((I_ir == 8'hF3)|(I_ir == 8'hD3)|(I_ir == 8'hE3)|(I_ir == 8'hC3))));
	
	assign O_control[ 93] = (((I_t == 4'd4)&((I_ir == 8'hF6)|(I_ir == 8'hFB)|(I_ir == 8'hEE)|(I_ir == 8'hFF)))|
	                         ((I_t == 4'd3)&((I_ir == 8'hF7)|(I_ir == 8'hEF)|(I_ir == 8'hE6)))|
	                         ((I_t == 4'd5)&((I_ir == 8'hFE)|(I_ir == 8'hF3)|(I_ir == 8'hE3)))|
	                         ((I_t == 4'd1)&((I_ir == 8'hC8)|(I_ir == 8'hE8)))|
	                         ((I_t == 4'd2)&(I_ir == 8'hE7)));
	
	assign O_control[ 94] = (((I_t == 4'd1)&(I_ir == 8'hD0)));
	
	assign O_control[ 95] = (((I_t == 4'd1)&(I_ir == 8'hD8)));
	
	assign O_control[ 96] = (((I_t == 4'd3)&((I_ir == 8'hE7)|(I_ir == 8'hED)|(I_ir == 8'hF5)))|
	                         ((I_t == 4'd5)&((I_ir == 8'hF1)|(I_ir == 8'hE1)|(I_ir == 8'hFB)|(I_ir == 8'hFF)))|
	                         ((I_t == 4'd6)&((I_ir == 8'hF3)|(I_ir == 8'hE3)))|
	                         ((I_t == 4'd4)&((I_ir == 8'hF7)|(I_ir == 8'hFD)|(I_ir == 8'hEF)|(I_ir == 8'hF9)))|
	                         ((I_t == 4'd1)&((I_ir == 8'hEB)|(I_ir == 8'hE9)))|
	                         ((I_t == 4'd2)&(I_ir == 8'hE5)));
	
	assign O_control[ 97] = (((I_t == 4'd1)&(I_ir == 8'hF0)));
	
	assign O_control[ 98] = (((I_t == 4'd1)&(I_ir == 8'hF8)));
	
	assign O_control[ 99] = (((I_t == 4'd0)));
	
	assign O_control[100] = (((I_t == 4'd0)));
	
endmodule