
	if ((curr_cycle == 2)&(curr_ir inside {8'h5F,8'h8F,8'h4E,8'h59,8'h3D,8'hFE,8'hEE,8'h2C,8'hED,8'hDD,8'h79,8'hDC,8'h8D,8'h2F,8'h7C,8'h1E,8'hDF,8'hFF,8'h4F,8'hCC,8'hDE,8'hCE,8'h19,8'h8E,8'h99,8'h3E,8'h2E,8'h7E,8'h6E,8'hCD,8'h39,8'h2D,8'hBE,8'h1C,8'h7D,8'hF9,8'hBD,8'hAD,8'h6C,8'hAC,8'h1D,8'h5D,8'h3F,8'h0C,8'h4C,8'h1F,8'hFC,8'hBC,8'h5E,8'h0E,8'hDB,8'hCF,8'hFB,8'h5B,8'hFD,8'h6D,8'hEC,8'h5C,8'hD9,8'h0D,8'h4D,8'hAE,8'hB9,8'h9D,8'h8C,8'hEF,8'h3B,8'h3C,8'hBF,8'hAF,8'h1B,8'h0F})|
	    (curr_cycle == 1)&(curr_ir inside {8'h5A,8'h3E,8'h7E,8'hC3,8'h65,8'hCD,8'h49,8'h8E,8'hCE,8'hB2,8'hA2,8'h2E,8'h7D,8'hBD,8'h25,8'hA1,8'h09,8'h6E,8'hE6,8'h2D,8'h6C,8'hAC,8'h90,8'hF1,8'h5D,8'h38,8'hD5,8'h41,8'h1C,8'h05,8'hE0,8'h4C,8'hC4,8'h40,8'h30,8'h91,8'h75,8'hB5,8'h1D,8'h80,8'h74,8'h64,8'hA4,8'h0C,8'hE9,8'hF4,8'hE8,8'hD8,8'hBC,8'hFC,8'h52,8'hB3,8'hF3,8'hE3,8'hD7,8'hC7,8'h3F,8'h88,8'h86,8'h14,8'hC6,8'h53,8'hFB,8'h5B,8'h1F,8'h0F,8'h03,8'hFA,8'h66,8'h4A,8'h33,8'h0E,8'hAB,8'hEB,8'hDB,8'hCF,8'h55,8'hB6,8'h9A,8'h06,8'hDA,8'h42,8'hBE,8'h26,8'hA5,8'h99,8'h89,8'h6D,8'hEA,8'h31,8'h3A,8'h15,8'h7A,8'hF2,8'hD9,8'h39,8'hFD,8'hE1,8'h4D,8'hAE,8'h44,8'hEC,8'hB9,8'hAD,8'h9D,8'h81,8'hC1,8'hE2,8'h29,8'h0D,8'h78,8'h5C,8'hA8,8'h8C,8'h04,8'hD1,8'h28,8'h18,8'hF5,8'hD0,8'hC0,8'h3C,8'h17,8'hB4,8'h20,8'hBF,8'hA3,8'h70,8'h54,8'h94,8'h1A,8'h92,8'h5F,8'h43,8'h07,8'h83,8'hE4,8'hC8,8'h6A,8'h5E,8'h4E,8'h12,8'hEF,8'hD3,8'h3B,8'hB7,8'h59,8'h82,8'hDE,8'hD2,8'hC2,8'h2A,8'hA6,8'h32,8'h71,8'hB1,8'h19,8'hF6,8'h72,8'h62,8'h56,8'h0A,8'hA7,8'hE7,8'hE5,8'h61,8'h51,8'h45,8'h96,8'h8A,8'hD6,8'hCA,8'hBA,8'h22,8'h50,8'h34,8'h95,8'h85,8'h01,8'h79,8'hC5,8'h3D,8'h21,8'h11,8'hFE,8'hEE,8'hA0,8'h84,8'h68,8'h2C,8'hC9,8'h35,8'h10,8'hF9,8'hED,8'hDD,8'h57,8'hB8,8'hF8,8'hDC,8'h48,8'h69,8'hA9,8'h8D,8'h2F,8'hCB,8'h37,8'h58,8'h98,8'h7C,8'h60,8'h24,8'h08,8'h97,8'h87,8'hFF,8'hCC,8'h23,8'h13,8'hB0,8'hF0,8'hD4,8'h76,8'h1E,8'h27,8'h02,8'hAF,8'h1B,8'hDF,8'h47,8'hAA,8'h16,8'h46,8'h36,8'h4F,8'h8F,8'hF7})|
	    (curr_cycle == 5)&(curr_ir inside {8'h60,8'h20})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD0,8'h70,8'h50,8'h10,8'hB0,8'hF0,8'h90,8'h30})|
	    (curr_cycle == 0))
		G_addr = curr_pc;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h5F,8'h43,8'h8F,8'h83,8'h4E,8'hC3,8'hB7,8'h59,8'h3D,8'h21,8'hFE,8'hE7,8'hA6,8'h71,8'hD6,8'hB1,8'h95,8'hF6,8'hA7,8'hC5,8'h11,8'hE5,8'h61,8'h51,8'hEE,8'h35,8'h96,8'h2C,8'h10,8'h50,8'h40,8'hED,8'hDD,8'h01,8'h79,8'h74,8'h68,8'h57,8'h24,8'hDC,8'h8D,8'h46,8'h2F,8'h13,8'hF0,8'h37,8'hD4,8'h7C,8'h1E,8'h60,8'hDF,8'h47,8'hFF,8'h4F,8'hCC,8'hB0,8'hDE,8'hCE,8'h36,8'h76,8'hF7,8'h27,8'h25,8'h19,8'h65,8'h16,8'h8E,8'h99,8'h05,8'h3E,8'h2E,8'h7E,8'h6E,8'hE6,8'hCD,8'h39,8'h2D,8'hBE,8'hF1,8'h1C,8'h7D,8'hF9,8'hBD,8'hAD,8'hA1,8'h91,8'h6C,8'hAC,8'hB5,8'h90,8'h1D,8'h5D,8'hD5,8'h41,8'hF3,8'h3F,8'h0C,8'h4C,8'hC4,8'h30,8'h14,8'h75,8'hB3,8'h1F,8'hFC,8'h64,8'hA4,8'h53,8'hBC,8'h5E,8'h03,8'hD7,8'hC7,8'h33,8'h0E,8'hC6,8'hDB,8'hCF,8'hFB,8'h5B,8'h26,8'h66,8'h56,8'h31,8'h15,8'h55,8'hB6,8'h06,8'h04,8'hFD,8'h44,8'hA5,8'h6D,8'hEC,8'h5C,8'hD9,8'h45,8'hC1,8'h0D,8'hE1,8'h4D,8'hAE,8'h34,8'h28,8'hD0,8'hF5,8'hB9,8'h9D,8'h81,8'h23,8'h17,8'hF4,8'hE4,8'h8C,8'h70,8'hD1,8'hEF,8'hE3,8'h3B,8'h97,8'h3C,8'hB4,8'h20,8'h07,8'hBF,8'hAF,8'h1B,8'hA3,8'h0F,8'h54,8'h94,8'hD3})|
	    (curr_cycle == 1)&(curr_ir inside {8'h5A,8'h3E,8'h7E,8'hC3,8'h65,8'hCD,8'h49,8'h8E,8'hCE,8'hB2,8'hA2,8'h2E,8'h7D,8'hBD,8'h25,8'hA1,8'h09,8'h6E,8'hE6,8'h2D,8'h6C,8'hAC,8'h90,8'hF1,8'h5D,8'h38,8'hD5,8'h41,8'h1C,8'h05,8'hE0,8'h4C,8'hC4,8'h40,8'h30,8'h91,8'h75,8'hB5,8'h1D,8'h80,8'h74,8'h64,8'hA4,8'h0C,8'hE9,8'hF4,8'hE8,8'hD8,8'hBC,8'hFC,8'h52,8'hB3,8'hF3,8'hE3,8'hD7,8'hC7,8'h3F,8'h88,8'h86,8'h14,8'hC6,8'h53,8'hFB,8'h5B,8'h1F,8'h0F,8'h03,8'hFA,8'h66,8'h4A,8'h33,8'h0E,8'hAB,8'hEB,8'hDB,8'hCF,8'h55,8'hB6,8'h9A,8'h06,8'hDA,8'h42,8'hBE,8'h26,8'hA5,8'h99,8'h89,8'h6D,8'hEA,8'h31,8'h3A,8'h15,8'h7A,8'hF2,8'hD9,8'h39,8'hFD,8'hE1,8'h4D,8'hAE,8'h44,8'hEC,8'hB9,8'hAD,8'h9D,8'h81,8'hC1,8'hE2,8'h29,8'h0D,8'h78,8'h5C,8'hA8,8'h8C,8'h04,8'hD1,8'h28,8'h18,8'hF5,8'hD0,8'hC0,8'h3C,8'h17,8'hB4,8'h20,8'hBF,8'hA3,8'h70,8'h54,8'h94,8'h1A,8'h92,8'h5F,8'h43,8'h07,8'h83,8'hE4,8'hC8,8'h6A,8'h5E,8'h4E,8'h12,8'hEF,8'hD3,8'h3B,8'hB7,8'h59,8'h82,8'hDE,8'hD2,8'hC2,8'h2A,8'hA6,8'h32,8'h71,8'hB1,8'h19,8'hF6,8'h72,8'h62,8'h56,8'h0A,8'hA7,8'hE7,8'hE5,8'h61,8'h51,8'h45,8'h96,8'h8A,8'hD6,8'hBA,8'hCA,8'h22,8'h50,8'h34,8'h95,8'h85,8'h01,8'h79,8'hC5,8'h3D,8'h21,8'h11,8'hFE,8'hEE,8'hA0,8'h84,8'h68,8'h2C,8'hC9,8'h35,8'h10,8'hF9,8'hED,8'hDD,8'h57,8'hB8,8'hF8,8'hDC,8'h48,8'h69,8'hA9,8'h8D,8'h2F,8'h37,8'h58,8'h98,8'h7C,8'h60,8'h24,8'h08,8'h97,8'h87,8'hFF,8'hCC,8'h23,8'h13,8'hB0,8'hF0,8'hD4,8'h76,8'h1E,8'h02,8'h27,8'hAF,8'h1B,8'hDF,8'h47,8'hAA,8'h16,8'h46,8'h36,8'h4F,8'h8F,8'hF7})|
	    (curr_cycle == 3)&(curr_ir inside {8'h33,8'h0E,8'h53,8'hB6,8'h5E,8'hFB,8'h5B,8'h56,8'hDB,8'hD9,8'hCD,8'hBE,8'hAE,8'hB9,8'h31,8'hAD,8'h15,8'h55,8'hFD,8'hE1,8'h4D,8'h6D,8'hEC,8'hD0,8'h3C,8'h9D,8'h81,8'h5C,8'hC1,8'h0D,8'h70,8'h34,8'hD1,8'hF5,8'h23,8'h17,8'hF4,8'hBF,8'hAF,8'hA3,8'hEF,8'hD3,8'hE3,8'h3B,8'h5F,8'hDE,8'h83,8'h1B,8'h0F,8'h7E,8'hB7,8'h4F,8'h43,8'h61,8'h4E,8'h3E,8'hB1,8'h19,8'h59,8'h79,8'hF6,8'h3D,8'h21,8'hFE,8'h51,8'h2C,8'h71,8'hED,8'hD6,8'h01,8'h50,8'h11,8'hEE,8'h35,8'h10,8'h40,8'hDD,8'hDC,8'hCC,8'hB0,8'h68,8'h37,8'h7C,8'h57,8'h60,8'hFF,8'h2F,8'h13,8'hF0,8'hD4,8'h76,8'h1E,8'hDF,8'hCF,8'hC3,8'hCE,8'h36,8'hF7,8'h99,8'hBD,8'h6E,8'h16,8'hF1,8'h5D,8'h7D,8'h2E,8'hA1,8'h91,8'h75,8'h39,8'h2D,8'h1D,8'hAC,8'h90,8'h74,8'h28,8'hD5,8'h41,8'h1C,8'hF9,8'hB4,8'h6C,8'hB5,8'hB3,8'hF3,8'hD7,8'h3F,8'h0C,8'h30,8'h14,8'h1F,8'hBC,8'h03,8'hFC,8'h54})|
	    (curr_cycle == 5)&(curr_ir inside {8'h57,8'h60,8'hD3,8'h43,8'h71,8'hB1,8'h21,8'h11,8'h61,8'h51,8'h01,8'h40,8'h2F,8'h23,8'h13,8'h37,8'hC3,8'h4F,8'hA1,8'hF1,8'h41,8'hF3,8'hE3,8'h20,8'hB3,8'hA3,8'h0F,8'h03,8'h53,8'h33,8'h31,8'hE1,8'hC1,8'hD1,8'h17})|
	    (curr_cycle == 6)&(curr_ir inside {8'h1F,8'h3F,8'h5B,8'h1B,8'h3B,8'h5F})|
	    (curr_cycle == 4)&(curr_ir inside {8'h27,8'h60,8'hFF,8'h5B,8'h3E,8'hDF,8'hC3,8'h7D,8'hBD,8'hA1,8'h6C,8'h1D,8'hF1,8'h11,8'h5D,8'h41,8'h1C,8'h91,8'hF9,8'h3F,8'hB3,8'hA3,8'h1F,8'hF3,8'h03,8'hFC,8'h1E,8'h53,8'hBC,8'h5E,8'hE3,8'h33,8'h31,8'hFB,8'hD9,8'h39,8'hFD,8'hBE,8'hB9,8'h5C,8'hE1,8'hD1,8'hDC,8'h3C,8'h81,8'hC1,8'h07,8'hBF,8'h3B,8'h5F,8'h43,8'h1B,8'hD3,8'hDE,8'hDB,8'h83,8'h7E,8'h59,8'h3D,8'h21,8'h61,8'h71,8'hB1,8'h19,8'h01,8'h79,8'hFE,8'h51,8'h40,8'h23,8'h13,8'h7C,8'hDD,8'h47})|
	    (curr_cycle == 7)&(curr_ir inside {8'h13,8'h03,8'h53,8'h33,8'h23,8'h43})|
	    (curr_cycle == 0))
		G_rdwr = 1;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hD1,8'h22,8'hC7,8'hD7,8'h3F,8'h50,8'h3E,8'h34,8'hF5,8'h7E,8'h95,8'h85,8'h01,8'h79,8'hC5,8'h3D,8'h86,8'h14,8'hC3,8'hD0,8'h65,8'h21,8'h3C,8'h11,8'h17,8'hC0,8'h53,8'hB4,8'h49,8'hC6,8'h20,8'hCD,8'hFE,8'hEE,8'hA0,8'hFB,8'h8E,8'h84,8'h5B,8'hCE,8'h1F,8'h0F,8'h2C,8'h03,8'hA2,8'hB2,8'hC9,8'hBF,8'h35,8'h10,8'hA3,8'hF9,8'hED,8'hDD,8'h2E,8'h70,8'h66,8'h7D,8'h54,8'hBD,8'h33,8'h0E,8'h57,8'h94,8'h25,8'hAB,8'hA1,8'h09,8'hEB,8'hDB,8'h6E,8'h92,8'hCF,8'hE6,8'hDC,8'h2D,8'h69,8'h5F,8'h55,8'h6C,8'hA9,8'h43,8'hB6,8'h07,8'h8D,8'h83,8'hAC,8'h2F,8'h90,8'h06,8'hE4,8'hF1,8'h42,8'h5D,8'hBE,8'hD5,8'h26,8'h41,8'h1C,8'h37,8'hCB,8'h5E,8'h05,8'h4E,8'h12,8'hA5,8'h7C,8'h99,8'hEF,8'h89,8'hD3,8'h24,8'h6D,8'h3B,8'hE0,8'h31,8'h4C,8'hB7,8'hC4,8'h59,8'h15,8'h30,8'h91,8'h97,8'h87,8'hF2,8'h75,8'hFF,8'h82,8'hDE,8'hB5,8'hCC,8'hD2,8'h1D,8'h23,8'h13,8'hC2,8'hD9,8'hB0,8'hA6,8'h39,8'hF0,8'hFD,8'hD4,8'h76,8'h32,8'h4D,8'h80,8'hE1,8'h74,8'h64,8'h71,8'h1E,8'hA4,8'hAE,8'h0C,8'h27,8'h02,8'hB1,8'hAF,8'h44,8'h19,8'h1B,8'hE9,8'hDF,8'hF6,8'h72,8'h47,8'h62,8'hEC,8'h56,8'hB9,8'hA7,8'hAD,8'h9D,8'hE3,8'hE7,8'h81,8'h16,8'hF4,8'hC1,8'hE2,8'h29,8'h46,8'h61,8'h36,8'h51,8'h0D,8'hBC,8'hE5,8'h4F,8'h45,8'hFC,8'h5C,8'h52,8'h8F,8'h96,8'hF7,8'h8C,8'hB3,8'h04,8'hD6,8'hF3})|
	    (curr_cycle == 2)&(curr_ir inside {8'h5F,8'h6C,8'h8F,8'h8D,8'hAC,8'h2F,8'h1D,8'h5D,8'h4E,8'h3F,8'h7C,8'h1E,8'h0C,8'h6D,8'h59,8'hDF,8'h3D,8'hEC,8'hFF,8'hFE,8'h4F,8'hCC,8'h5C,8'hD9,8'hCE,8'hDE,8'h1F,8'h0D,8'hFC,8'h4D,8'hAE,8'h19,8'hB9,8'h9D,8'h8E,8'hBC,8'h5E,8'hEE,8'h8C,8'h99,8'h2C,8'hEF,8'hED,8'h3E,8'h2E,8'hDD,8'h3B,8'h7E,8'h6E,8'h79,8'h0E,8'h3C,8'hDB,8'hCD,8'hCF,8'h39,8'h2D,8'hFD,8'hFB,8'h5B,8'hBE,8'hAF,8'hBF,8'h1B,8'h0F,8'h1C,8'h7D,8'hF9,8'hBD,8'hAD,8'hDC})|
	    (curr_cycle == 5)&(curr_ir == 8'h60)|
	    (curr_cycle == 0))
		{next_pch, next_pcl} = curr_pc + 1;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hA1,8'h01,8'hC1,8'h43,8'h03,8'h23,8'hE1,8'h41,8'h83,8'hC3,8'h61,8'hA3,8'h21,8'hE3,8'h81}))
		next_bah = 0;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hDD,8'h7C,8'h3F,8'h19,8'h1B,8'h7D,8'h99,8'hF9,8'h3E,8'hDF,8'hBD,8'h7E,8'h3B,8'hA1,8'h01,8'h59,8'h79,8'hDB,8'hB9,8'h3D,8'hC3,8'h9D,8'hDC,8'h21,8'h3C,8'hFF,8'h81,8'h5F,8'hDE,8'h6C,8'hC1,8'h43,8'hFE,8'h1D,8'h23,8'hFB,8'h83,8'hD9,8'h61,8'hBC,8'h5B,8'h39,8'hFC,8'h1F,8'h5C,8'hFD,8'h5D,8'hBE,8'h03,8'hE1,8'hBF,8'h41,8'h1C,8'h5E,8'hA3,8'hE3,8'h1E})|
	    (curr_cycle == 2)&(curr_ir inside {8'h11,8'h51,8'hB3,8'h13,8'hF1,8'hF3,8'h71,8'hD1,8'h33,8'hB1,8'h91,8'hD3,8'h31,8'h53}))
		next_bal = G_rd_data;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h43,8'h8F,8'h83,8'h4E,8'hC3,8'hB7,8'h21,8'hFE,8'hE7,8'h71,8'hD6,8'hB1,8'h95,8'hF6,8'h11,8'h61,8'h51,8'hEE,8'h35,8'h96,8'h2C,8'h40,8'hED,8'h01,8'h74,8'h68,8'h57,8'h8D,8'h46,8'h2F,8'h13,8'h37,8'hD4,8'h1E,8'h60,8'h47,8'h4F,8'hCC,8'hDE,8'hCE,8'h36,8'h76,8'hF7,8'h27,8'h16,8'h8E,8'h99,8'h3E,8'h2E,8'h7E,8'h6E,8'hE6,8'hCD,8'h2D,8'hF1,8'hAD,8'hA1,8'h91,8'h6C,8'hAC,8'hB5,8'hD5,8'h41,8'hF3,8'h0C,8'h14,8'h75,8'hB3,8'h53,8'h5E,8'h03,8'hD7,8'hC7,8'h33,8'h0E,8'hC6,8'hCF,8'h26,8'h66,8'h56,8'h31,8'h15,8'h55,8'hB6,8'h06,8'h6D,8'hEC,8'hC1,8'h0D,8'hE1,8'h4D,8'hAE,8'h34,8'h28,8'hF5,8'h9D,8'h81,8'h23,8'h17,8'hF4,8'h8C,8'hD1,8'hEF,8'hE3,8'h97,8'hB4,8'h20,8'h07,8'hAF,8'hA3,8'h0F,8'h54,8'h94,8'hD3})|
	    (curr_cycle == 1)&(curr_ir inside {8'h3E,8'h7E,8'hC3,8'h65,8'hCD,8'h8E,8'hCE,8'h2E,8'h7D,8'hBD,8'h25,8'hA1,8'h6E,8'hE6,8'h2D,8'h6C,8'hAC,8'hF1,8'h5D,8'hD5,8'h41,8'h1C,8'h05,8'h4C,8'hC4,8'h40,8'h91,8'h75,8'hB5,8'h1D,8'h74,8'h64,8'hA4,8'h0C,8'hF4,8'hBC,8'hFC,8'hB3,8'hF3,8'hE3,8'hD7,8'hC7,8'h3F,8'h86,8'h14,8'hC6,8'h53,8'hFB,8'h5B,8'h1F,8'h0F,8'h03,8'h66,8'h33,8'h0E,8'hDB,8'hCF,8'h55,8'hB6,8'h06,8'hBE,8'h26,8'hA5,8'h99,8'h6D,8'h31,8'h15,8'hD9,8'h39,8'hFD,8'hE1,8'h4D,8'hAE,8'h44,8'hEC,8'hB9,8'hAD,8'h9D,8'h81,8'hC1,8'h0D,8'h5C,8'h8C,8'h04,8'hD1,8'h28,8'hF5,8'h3C,8'h17,8'hB4,8'h20,8'hBF,8'hA3,8'h54,8'h94,8'h5F,8'h43,8'h07,8'h83,8'hE4,8'h5E,8'h4E,8'hEF,8'hD3,8'h3B,8'hB7,8'h59,8'hDE,8'hA6,8'h71,8'hB1,8'h19,8'hF6,8'h56,8'hA7,8'hE7,8'hE5,8'h61,8'h51,8'h45,8'h96,8'hD6,8'h34,8'h95,8'h85,8'h01,8'h79,8'hC5,8'h3D,8'h21,8'h11,8'hFE,8'hEE,8'h84,8'h68,8'h2C,8'h35,8'hF9,8'hED,8'hDD,8'h57,8'hDC,8'h48,8'h8D,8'h2F,8'h37,8'h7C,8'h60,8'h24,8'h08,8'h97,8'h87,8'hFF,8'hCC,8'h23,8'h13,8'hD4,8'h76,8'h1E,8'h27,8'hAF,8'h1B,8'hDF,8'h47,8'h16,8'h46,8'h36,8'h4F,8'h8F,8'hF7})|
	    (curr_cycle == 3)&(curr_ir inside {8'hC7,8'h0E,8'hC6,8'h5E,8'hFB,8'h5B,8'h66,8'h56,8'hDB,8'hD9,8'hBE,8'h26,8'hB9,8'h06,8'hFD,8'hE1,8'h3C,8'h9D,8'h81,8'h5C,8'hC1,8'h23,8'h17,8'h07,8'hBF,8'hA3,8'hEF,8'hE3,8'h3B,8'h5F,8'hDE,8'h83,8'h1B,8'h0F,8'h7E,8'hE7,8'h4F,8'h43,8'h61,8'h4E,8'h3E,8'h19,8'h59,8'h79,8'hF6,8'h3D,8'h21,8'hFE,8'hD6,8'h01,8'hEE,8'h40,8'hDD,8'hDC,8'h37,8'h7C,8'h57,8'h60,8'hFF,8'h46,8'h2F,8'h76,8'h1E,8'hDF,8'hCF,8'h47,8'hC3,8'hCE,8'h36,8'hF7,8'h99,8'h27,8'hBD,8'h6E,8'hE6,8'h16,8'h5D,8'h7D,8'h2E,8'hA1,8'h91,8'h39,8'h1D,8'h41,8'h1C,8'hF9,8'h6C,8'hD7,8'h3F,8'h20,8'h1F,8'hBC,8'h03,8'hFC})|
	    (curr_cycle == 4)&(curr_ir inside {8'hD7,8'h37,8'h60,8'hFF,8'h5B,8'h4F,8'h36,8'h76,8'h3E,8'hDF,8'hCF,8'hC3,8'h16,8'hCE,8'hF7,8'hA1,8'h2E,8'h6E,8'hF1,8'h11,8'h41,8'h91,8'h3F,8'hB3,8'hA3,8'h1F,8'hF3,8'h03,8'h1E,8'h0E,8'h53,8'h5E,8'hE3,8'h33,8'h31,8'hFB,8'h56,8'h17,8'hE1,8'hD1,8'h20,8'h81,8'hC1,8'h3B,8'h5F,8'h43,8'h1B,8'hEF,8'h0F,8'hD3,8'hDE,8'hDB,8'h83,8'hD6,8'h4E,8'h7E,8'hF6,8'h21,8'h61,8'h71,8'hB1,8'h01,8'hEE,8'hFE,8'h51,8'h40,8'h2F,8'h23,8'h13,8'h57})|
	    (curr_cycle == 6)&(curr_ir inside {8'hF3,8'h53,8'hE3,8'h33,8'h03,8'h23,8'h43,8'hD3,8'h13,8'hC3})|
	    (curr_cycle == 5)&(curr_ir inside {8'hD3,8'h3B,8'h5F,8'h43,8'hDE,8'h1B,8'hFE,8'hFF,8'h23,8'h13,8'h1E,8'hDF,8'h7E,8'hC3,8'h5B,8'h3E,8'hF3,8'hE3,8'h3F,8'hFB,8'h1F,8'h03,8'hDB,8'h53,8'h5E,8'h33})|
	    (curr_cycle == 0))
		next_cycle = curr_cycle + 1;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h81,8'h23,8'h43,8'h83,8'h61,8'hC1,8'hE1,8'h41,8'hA3,8'h03,8'hE3,8'hC3,8'hA1,8'h01,8'h21})|
	    (curr_cycle == 3)&(curr_ir inside {8'hE1,8'h41,8'hA3,8'h01,8'hE3,8'hC3,8'hA1,8'h21,8'h23,8'h6C,8'h43,8'h81,8'h61,8'hC1,8'h83,8'h03})|
	    (curr_cycle == 4)&(curr_ir inside {8'h6C,8'h43,8'h21,8'h81,8'h61,8'hC1,8'h23,8'h83,8'h41,8'hA3,8'h03,8'hE1,8'hE3,8'hA1,8'h01,8'hC3}))
		G_addr = curr_ba;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h81,8'hA1,8'h01,8'h23,8'hA3,8'hC3,8'h43,8'hE1,8'h41,8'h83,8'hE3,8'h61,8'hC1,8'h21,8'h03}))
		next_bal = curr_bal + curr_x;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hD1,8'hD7,8'hC7,8'hF5,8'h34,8'h95,8'h85,8'hC5,8'h86,8'h14,8'h65,8'hC6,8'h17,8'h11,8'h53,8'hB4,8'hCD,8'h20,8'hEE,8'h8E,8'h84,8'hCE,8'h0F,8'h2C,8'h35,8'hED,8'h2E,8'h66,8'h54,8'h33,8'h0E,8'h57,8'h94,8'h25,8'h6E,8'hCF,8'hE6,8'h2D,8'h55,8'hB6,8'h07,8'h8D,8'hAC,8'h2F,8'h06,8'hE4,8'hF1,8'hD5,8'h26,8'h37,8'h4E,8'h05,8'hA5,8'hEF,8'hD3,8'h24,8'h6D,8'h31,8'h4C,8'hB7,8'hC4,8'h15,8'h91,8'h97,8'h87,8'h75,8'hB5,8'hCC,8'h13,8'hA6,8'hD4,8'h76,8'h4D,8'h74,8'h64,8'h71,8'hAE,8'hA4,8'h0C,8'h27,8'hB1,8'hAF,8'h44,8'hF6,8'h47,8'hEC,8'h56,8'hA7,8'hAD,8'hE7,8'h16,8'hF4,8'h46,8'hE5,8'h36,8'h51,8'h0D,8'h4F,8'h45,8'h8F,8'h96,8'hF7,8'h8C,8'hB3,8'h04,8'hD6,8'hF3})|
	    (curr_cycle == 3)&(curr_ir inside {8'h01,8'h23,8'hA3,8'hE3,8'hA1,8'h83,8'h41,8'h6C,8'h43,8'h61,8'hE1,8'hC3,8'h21,8'h81,8'hC1,8'h03}))
		next_adl = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hE1,8'h41,8'h83,8'h23,8'h6C,8'hA1,8'h43,8'h03,8'hA3,8'hE3,8'h81,8'hC3,8'h01,8'h61,8'hC1,8'h21}))
		next_bal = curr_bal + 1;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hCD,8'hCF,8'h8E,8'h4F,8'h2D,8'h8F,8'hCC,8'h8D,8'hAC,8'h2F,8'hEE,8'hCE,8'h0D,8'h8C,8'h4D,8'hAF,8'h4E,8'h2C,8'h0F,8'hAE,8'hEF,8'hED,8'h2E,8'h0C,8'h6D,8'hAD,8'h6E,8'h4C,8'h0E,8'hEC})|
	    (curr_cycle == 4)&(curr_ir inside {8'h6C,8'h43,8'h21,8'h81,8'h61,8'hC1,8'h23,8'h83,8'h41,8'hA3,8'h03,8'hE1,8'hE3,8'hA1,8'h01,8'hC3})|
	    (curr_cycle == 5)&(curr_ir == 8'h20))
		next_adh = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hC7,8'h33,8'h0E,8'h53,8'hC6,8'hB6,8'h66,8'h56,8'hCD,8'hAE,8'h26,8'h31,8'hAD,8'h15,8'h55,8'h06,8'h4D,8'h6D,8'hEC,8'h0D,8'h8C,8'h34,8'hD1,8'h94,8'hF5,8'h17,8'h07,8'hF4,8'hAF,8'hEF,8'hD3,8'h0F,8'hB7,8'hE7,8'h4F,8'h4E,8'hB1,8'h95,8'hF6,8'h51,8'h2C,8'h71,8'hED,8'hD6,8'h11,8'h8D,8'hEE,8'h35,8'h97,8'hCC,8'h37,8'h57,8'h46,8'h2F,8'h13,8'h8F,8'hD4,8'h76,8'hCF,8'h47,8'h8E,8'hCE,8'h36,8'hF7,8'h27,8'h6E,8'hE6,8'h16,8'hF1,8'h96,8'h2E,8'h91,8'h75,8'h2D,8'hAC,8'h74,8'hD5,8'hB4,8'hB5,8'hB3,8'hF3,8'hD7,8'h0C,8'h14,8'h54})|
	    (curr_cycle == 5)&(curr_ir inside {8'h57,8'h83,8'hEF,8'hD3,8'h3B,8'h5F,8'h43,8'hDE,8'h4E,8'h1B,8'hF6,8'h71,8'hD6,8'hB1,8'h21,8'h11,8'h61,8'h51,8'hFE,8'hEE,8'h01,8'hFF,8'h2F,8'h23,8'h13,8'h1E,8'hDF,8'h36,8'h76,8'hF7,8'h37,8'h7E,8'h16,8'hC3,8'h5B,8'h4F,8'hCE,8'h3E,8'hA1,8'h6E,8'hF1,8'h2E,8'h91,8'h41,8'hF3,8'hE3,8'hD7,8'h3F,8'hFB,8'hB3,8'hA3,8'h1F,8'h0F,8'h03,8'h0E,8'hDB,8'h53,8'hCF,8'h5E,8'h33,8'h31,8'hE1,8'h56,8'h81,8'hC1,8'hD1,8'h17})|
	    (curr_cycle == 4)&(curr_ir inside {8'h46,8'hD7,8'h37,8'h27,8'hC6,8'hFF,8'h5B,8'h4F,8'h36,8'h76,8'h3E,8'hDF,8'hCF,8'h16,8'hCE,8'hF7,8'h99,8'h7D,8'hBD,8'h2E,8'h6E,8'hE6,8'h1D,8'h5D,8'h1C,8'hF9,8'h3F,8'h1F,8'hFC,8'h1E,8'h0E,8'hBC,8'h5E,8'h26,8'h66,8'hC7,8'h06,8'hFB,8'h56,8'hD9,8'h39,8'hFD,8'hBE,8'hB9,8'h9D,8'h17,8'h5C,8'hDC,8'h3C,8'h07,8'hBF,8'h3B,8'h5F,8'h1B,8'hEF,8'h0F,8'hDE,8'hE7,8'hDB,8'hD6,8'h4E,8'h7E,8'hF6,8'h59,8'h3D,8'h19,8'h79,8'hFE,8'hEE,8'h2F,8'h7C,8'hDD,8'h57,8'h47})|
	    (curr_cycle == 6)&(curr_ir inside {8'h1F,8'hF3,8'h3F,8'h53,8'h5E,8'hE3,8'h33,8'hFB,8'h5B,8'h03,8'hDB,8'hFE,8'h23,8'h1B,8'h3B,8'h5F,8'h43,8'hD3,8'hDE,8'h13,8'h1E,8'hFF,8'hDF,8'hC3,8'h3E,8'h7E})|
	    (curr_cycle == 2)&(curr_ir inside {8'hB7,8'hE7,8'hA6,8'h71,8'hD6,8'hB1,8'h95,8'hF6,8'hA7,8'hC5,8'h11,8'hE5,8'h51,8'h35,8'h96,8'h85,8'h84,8'h74,8'h57,8'h24,8'h46,8'h13,8'h37,8'hD4,8'h47,8'h87,8'h36,8'h76,8'hF7,8'h27,8'h25,8'h65,8'h16,8'h05,8'hE6,8'hF1,8'h91,8'hB5,8'hD5,8'hF3,8'hC4,8'h14,8'h75,8'hB3,8'h64,8'hA4,8'h53,8'hD7,8'hC7,8'h33,8'h86,8'hC6,8'h26,8'h66,8'h56,8'h31,8'h15,8'h55,8'hB6,8'h06,8'h04,8'h44,8'hA5,8'h45,8'h34,8'hF5,8'h17,8'hF4,8'hE4,8'hD1,8'h97,8'hB4,8'h07,8'h54,8'h94,8'hD3})|
	    (curr_cycle == 7)&(curr_ir inside {8'h13,8'hC3,8'hF3,8'h03,8'h53,8'h33,8'h23,8'hD3,8'hE3,8'h43}))
		G_addr = curr_ad;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h0F,8'h57,8'h01,8'h0E,8'hA1,8'h6E,8'hCF,8'h83,8'hF1,8'h60,8'h40,8'hEF,8'h2E,8'h31,8'h91,8'h2F,8'h41,8'h4E,8'hE1,8'h56,8'hF6,8'h81,8'hC1,8'h36,8'h76,8'h71,8'hF7,8'h37,8'hD6,8'hD1,8'hD7,8'hB1,8'h20,8'h16,8'h21,8'h11,8'h17,8'h61,8'h51,8'h4F,8'hEE,8'hB3,8'hCE,8'hA3})|
	    (curr_cycle == 3)&(curr_ir inside {8'h8C,8'hED,8'h70,8'h34,8'h94,8'h50,8'hF5,8'hB6,8'h8D,8'hF4,8'h35,8'h10,8'h96,8'hAF,8'h97,8'h75,8'h2D,8'hCC,8'hB0,8'hCD,8'h68,8'hAC,8'h90,8'h74,8'h28,8'hAE,8'hD5,8'hB7,8'hAD,8'h15,8'hB4,8'h55,8'hB5,8'h8F,8'hF0,8'hD4,8'h4D,8'h0C,8'h6D,8'h95,8'h30,8'hEC,8'h14,8'hD0,8'h8E,8'h0D,8'h2C,8'h54})|
	    (curr_cycle == 1)&(curr_ir inside {8'h18,8'h5A,8'h88,8'hC0,8'h49,8'hA0,8'hA2,8'hC9,8'hFA,8'h4A,8'hAB,8'hB8,8'h09,8'hEB,8'h1A,8'hF8,8'h69,8'hA9,8'h9A,8'hCA,8'hDA,8'h38,8'hC8,8'h6A,8'hCB,8'h58,8'h98,8'h89,8'hEA,8'hE0,8'h3A,8'h7A,8'hC2,8'h2A,8'h80,8'hE9,8'hBA,8'h0A,8'hAA,8'hE2,8'hD8,8'hE8,8'h29,8'h78,8'hA8,8'h8A})|
	    (curr_cycle == 6)&(curr_ir inside {8'hFE,8'hFF,8'hDE,8'h1F,8'h3F,8'hDF,8'h5E,8'h3E,8'h7E,8'hFB,8'h5B,8'h1B,8'h3B,8'hDB,8'h5F,8'h1E})|
	    (curr_cycle == 4)&(curr_ir inside {8'hE7,8'hD9,8'h39,8'h46,8'hFD,8'hBE,8'h27,8'hF9,8'hB9,8'hC6,8'h9D,8'h59,8'h3D,8'h5C,8'hFC,8'h19,8'h79,8'hDC,8'h3C,8'h07,8'hBC,8'hBF,8'h26,8'h99,8'h66,8'h7D,8'hC7,8'hBD,8'hE6,8'h6C,8'h06,8'h1D,8'h5D,8'h7C,8'h1C,8'hDD,8'h47})|
	    (curr_cycle == 7)&(curr_ir inside {8'h33,8'hE3,8'hD3,8'h43,8'h13,8'hF3,8'hC3,8'h03,8'h53,8'h23})|
	    (curr_cycle == 2)&(curr_ir inside {8'h04,8'h44,8'hA5,8'h4C,8'hC4,8'h87,8'h45,8'hA6,8'h64,8'hA4,8'h25,8'h65,8'hA7,8'hC5,8'h48,8'hE5,8'hE4,8'h05,8'h85,8'h86,8'h84,8'h24,8'h08}))
		next_cycle = 0;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h0F,8'h03,8'h57,8'h01,8'h53,8'hD3,8'h31,8'h43,8'h2F,8'h13,8'h41,8'hC1,8'h37,8'hD1,8'hC3,8'h21,8'h11,8'h17,8'h51,8'h4F})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD6,8'h0E,8'h16,8'h17,8'hEE,8'h35,8'h56,8'h2D,8'hCC,8'hCD,8'h0F,8'hD5,8'h57,8'h15,8'h4F,8'h55,8'h4E,8'hD7,8'h4D,8'hCF,8'hF6,8'hEC,8'hCE,8'h0D,8'h2C})|
	    (curr_cycle == 4)&(curr_ir inside {8'hDE,8'hD9,8'hDB,8'h39,8'h27,8'h59,8'h3D,8'h5B,8'h1F,8'h19,8'hDF,8'h1E,8'hFE,8'h07,8'h5E,8'h5F,8'h1D,8'h5D,8'h1B,8'hDD,8'h47})|
	    (curr_cycle == 2)&(curr_ir inside {8'h46,8'h06,8'hC4,8'h47,8'h45,8'h25,8'hC5,8'hE4,8'h05,8'hC7,8'hE6,8'hC6,8'h07,8'h24})|
	    (curr_cycle == 7)&(curr_ir inside {8'h33,8'h43,8'h13,8'h03,8'h53,8'h23})|
	    (curr_cycle == 1)&(curr_ir inside {8'hC0,8'h49,8'hC9,8'h4A,8'h09,8'hE0,8'h0A,8'h29})|
	    (curr_cycle == 6)&(curr_ir inside {8'h1F,8'h3F,8'h5B,8'h1B,8'h3B,8'h5F}))
		alu_in_c = 0;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h0F,8'h57,8'h01,8'h83,8'hF1,8'hD3,8'h31,8'h2F,8'h41,8'hE1,8'hC1,8'h71,8'h37,8'hF3,8'hE3,8'hD1,8'hC3,8'h21,8'h17,8'h11,8'h61,8'h51,8'h4F})|
	    (curr_cycle == 3)&(curr_ir inside {8'hF7,8'hED,8'hF5,8'h35,8'hEF,8'h97,8'h75,8'h2D,8'hCD,8'hD5,8'h15,8'h55,8'h8F,8'hD7,8'h4D,8'h6D,8'hCF,8'h0D,8'h2C})|
	    (curr_cycle == 4)&(curr_ir inside {8'hD9,8'hDB,8'h39,8'hFD,8'h27,8'hF9,8'h59,8'h3D,8'hFF,8'h19,8'hDF,8'h79,8'h07,8'h7D,8'h1D,8'hFB,8'h5D,8'hDD,8'h47})|
	    (curr_cycle == 7)&(curr_ir inside {8'h33,8'h43,8'h13,8'h03,8'h53,8'h23})|
	    (curr_cycle == 6)&(curr_ir inside {8'h1F,8'h3F,8'h5B,8'h1B,8'h3B,8'h5F})|
	    (curr_cycle == 1)&(curr_ir inside {8'h49,8'hC9,8'h4A,8'h09,8'hEB,8'h69,8'h6A,8'hCB,8'h2A,8'hE9,8'h0A,8'h29})|
	    (curr_cycle == 2)&(curr_ir inside {8'h87,8'hE7,8'h45,8'h25,8'h65,8'hC5,8'hE5,8'h05,8'hC7,8'h24}))
		alu_in_lhs = curr_a;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h0F,8'h57,8'h01,8'hF1,8'h31,8'h2F,8'h41,8'hE1,8'hC1,8'h71,8'h37,8'hD1,8'h21,8'h17,8'h11,8'h61,8'h51,8'h4F})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'hF5,8'h35,8'h75,8'h2D,8'hCC,8'hCD,8'hD5,8'h15,8'h55,8'h4D,8'h6D,8'hEC,8'h0D,8'h2C})|
	    (curr_cycle == 4)&(curr_ir inside {8'hD9,8'h39,8'hFD,8'h27,8'hF9,8'h59,8'h3D,8'h19,8'h79,8'h07,8'h7D,8'h1D,8'h5D,8'hDD,8'h47})|
	    (curr_cycle == 7)&(curr_ir inside {8'h33,8'h43,8'h13,8'h03,8'h53,8'h23})|
	    (curr_cycle == 1)&(curr_ir inside {8'hC0,8'h49,8'hC9,8'h09,8'hEB,8'h69,8'hE0,8'hE9,8'h29})|
	    (curr_cycle == 6)&(curr_ir inside {8'h1F,8'h3F,8'h5B,8'h1B,8'h3B,8'h5F})|
	    (curr_cycle == 2)&(curr_ir inside {8'hC4,8'h45,8'h25,8'h65,8'hC5,8'hE5,8'hE4,8'h05,8'h24}))
		alu_in_rhs = G_rd_data;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h0F,8'h01,8'h17,8'h11})|
	    (curr_cycle == 6)&(curr_ir inside {8'h1F,8'h1B})|
	    (curr_cycle == 7)&(curr_ir inside {8'h13,8'h03})|
	    (curr_cycle == 4)&(curr_ir inside {8'h19,8'h07,8'h1D})|
	    (curr_cycle == 1)&(curr_ir == 8'h09)|
	    (curr_cycle == 3)&(curr_ir inside {8'h0D,8'h15})|
	    (curr_cycle == 2)&(curr_ir == 8'h05))
		next_a = alu_or;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h0F,8'hF1,8'h71,8'hE1,8'hF7,8'h57,8'hEF,8'h01,8'hB1,8'h31,8'hA1,8'h21,8'h17,8'h11,8'h61,8'h51,8'h4F,8'h41})|
	    (curr_cycle == 4)&(curr_ir inside {8'h59,8'h3D,8'hE7,8'h39,8'h1D,8'h07,8'hFD,8'h5D,8'h7D,8'hF9,8'hBD,8'h19,8'h79,8'hB9,8'h47})|
	    (curr_cycle == 7)&(curr_ir inside {8'h13,8'h03,8'hF3,8'hE3,8'h53,8'h43})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'h4D,8'h6D,8'hF5,8'hAD,8'h15,8'h75,8'h55,8'h2D,8'hB5,8'h35,8'h0D})|
	    (curr_cycle == 1)&(curr_ir inside {8'h4A,8'hE9,8'h09,8'hEB,8'h0A,8'h69,8'h49,8'hA9,8'h29,8'h2A,8'h6A,8'h8A,8'h98})|
	    (curr_cycle == 2)&(curr_ir inside {8'hE5,8'h45,8'h05,8'hA5,8'h25,8'h65})|
	    (curr_cycle == 6)&(curr_ir inside {8'hFF,8'h5F,8'hFB,8'h5B,8'h1F,8'h1B}))
		next_p[Z_bit] = next_a == 0;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h0F,8'hF1,8'h71,8'hE1,8'hF7,8'h57,8'hEF,8'h01,8'hB1,8'h31,8'hA1,8'h21,8'h17,8'h11,8'h61,8'h51,8'h4F,8'h41})|
	    (curr_cycle == 4)&(curr_ir inside {8'h59,8'h3D,8'hE7,8'h39,8'h1D,8'h07,8'hFD,8'h5D,8'h7D,8'hF9,8'hBD,8'h19,8'h79,8'hB9,8'h47})|
	    (curr_cycle == 7)&(curr_ir inside {8'h13,8'h03,8'hF3,8'hE3,8'h53,8'h43})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'h4D,8'h6D,8'hF5,8'hAD,8'h15,8'h75,8'h55,8'h2D,8'hB5,8'h35,8'h0D})|
	    (curr_cycle == 1)&(curr_ir inside {8'h4A,8'hE9,8'h09,8'hEB,8'h0A,8'h69,8'h49,8'hA9,8'h29,8'h2A,8'h6A,8'h8A,8'h98})|
	    (curr_cycle == 2)&(curr_ir inside {8'hE5,8'h45,8'h05,8'hA5,8'h25,8'h65})|
	    (curr_cycle == 6)&(curr_ir inside {8'hFF,8'h5F,8'hFB,8'h5B,8'h1F,8'h1B}))
		next_p[N_bit] = next_a[7];
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h22,8'h52,8'h82,8'h42,8'h02,8'hB2,8'hD2,8'h32,8'h92,8'hF2,8'h72,8'h62,8'h12}))
		next_cycle = -1;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h0F,8'h76,8'h37,8'hD6,8'h2E,8'h0E,8'h57,8'h56,8'hF6,8'h6E,8'h16,8'h4F,8'h17,8'h2F,8'hEE,8'hCE,8'h36,8'h4E})|
	    (curr_cycle == 5)&(curr_ir inside {8'h03,8'h33,8'h53,8'h43,8'h23,8'h13})|
	    (curr_cycle == 4)&(curr_ir inside {8'h5F,8'hDE,8'hFE,8'h5B,8'h5E,8'h1F,8'h1B,8'h3E,8'h7E,8'h3F,8'h1E,8'h3B})|
	    (curr_cycle == 2)&(curr_ir inside {8'h46,8'h06,8'h07,8'h26,8'h27,8'h66,8'hE6,8'h47,8'hC6}))
		alu_in_lhs = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h0F,8'h76,8'h37,8'h2E,8'h0E,8'h57,8'h56,8'h6E,8'h16,8'h4F,8'h17,8'h2F,8'h36,8'h4E})|
	    (curr_cycle == 5)&(curr_ir inside {8'h03,8'h33,8'h53,8'h43,8'h23,8'h13})|
	    (curr_cycle == 4)&(curr_ir inside {8'h5F,8'h5B,8'h5E,8'h1F,8'h1B,8'h3E,8'h7E,8'h3F,8'h1E,8'h3B})|
	    (curr_cycle == 1)&(curr_ir inside {8'h4A,8'h0A,8'h2A,8'h6A})|
	    (curr_cycle == 2)&(curr_ir inside {8'h46,8'h06,8'h07,8'h26,8'h27,8'h66,8'h47}))
		alu_in_rhs = 0;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h8C,8'h27,8'hC7,8'h94,8'hE6,8'hC6,8'h07,8'h8D,8'h96,8'h66,8'h97,8'h26,8'hE7,8'h46,8'h06,8'h8F,8'h95,8'h20,8'h47,8'h8E})|
	    (curr_cycle == 6)&(curr_ir inside {8'hFE,8'hFF,8'hDE,8'hF3,8'hDF,8'hC3,8'h53,8'h23,8'h5E,8'hE3,8'h33,8'h3E,8'h7E,8'hFB,8'h03,8'hDB,8'h43,8'h13,8'h1E,8'hD3})|
	    (curr_cycle == 4)&(curr_ir inside {8'hE7,8'h46,8'hD7,8'h37,8'hD6,8'h4E,8'hF6,8'hC6,8'h9D,8'h17,8'h4F,8'h36,8'h76,8'h0E,8'hCF,8'h20,8'hEE,8'h16,8'hCE,8'hF7,8'h26,8'h99,8'h66,8'hC7,8'h2E,8'h6E,8'hE6,8'h2F,8'h06,8'hEF,8'h0F,8'h56,8'h57})|
	    (curr_cycle == 5)&(curr_ir inside {8'h3E,8'h0E,8'hDB,8'h6E,8'hCF,8'h1F,8'h83,8'h5E,8'hEF,8'h2E,8'h3B,8'h5F,8'h91,8'hFF,8'hDE,8'h4E,8'h1B,8'h1E,8'h56,8'hDF,8'hF6,8'h81,8'h36,8'h76,8'hF7,8'hD6,8'hD7,8'h3F,8'h7E,8'h16,8'h5B,8'hFE,8'hEE,8'hFB,8'hCE})|
	    (curr_cycle == 7)&(curr_ir inside {8'hE3,8'hD3,8'hF3,8'hC3})|
	    (curr_cycle == 2)&(curr_ir inside {8'h87,8'h85,8'h86,8'h84,8'h08,8'h48})|
	    (curr_cycle == 1)&(curr_ir == 8'hCB))
		G_rdwr = 0;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h26,8'h27,8'h07,8'h06})|
	    (curr_cycle == 5)&(curr_ir inside {8'h1B,8'h1E,8'h3E,8'h3F,8'h2E,8'h0E,8'h3B,8'h16,8'h36,8'h1F})|
	    (curr_cycle == 4)&(curr_ir inside {8'h17,8'h16,8'h2F,8'h06,8'h36,8'h26,8'h37,8'h0F,8'h2E,8'h0E})|
	    (curr_cycle == 6)&(curr_ir inside {8'h23,8'h13,8'h03,8'h33,8'h1E,8'h3E}))
		G_wr_data = alu_rol;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h27,8'h07})|
	    (curr_cycle == 5)&(curr_ir inside {8'h1B,8'h3F,8'h2E,8'h0E,8'h3B,8'h16,8'h36,8'h1F})|
	    (curr_cycle == 4)&(curr_ir inside {8'h17,8'h2F,8'h06,8'h26,8'h37,8'h0F})|
	    (curr_cycle == 6)&(curr_ir inside {8'h23,8'h13,8'h03,8'h33,8'h1E,8'h3E})|
	    (curr_cycle == 1)&(curr_ir inside {8'h0A,8'h2A}))
		next_p[C_bit] = alu_rol_c;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hD1,8'hD7,8'hC7,8'hA5,8'h27,8'hB1,8'h66,8'h44,8'h54,8'hF5,8'h34,8'hD3,8'h24,8'h33,8'h57,8'h94,8'hF6,8'h47,8'h25,8'h31,8'h95,8'hB7,8'h85,8'h56,8'hC4,8'h15,8'hC5,8'h86,8'h14,8'hA7,8'h91,8'h97,8'h87,8'hE6,8'h65,8'hC6,8'h17,8'h11,8'h75,8'h16,8'h53,8'hB4,8'h55,8'hE7,8'hF4,8'hB5,8'hB6,8'h07,8'h13,8'h46,8'hE5,8'h36,8'h51,8'hA6,8'h84,8'h06,8'h45,8'hE4,8'hF1,8'hD4,8'h96,8'hF7,8'hD5,8'h76,8'h26,8'h35,8'h04,8'h37,8'h74,8'hB3,8'h64,8'hD6,8'h05,8'hF3,8'h71,8'hA4}))
		next_adh = 0;
	
	if ((curr_cycle == 4)&(curr_ir inside {8'h2F,8'h06,8'h26,8'h37})|
	    (curr_cycle == 6)&(curr_ir inside {8'h23,8'h33,8'h1E,8'h3E})|
	    (curr_cycle == 5)&(curr_ir inside {8'h3F,8'h16,8'h36,8'h2E,8'h0E,8'h3B})|
	    (curr_cycle == 3)&(curr_ir == 8'h27))
		next_p[Z_bit] = alu_rol == 0;
	
	if ((curr_cycle == 4)&(curr_ir inside {8'h2F,8'h06,8'h26,8'h37})|
	    (curr_cycle == 6)&(curr_ir inside {8'h23,8'h33,8'h1E,8'h3E})|
	    (curr_cycle == 5)&(curr_ir inside {8'h3F,8'h16,8'h36,8'h2E,8'h0E,8'h3B})|
	    (curr_cycle == 3)&(curr_ir == 8'h27))
		next_p[N_bit] = alu_rol[7];
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h28,8'h60,8'h68,8'h20,8'h40})|
	    (curr_cycle == 2)&(curr_ir inside {8'h68,8'h20,8'h40,8'h08,8'h60,8'h28,8'h48})|
	    (curr_cycle == 4)&(curr_ir inside {8'h40,8'h20,8'h60})|
	    (curr_cycle == 5)&(curr_ir == 8'h40))
		G_addr = curr_sp;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h08))
		G_wr_data = curr_p | B_mask;
	
	if ((curr_cycle == 3)&(curr_ir == 8'h20)|
	    (curr_cycle == 4)&(curr_ir == 8'h20)|
	    (curr_cycle == 2)&(curr_ir inside {8'h08,8'h48}))
		next_s = curr_s - 1;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h2A,8'h0A}))
		next_a = alu_rol;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h0F,8'hAE,8'h8C,8'hED,8'h4D,8'hAF,8'hEF,8'h2E,8'h0C,8'h6D,8'h0E,8'hCF,8'hEC,8'h6E,8'hAD,8'h4F,8'h2D,8'hCC,8'h8D,8'h8E,8'h2F,8'hCD,8'hEE,8'hCE,8'hAC,8'h8F,8'h2C,8'h0D,8'h4E}))
		{next_pch, next_pcl} = curr_pc;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h10))
		next_cycle = (curr_p[N_bit] ? 0 : (curr_cycle + 1));
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h70,8'h30,8'h50,8'h10,8'hB0,8'hD0,8'h90,8'hF0}))
		{next_adh, next_adl} = {8'h00, G_rd_data} + (curr_pc + 1) - {7'h00, G_rd_data[7], 8'h00};
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h10,8'hD0,8'h30,8'h50,8'hF0,8'hB0,8'h70,8'h90}))
		G_addr = {curr_pch, curr_adl};
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h10,8'hD0,8'h30,8'h50,8'hF0,8'hB0,8'h70,8'h90}))
		{next_pch, next_pcl} = curr_ad;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h10,8'hD0,8'h30,8'h50,8'hF0,8'hB0,8'h70,8'h90}))
		next_cycle = ((curr_adh != curr_pch) ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h71,8'hB3,8'h13,8'hD1,8'h91,8'hB1,8'h33,8'hD3,8'hF3,8'h11,8'h53,8'h31,8'h51,8'hF1}))
		next_adl = curr_adl + 1;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hFF,8'h5F,8'h39,8'h6C,8'hFE,8'h5C,8'hFB,8'hD9,8'hBC,8'h5B,8'h5E,8'hDE,8'h1D,8'h1F,8'hBE,8'h5D,8'hFC,8'hBF,8'h99,8'h1B,8'hFD,8'h1C,8'h3F,8'h7C,8'h7D,8'h1E,8'hF9,8'h3E,8'hDD,8'hBD,8'h3B,8'h7E,8'hDB,8'h19,8'h59,8'hDF,8'h79,8'hB9,8'h3D,8'h9D,8'hDC,8'h3C})|
	    (curr_cycle == 3)&(curr_ir inside {8'h71,8'hD1,8'hD3,8'hB1,8'h33,8'h53,8'h31,8'h91,8'h11,8'h13,8'hF1,8'h51,8'hF3,8'hB3}))
		next_bah = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h71,8'hD1,8'hD3,8'hB1,8'h33,8'h53,8'h31,8'h91,8'h11,8'h13,8'hF1,8'h51,8'hF3,8'hB3})|
	    (curr_cycle == 2)&(curr_ir inside {8'h39,8'hFB,8'hD9,8'h5B,8'hBE,8'hBF,8'h99,8'h1B,8'hF9,8'h3B,8'h19,8'h59,8'h79,8'hB9,8'hDB}))
		{next_adh, next_adl} = {G_rd_data, curr_bal}  + {8'h00, curr_y};
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hFF,8'h5F,8'h39,8'h5C,8'hFB,8'hD9,8'hBC,8'h5B,8'h1D,8'h1F,8'hBE,8'h5D,8'hFC,8'hBF,8'h1B,8'hFD,8'h1C,8'h3F,8'h7C,8'h7D,8'hF9,8'hDD,8'hBD,8'h3B,8'hDB,8'h19,8'h59,8'hDF,8'h79,8'hB9,8'h3D,8'hDC,8'h3C})|
	    (curr_cycle == 3)&(curr_ir inside {8'h71,8'hD1,8'hD3,8'hB1,8'h33,8'h53,8'h31,8'h11,8'h13,8'hF1,8'h51,8'hF3,8'hB3}))
		next_cycle = curr_cycle + 1 + ((next_bah != next_adh) ? 0 : 1);
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h3E,8'hBE,8'h7D,8'hBF,8'h1C,8'h99,8'h3F,8'h1E,8'hF9,8'hDD,8'h7E,8'hBD,8'h7C,8'h3B,8'h19,8'h59,8'h79,8'hB9,8'hDF,8'h5F,8'h3D,8'h3C,8'hDB,8'h39,8'h9D,8'hDE,8'hFE,8'hDC,8'h1D,8'hFF,8'h5C,8'hD9,8'h5E,8'h1F,8'hFB,8'hBC,8'h5D,8'h5B,8'hFC,8'h1B,8'hFD})|
	    (curr_cycle == 4)&(curr_ir inside {8'h53,8'h13,8'h11,8'h51,8'hF1,8'hB3,8'hF3,8'hD1,8'h71,8'hD3,8'hB1,8'h33,8'h31,8'h91}))
		G_addr = {curr_bah, curr_adl};
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h75,8'h16,8'hB4,8'h55,8'h17,8'hB5,8'h74,8'hF4,8'h35,8'h36,8'hD5,8'h76,8'h37,8'hD4,8'hF7,8'hD7,8'hD6,8'h56,8'h34,8'h95,8'h54,8'h94,8'h57,8'hF6,8'hF5,8'h14,8'h15}))
		next_adl = curr_adl + curr_x;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h18))
		next_p[C_bit] = 0;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hFF,8'h5F,8'hFE,8'h5C,8'hBC,8'h5E,8'hDE,8'h1D,8'h1F,8'h5D,8'hFC,8'hFD,8'h1C,8'h3F,8'h7C,8'h7D,8'h1E,8'h3E,8'hDD,8'hBD,8'h7E,8'hDF,8'h3D,8'h9D,8'hDC,8'h3C}))
		{next_adh, next_adl} = {G_rd_data, curr_bal}  + {8'h00, curr_x};
	
	if ((curr_cycle == 3)&(curr_ir == 8'h20))
		G_wr_data = curr_pch;
	
	if ((curr_cycle == 4)&(curr_ir == 8'h20))
		G_wr_data = curr_pcl;
	
	if ((curr_cycle == 5)&(curr_ir == 8'h20)|
	    (curr_cycle == 2)&(curr_ir == 8'h4C)|
	    (curr_cycle == 4)&(curr_ir == 8'h6C))
		{next_pch, next_pcl} = next_ad;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h25)|
	    (curr_cycle == 5)&(curr_ir inside {8'h2F,8'h37,8'h21,8'h31})|
	    (curr_cycle == 3)&(curr_ir inside {8'h35,8'h2D})|
	    (curr_cycle == 4)&(curr_ir inside {8'h39,8'h3D,8'h27})|
	    (curr_cycle == 7)&(curr_ir inside {8'h23,8'h33})|
	    (curr_cycle == 6)&(curr_ir inside {8'h3B,8'h3F})|
	    (curr_cycle == 1)&(curr_ir == 8'h29))
		next_a = alu_and;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF1,8'h71,8'hE1,8'hF3,8'hE3,8'h33,8'h61,8'h23})|
	    (curr_cycle == 3)&(curr_ir inside {8'hF7,8'hED,8'h76,8'h37,8'hEF,8'h2E,8'h6D,8'hF5,8'h6E,8'h75,8'h2F,8'h36})|
	    (curr_cycle == 2)&(curr_ir inside {8'hE7,8'hE5,8'h26,8'h27,8'h66,8'h65})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE9,8'hEB,8'h69,8'h2A,8'h6A})|
	    (curr_cycle == 4)&(curr_ir inside {8'hFF,8'hFB,8'hFD,8'h7D,8'hF9,8'h3E,8'h7E,8'h3F,8'h79,8'h3B}))
		alu_in_c = curr_p[C_bit];
	
	if ((curr_cycle == 2)&(curr_ir == 8'h24)|
	    (curr_cycle == 3)&(curr_ir == 8'h2C))
		next_p[Z_bit] = alu_and == 0;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h24)|
	    (curr_cycle == 3)&(curr_ir == 8'h2C))
		next_p[V_bit] = G_rd_data[6];
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h68,8'h2C})|
	    (curr_cycle == 2)&(curr_ir == 8'h24))
		next_p[N_bit] = G_rd_data[7];
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h68,8'h40,8'h60,8'h28})|
	    (curr_cycle == 4)&(curr_ir == 8'h40)|
	    (curr_cycle == 3)&(curr_ir inside {8'h60,8'h40}))
		next_s = curr_s + 1;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h28,8'h40}))
		next_p = G_rd_data;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h30))
		next_cycle = (curr_p[N_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'h38))
		next_p[C_bit] = 1;
	
	if ((curr_cycle == 4)&(curr_ir == 8'h40)|
	    (curr_cycle == 3)&(curr_ir == 8'h60))
		next_pcl = G_rd_data;
	
	if ((curr_cycle == 5)&(curr_ir == 8'h40)|
	    (curr_cycle == 4)&(curr_ir == 8'h60))
		next_pch = G_rd_data;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h51,8'h4F,8'h41,8'h57})|
	    (curr_cycle == 1)&(curr_ir == 8'h49)|
	    (curr_cycle == 4)&(curr_ir inside {8'h59,8'h5D,8'h47})|
	    (curr_cycle == 3)&(curr_ir inside {8'h4D,8'h55})|
	    (curr_cycle == 7)&(curr_ir inside {8'h43,8'h53})|
	    (curr_cycle == 2)&(curr_ir == 8'h45)|
	    (curr_cycle == 6)&(curr_ir inside {8'h5B,8'h5F}))
		next_a = alu_xor;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h4E,8'h56,8'h7E,8'h5F,8'h6E,8'h5B,8'h5E,8'h76})|
	    (curr_cycle == 6)&(curr_ir inside {8'h53,8'h43,8'h5E,8'h7E})|
	    (curr_cycle == 3)&(curr_ir inside {8'h66,8'h47,8'h46})|
	    (curr_cycle == 4)&(curr_ir inside {8'h4F,8'h46,8'h76,8'h4E,8'h66,8'h56,8'h57,8'h6E}))
		G_wr_data = alu_ror;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h4E,8'h56,8'h5F,8'h6E,8'h76,8'h5B})|
	    (curr_cycle == 4)&(curr_ir inside {8'h4F,8'h46,8'h66,8'h57})|
	    (curr_cycle == 6)&(curr_ir inside {8'h43,8'h53,8'h7E,8'h5E})|
	    (curr_cycle == 1)&(curr_ir inside {8'h6A,8'h4A})|
	    (curr_cycle == 3)&(curr_ir == 8'h47))
		next_p[C_bit] = alu_ror_c;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h4E,8'h56,8'h6E,8'h76})|
	    (curr_cycle == 4)&(curr_ir inside {8'h46,8'h66})|
	    (curr_cycle == 6)&(curr_ir inside {8'h7E,8'h5E}))
		next_p[Z_bit] = alu_ror == 0;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h4E,8'h56,8'h6E,8'h76})|
	    (curr_cycle == 4)&(curr_ir inside {8'h46,8'h66})|
	    (curr_cycle == 6)&(curr_ir inside {8'h7E,8'h5E}))
		next_p[N_bit] = alu_ror[7];
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h85,8'h48})|
	    (curr_cycle == 3)&(curr_ir inside {8'h95,8'h8D})|
	    (curr_cycle == 4)&(curr_ir inside {8'h99,8'h9D})|
	    (curr_cycle == 5)&(curr_ir inside {8'h91,8'h81}))
		G_wr_data = curr_a;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h4A,8'h6A}))
		next_a = alu_ror;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h50))
		next_cycle = (curr_p[V_bit] ? 0 : (curr_cycle + 1));
	
	if ((curr_cycle == 1)&(curr_ir == 8'h58))
		next_p[I_bit] = 0;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h75,8'h6D})|
	    (curr_cycle == 5)&(curr_ir inside {8'h71,8'h61})|
	    (curr_cycle == 2)&(curr_ir == 8'h65)|
	    (curr_cycle == 1)&(curr_ir == 8'h69)|
	    (curr_cycle == 4)&(curr_ir inside {8'h79,8'h7D}))
		next_a = alu_adc[7:0];
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h75,8'h6D})|
	    (curr_cycle == 5)&(curr_ir inside {8'h71,8'h61})|
	    (curr_cycle == 2)&(curr_ir == 8'h65)|
	    (curr_cycle == 1)&(curr_ir == 8'h69)|
	    (curr_cycle == 4)&(curr_ir inside {8'h79,8'h7D}))
		next_p[C_bit] = alu_adc_c;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h75,8'h6D})|
	    (curr_cycle == 5)&(curr_ir inside {8'h71,8'h61})|
	    (curr_cycle == 2)&(curr_ir == 8'h65)|
	    (curr_cycle == 1)&(curr_ir == 8'h69)|
	    (curr_cycle == 4)&(curr_ir inside {8'h79,8'h7D}))
		next_p[V_bit] = alu_adc_v;
	
	if ((curr_cycle == 4)&(curr_ir inside {8'hBD,8'hBF,8'hB9})|
	    (curr_cycle == 1)&(curr_ir inside {8'hA9,8'hAB})|
	    (curr_cycle == 3)&(curr_ir inside {8'h68,8'hAF,8'hB7,8'hAD,8'hB5})|
	    (curr_cycle == 2)&(curr_ir inside {8'hA5,8'hA7})|
	    (curr_cycle == 5)&(curr_ir inside {8'hA1,8'hB1,8'hB3,8'hA3}))
		next_a = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir == 8'h68))
		next_p[Z_bit] = G_rd_data == 0;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h70))
		next_cycle = (curr_p[V_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'h78))
		next_p[I_bit] = 1;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h8F,8'h97})|
	    (curr_cycle == 5)&(curr_ir == 8'h83)|
	    (curr_cycle == 1)&(curr_ir == 8'hCB)|
	    (curr_cycle == 2)&(curr_ir == 8'h87))
		alu_in_rhs = curr_x;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h8F,8'h97})|
	    (curr_cycle == 5)&(curr_ir == 8'h83)|
	    (curr_cycle == 1)&(curr_ir == 8'hCB)|
	    (curr_cycle == 2)&(curr_ir == 8'h87))
		G_wr_data = alu_and;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h84)|
	    (curr_cycle == 3)&(curr_ir inside {8'h8C,8'h94}))
		G_wr_data = curr_y;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h96,8'h8E})|
	    (curr_cycle == 2)&(curr_ir == 8'h86))
		G_wr_data = curr_x;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h88))
		next_y = curr_y - 1;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hA4)|
	    (curr_cycle == 1)&(curr_ir inside {8'hA8,8'hC8,8'hA0,8'h88})|
	    (curr_cycle == 3)&(curr_ir inside {8'hAC,8'hB4})|
	    (curr_cycle == 4)&(curr_ir == 8'hBC))
		next_p[Z_bit] = next_y == 0;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hA4)|
	    (curr_cycle == 1)&(curr_ir inside {8'hA8,8'hC8,8'hA0,8'h88})|
	    (curr_cycle == 3)&(curr_ir inside {8'hAC,8'hB4})|
	    (curr_cycle == 4)&(curr_ir == 8'hBC))
		next_p[N_bit] = next_y[7];
	
	if ((curr_cycle == 1)&(curr_ir == 8'h8A))
		next_a = curr_x;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h90))
		next_cycle = (curr_p[C_bit] ? 0 : (curr_cycle + 1));
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hB6,8'hB7,8'h96,8'h97}))
		next_adl = curr_adl + curr_y;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h98))
		next_a = curr_y;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h9A))
		next_s = curr_x;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hA4)|
	    (curr_cycle == 3)&(curr_ir inside {8'hAC,8'hB4})|
	    (curr_cycle == 4)&(curr_ir == 8'hBC)|
	    (curr_cycle == 1)&(curr_ir == 8'hA0))
		next_y = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hAE,8'hAF,8'hB6,8'hB7})|
	    (curr_cycle == 4)&(curr_ir inside {8'hBE,8'hBF})|
	    (curr_cycle == 1)&(curr_ir inside {8'hA2,8'hAB})|
	    (curr_cycle == 2)&(curr_ir inside {8'hA7,8'hA6})|
	    (curr_cycle == 5)&(curr_ir inside {8'hB3,8'hA3}))
		next_x = G_rd_data;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hBA,8'hE8,8'hA2,8'hCA,8'hAA,8'hAB})|
	    (curr_cycle == 3)&(curr_ir inside {8'hAE,8'hAF,8'hB6,8'hB7})|
	    (curr_cycle == 4)&(curr_ir inside {8'hBE,8'hBF})|
	    (curr_cycle == 2)&(curr_ir inside {8'hA7,8'hA6})|
	    (curr_cycle == 5)&(curr_ir inside {8'hB3,8'hA3}))
		next_p[N_bit] = next_x[7];
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hBA,8'hE8,8'hA2,8'hCA,8'hAA,8'hAB})|
	    (curr_cycle == 3)&(curr_ir inside {8'hAE,8'hAF,8'hB6,8'hB7})|
	    (curr_cycle == 4)&(curr_ir inside {8'hBE,8'hBF})|
	    (curr_cycle == 2)&(curr_ir inside {8'hA7,8'hA6})|
	    (curr_cycle == 5)&(curr_ir inside {8'hB3,8'hA3}))
		next_p[Z_bit] = next_x == 0;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hA8))
		next_y = curr_a;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hAA))
		next_x = curr_a;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hB0))
		next_cycle = (curr_p[C_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'hB8))
		next_p[V_bit] = 0;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hBA))
		next_x = curr_s;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hC4)|
	    (curr_cycle == 1)&(curr_ir == 8'hC0)|
	    (curr_cycle == 3)&(curr_ir == 8'hCC))
		alu_in_lhs = curr_y;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE4,8'hC4})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD5,8'hC7,8'hEC,8'hCC,8'hCD})|
	    (curr_cycle == 4)&(curr_ir inside {8'hD9,8'hD7,8'hDD,8'hCF})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE0,8'hC0,8'hC9})|
	    (curr_cycle == 5)&(curr_ir inside {8'hD1,8'hDF,8'hDB,8'hC1})|
	    (curr_cycle == 6)&(curr_ir inside {8'hD3,8'hC3}))
		next_p[Z_bit] = alu_cmp_z;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE4,8'hC4})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD5,8'hC7,8'hEC,8'hCC,8'hCD})|
	    (curr_cycle == 4)&(curr_ir inside {8'hD9,8'hD7,8'hDD,8'hCF})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE0,8'hC0,8'hC9})|
	    (curr_cycle == 5)&(curr_ir inside {8'hD1,8'hDF,8'hDB,8'hC1})|
	    (curr_cycle == 6)&(curr_ir inside {8'hD3,8'hC3}))
		next_p[N_bit] = alu_cmp_n;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE4,8'hC4})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD5,8'hC7,8'hEC,8'hCC,8'hCD})|
	    (curr_cycle == 4)&(curr_ir inside {8'hD9,8'hD7,8'hDD,8'hCF})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE0,8'hC0,8'hC9})|
	    (curr_cycle == 5)&(curr_ir inside {8'hD1,8'hDF,8'hDB,8'hC1})|
	    (curr_cycle == 6)&(curr_ir inside {8'hD3,8'hC3}))
		next_p[C_bit] = alu_cmp_c;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hD7,8'hCF})|
	    (curr_cycle == 2)&(curr_ir == 8'hC7)|
	    (curr_cycle == 5)&(curr_ir inside {8'hC3,8'hD3})|
	    (curr_cycle == 4)&(curr_ir inside {8'hDF,8'hDB}))
		alu_in_rhs = G_rd_data - 1;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF7,8'hD7,8'hEF,8'hDF,8'hDB,8'hCF,8'hFF,8'hFB})|
	    (curr_cycle == 6)&(curr_ir inside {8'hDB,8'hFF,8'hFB,8'hF3,8'hE3,8'hD3,8'hDF,8'hC3})|
	    (curr_cycle == 4)&(curr_ir inside {8'hE7,8'hD7,8'hF7,8'hEF,8'hC7,8'hCF})|
	    (curr_cycle == 7)&(curr_ir inside {8'hF3,8'hE3,8'hD3,8'hC3})|
	    (curr_cycle == 3)&(curr_ir inside {8'hC7,8'hE7}))
		G_wr_data = alu_out_rhs;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hCE,8'hD6})|
	    (curr_cycle == 4)&(curr_ir == 8'hDE)|
	    (curr_cycle == 2)&(curr_ir == 8'hC6))
		alu_in_rhs = 8'hFF;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hDE,8'hFE,8'hEE,8'hD6,8'hF6,8'hCE})|
	    (curr_cycle == 4)&(curr_ir inside {8'hF6,8'hCE,8'hD6,8'hEE,8'hC6,8'hE6})|
	    (curr_cycle == 6)&(curr_ir inside {8'hDE,8'hFE})|
	    (curr_cycle == 3)&(curr_ir inside {8'hC6,8'hE6}))
		G_wr_data = alu_adc[7:0];
	
	if ((curr_cycle == 6)&(curr_ir inside {8'hDE,8'hFE})|
	    (curr_cycle == 5)&(curr_ir inside {8'hEE,8'hD6,8'hF6,8'hCE})|
	    (curr_cycle == 4)&(curr_ir inside {8'hC6,8'hE6}))
		next_p[Z_bit] = alu_adc[7:0] == 0;
	
	if ((curr_cycle == 6)&(curr_ir inside {8'hDE,8'hFE})|
	    (curr_cycle == 5)&(curr_ir inside {8'hEE,8'hD6,8'hF6,8'hCE})|
	    (curr_cycle == 4)&(curr_ir inside {8'hC6,8'hE6}))
		next_p[N_bit] = alu_adc[7];
	
	if ((curr_cycle == 1)&(curr_ir == 8'hC8))
		next_y = curr_y + 1;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hCA))
		next_x = curr_x - 1;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hD0))
		next_cycle = (curr_p[Z_bit] ? 0 : (curr_cycle + 1));
	
	if ((curr_cycle == 1)&(curr_ir == 8'hD8))
		next_p[D_bit] = 0;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hE4)|
	    (curr_cycle == 3)&(curr_ir == 8'hEC)|
	    (curr_cycle == 1)&(curr_ir == 8'hE0))
		alu_in_lhs = curr_x;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF1,8'hEF,8'hE1,8'hF7})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'hF5})|
	    (curr_cycle == 1)&(curr_ir inside {8'hEB,8'hE9})|
	    (curr_cycle == 4)&(curr_ir inside {8'hFD,8'hE7,8'hF9})|
	    (curr_cycle == 6)&(curr_ir inside {8'hFB,8'hFF})|
	    (curr_cycle == 7)&(curr_ir inside {8'hE3,8'hF3})|
	    (curr_cycle == 2)&(curr_ir == 8'hE5))
		next_a = alu_sbc[7:0];
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF1,8'hEF,8'hE1,8'hF7})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'hF5})|
	    (curr_cycle == 1)&(curr_ir inside {8'hEB,8'hE9})|
	    (curr_cycle == 4)&(curr_ir inside {8'hFD,8'hE7,8'hF9})|
	    (curr_cycle == 6)&(curr_ir inside {8'hFB,8'hFF})|
	    (curr_cycle == 7)&(curr_ir inside {8'hE3,8'hF3})|
	    (curr_cycle == 2)&(curr_ir == 8'hE5))
		next_p[C_bit] = alu_sbc_c;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF1,8'hEF,8'hE1,8'hF7})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'hF5})|
	    (curr_cycle == 1)&(curr_ir inside {8'hEB,8'hE9})|
	    (curr_cycle == 4)&(curr_ir inside {8'hFD,8'hE7,8'hF9})|
	    (curr_cycle == 6)&(curr_ir inside {8'hFB,8'hFF})|
	    (curr_cycle == 7)&(curr_ir inside {8'hE3,8'hF3})|
	    (curr_cycle == 2)&(curr_ir == 8'hE5))
		next_p[V_bit] = alu_sbc_v;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hF7,8'hEF})|
	    (curr_cycle == 4)&(curr_ir inside {8'hFB,8'hFF})|
	    (curr_cycle == 2)&(curr_ir == 8'hE7)|
	    (curr_cycle == 5)&(curr_ir inside {8'hF3,8'hE3}))
		alu_in_rhs = G_rd_data + 1;
	
	if ((curr_cycle == 4)&(curr_ir == 8'hFE)|
	    (curr_cycle == 3)&(curr_ir inside {8'hEE,8'hF6})|
	    (curr_cycle == 2)&(curr_ir == 8'hE6))
		alu_in_rhs = 8'h01;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hE8))
		next_x = curr_x + 1;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hF0))
		next_cycle = (curr_p[Z_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'hF8))
		next_p[D_bit] = 1;
	
	if ((curr_cycle == 0))
		next_ir = G_rd_data;
	