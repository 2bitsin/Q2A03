
	if ((curr_cycle == 1)&(curr_ir inside {8'hD1,8'h22,8'h28,8'h18,8'h5A,8'h50,8'h34,8'hF5,8'h88,8'h95,8'h01,8'h85,8'hC5,8'h86,8'h14,8'hD0,8'h65,8'h21,8'h11,8'hC0,8'hC6,8'hB4,8'h49,8'hCD,8'h20,8'hEE,8'hA0,8'h8E,8'h84,8'hCE,8'h68,8'h2C,8'hB2,8'hA2,8'hC9,8'h35,8'h10,8'hED,8'h2E,8'hFA,8'h70,8'h66,8'h54,8'h4A,8'h0E,8'h94,8'h25,8'hA1,8'hB8,8'h09,8'h1A,8'hF8,8'h6E,8'h92,8'hE6,8'h2D,8'h48,8'h69,8'h55,8'h6C,8'hA9,8'hB6,8'h8D,8'hAC,8'h9A,8'h90,8'h06,8'hE4,8'hDA,8'hF1,8'h42,8'hC8,8'h38,8'hD5,8'h6A,8'h26,8'h41,8'h58,8'h4E,8'h05,8'h12,8'h98,8'hA5,8'h89,8'h60,8'h24,8'h6D,8'hEA,8'hE0,8'h31,8'h4C,8'h08,8'hC4,8'h3A,8'h15,8'h30,8'h40,8'h7A,8'h91,8'hF2,8'h75,8'h82,8'hB5,8'hCC,8'hD2,8'hC2,8'h2A,8'hB0,8'hA6,8'hF0,8'hD4,8'h80,8'h76,8'h32,8'h4D,8'hE1,8'h74,8'h64,8'h71,8'hAE,8'hA4,8'h0C,8'hB1,8'h02,8'h44,8'hE9,8'hF6,8'h72,8'hEC,8'h62,8'h56,8'h0A,8'hAD,8'hAA,8'h81,8'h16,8'hF4,8'hC1,8'hE2,8'hE8,8'hD8,8'h29,8'h46,8'h61,8'h36,8'h51,8'h0D,8'hE5,8'h78,8'h45,8'h52,8'hA8,8'h96,8'h8C,8'h04,8'h8A,8'hD6,8'hCA,8'hBA})|
	    (curr_cycle == 2)&(curr_ir inside {8'h6C,8'h8D,8'hAC,8'h4E,8'h0C,8'h6D,8'h4C,8'hEC,8'hCC,8'hCE,8'h0D,8'h4D,8'hAE,8'h8E,8'hEE,8'h8C,8'h2C,8'hED,8'h2E,8'h6E,8'h0E,8'hCD,8'h2D,8'hAD})|
	    (curr_cycle == 3)&(curr_ir inside {8'h70,8'h50,8'h10,8'hB0,8'h90,8'hF0,8'h30,8'hD0})|
	    (curr_cycle == 5)&(curr_ir inside {8'h60,8'h20})|
	    (curr_cycle == 0))
		G_addr = curr_pc;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h5A,8'h65,8'hCD,8'h49,8'h8E,8'hCE,8'hB2,8'hA2,8'h2E,8'h25,8'hA1,8'h09,8'h6E,8'hE6,8'h2D,8'h6C,8'hAC,8'h90,8'hF1,8'h38,8'hD5,8'h41,8'h05,8'hE0,8'h4C,8'hC4,8'h40,8'h30,8'h91,8'h75,8'hB5,8'h80,8'h74,8'h64,8'hA4,8'h0C,8'hE9,8'hF4,8'hE8,8'hD8,8'h52,8'h88,8'h86,8'h14,8'hC6,8'hFA,8'h66,8'h4A,8'h0E,8'h55,8'hB6,8'h9A,8'h06,8'hDA,8'h42,8'h26,8'hA5,8'h89,8'h6D,8'hEA,8'h31,8'h3A,8'h15,8'h7A,8'hF2,8'hE1,8'h4D,8'hAE,8'h44,8'hEC,8'hAD,8'h81,8'hC1,8'hE2,8'h29,8'h0D,8'h78,8'hA8,8'h8C,8'h04,8'hD1,8'h28,8'h18,8'hF5,8'hD0,8'hC0,8'hB4,8'h20,8'h70,8'h54,8'h94,8'h1A,8'h92,8'hE4,8'hC8,8'h6A,8'h4E,8'h12,8'h82,8'hD2,8'hC2,8'h2A,8'hA6,8'h32,8'h71,8'hB1,8'hF6,8'h72,8'h62,8'h56,8'h0A,8'hE5,8'h61,8'h51,8'h45,8'h96,8'h8A,8'hD6,8'hCA,8'hBA,8'h22,8'h50,8'h34,8'h95,8'h85,8'h01,8'hC5,8'h21,8'h11,8'hEE,8'hA0,8'h84,8'h68,8'h2C,8'hC9,8'h35,8'h10,8'hED,8'hB8,8'hF8,8'h48,8'h69,8'hA9,8'h8D,8'h58,8'h98,8'h60,8'h24,8'h08,8'hCC,8'hB0,8'hF0,8'hD4,8'h76,8'h02,8'hAA,8'h16,8'h46,8'h36})|
	    (curr_cycle == 3)&(curr_ir inside {8'h0E,8'hB6,8'h56,8'hCD,8'hAE,8'h31,8'hAD,8'h15,8'h55,8'hE1,8'h4D,8'h6D,8'hEC,8'hD0,8'h81,8'hC1,8'h0D,8'h70,8'h34,8'hD1,8'hF5,8'hF4,8'h61,8'h4E,8'hB1,8'hF6,8'h21,8'h51,8'h2C,8'h71,8'hED,8'hD6,8'h01,8'h50,8'h11,8'hEE,8'h35,8'h10,8'h40,8'hCC,8'hB0,8'h68,8'h60,8'hF0,8'hD4,8'h76,8'hCE,8'h36,8'h6E,8'h16,8'hF1,8'h2E,8'hA1,8'h91,8'h75,8'h2D,8'hAC,8'h90,8'h74,8'h28,8'hD5,8'h41,8'hB4,8'h6C,8'hB5,8'h0C,8'h30,8'h14,8'h54})|
	    (curr_cycle == 2)&(curr_ir inside {8'h4E,8'h21,8'hA6,8'h71,8'hD6,8'hB1,8'h95,8'hF6,8'hC5,8'h11,8'hE5,8'h61,8'h51,8'hEE,8'h35,8'h96,8'h2C,8'h10,8'h50,8'h40,8'hED,8'h01,8'h74,8'h68,8'h24,8'h8D,8'h46,8'hF0,8'hD4,8'h60,8'hCC,8'hB0,8'hCE,8'h36,8'h76,8'h25,8'h65,8'h16,8'h8E,8'h05,8'h2E,8'h6E,8'hE6,8'hCD,8'h2D,8'hF1,8'hAD,8'hA1,8'h91,8'h6C,8'hAC,8'hB5,8'h90,8'hD5,8'h41,8'h0C,8'h4C,8'hC4,8'h30,8'h14,8'h75,8'h64,8'hA4,8'h0E,8'hC6,8'h26,8'h66,8'h56,8'h31,8'h15,8'h55,8'hB6,8'h06,8'h04,8'h44,8'hA5,8'h6D,8'hEC,8'h45,8'hC1,8'h0D,8'hE1,8'h4D,8'hAE,8'h34,8'h28,8'hF5,8'hD0,8'h81,8'hF4,8'hE4,8'h8C,8'h70,8'hD1,8'hB4,8'h20,8'h54,8'h94})|
	    (curr_cycle == 4)&(curr_ir inside {8'h60,8'hA1,8'h6C,8'hF1,8'h11,8'h41,8'h91,8'h31,8'hE1,8'hD1,8'h81,8'hC1,8'h21,8'h61,8'h71,8'hB1,8'h01,8'h51,8'h40})|
	    (curr_cycle == 5)&(curr_ir inside {8'h60,8'h71,8'hB1,8'h21,8'h11,8'h61,8'h51,8'h01,8'h40,8'hA1,8'hF1,8'h41,8'h20,8'h31,8'hE1,8'hC1,8'hD1})|
	    (curr_cycle == 0))
		G_rdwr = 1;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hD1,8'h22,8'h50,8'h34,8'hF5,8'h95,8'h85,8'h01,8'hC5,8'h86,8'h14,8'hD0,8'h65,8'h21,8'h11,8'hC0,8'hC6,8'hB4,8'h49,8'hCD,8'h20,8'hEE,8'hA0,8'h8E,8'h84,8'hCE,8'h2C,8'hB2,8'hA2,8'hC9,8'h35,8'h10,8'hED,8'h2E,8'h70,8'h66,8'h54,8'h0E,8'h94,8'h25,8'hA1,8'h09,8'h6E,8'h92,8'hE6,8'h2D,8'h69,8'h55,8'h6C,8'hA9,8'hB6,8'h8D,8'hAC,8'h90,8'h06,8'hE4,8'hF1,8'h42,8'hD5,8'h26,8'h41,8'h4E,8'h05,8'h12,8'hA5,8'h89,8'h24,8'h6D,8'hE0,8'h31,8'h4C,8'hC4,8'h15,8'h30,8'h91,8'hF2,8'h75,8'h82,8'hB5,8'hCC,8'hD2,8'hC2,8'hB0,8'hA6,8'hF0,8'hD4,8'h80,8'h76,8'h32,8'h4D,8'hE1,8'h74,8'h64,8'h71,8'hAE,8'hA4,8'h0C,8'hB1,8'h02,8'h44,8'hE9,8'hF6,8'h72,8'hEC,8'h62,8'h56,8'hAD,8'h81,8'h16,8'hF4,8'hC1,8'hE2,8'h29,8'h46,8'h61,8'h36,8'h51,8'h0D,8'hE5,8'h45,8'h52,8'h96,8'h8C,8'h04,8'hD6})|
	    (curr_cycle == 2)&(curr_ir inside {8'h6C,8'h8D,8'hAC,8'h4E,8'h0C,8'h6D,8'hEC,8'hCC,8'hCE,8'h0D,8'h4D,8'hAE,8'h8E,8'hEE,8'h8C,8'h2C,8'hED,8'h2E,8'h6E,8'h0E,8'hCD,8'h2D,8'hAD})|
	    (curr_cycle == 5)&(curr_ir == 8'h60)|
	    (curr_cycle == 0))
		{next_pch, next_pcl} = curr_pc + 1;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hA1,8'h01,8'hC1,8'hE1,8'h41,8'h61,8'h21,8'h81}))
		next_bah = 0;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h71,8'hD1,8'h91,8'hB1,8'h11,8'h31,8'h51,8'hF1})|
	    (curr_cycle == 1)&(curr_ir inside {8'hA1,8'h01,8'h6C,8'hC1,8'hE1,8'h41,8'h61,8'h21,8'h81}))
		next_bal = G_rd_data;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hD1,8'h28,8'h34,8'hF5,8'h95,8'h85,8'h01,8'hC5,8'h86,8'h14,8'h65,8'h21,8'h11,8'hC6,8'hB4,8'hCD,8'h20,8'hEE,8'h8E,8'h84,8'hCE,8'h68,8'h2C,8'h35,8'hED,8'h2E,8'h66,8'h54,8'h0E,8'h94,8'h25,8'hA1,8'h6E,8'hE6,8'h2D,8'h48,8'h55,8'h6C,8'hB6,8'h8D,8'hAC,8'h06,8'hE4,8'hF1,8'hD5,8'h26,8'h41,8'h05,8'h4E,8'hA5,8'h60,8'h24,8'h6D,8'h31,8'h4C,8'h08,8'hC4,8'h40,8'h15,8'h91,8'h75,8'hB5,8'hCC,8'hA6,8'hD4,8'h76,8'h4D,8'hE1,8'h74,8'h64,8'h71,8'hA4,8'hAE,8'h0C,8'hB1,8'h44,8'hF6,8'hEC,8'h56,8'hAD,8'h81,8'h16,8'hF4,8'hC1,8'h46,8'h36,8'h51,8'h0D,8'h61,8'hE5,8'h45,8'h96,8'h8C,8'h04,8'hD6})|
	    (curr_cycle == 2)&(curr_ir inside {8'h55,8'h6C,8'hB6,8'h8D,8'hAC,8'h46,8'hB5,8'h06,8'hD5,8'h41,8'h4E,8'hD4,8'h60,8'h0C,8'h6D,8'hEC,8'h14,8'h21,8'h75,8'hCC,8'hC1,8'hCE,8'h36,8'h0D,8'hE1,8'h76,8'h4D,8'h71,8'hAE,8'hD6,8'hB1,8'h34,8'h95,8'h28,8'hF6,8'hF5,8'h81,8'h16,8'h8E,8'h11,8'h61,8'h51,8'hEE,8'h35,8'hF4,8'h96,8'h8C,8'h2C,8'hD1,8'h40,8'hED,8'h2E,8'h6E,8'h01,8'hE6,8'h0E,8'hC6,8'hB4,8'hCD,8'h20,8'h2D,8'h74,8'h68,8'hF1,8'h26,8'h66,8'h56,8'h54,8'h94,8'hAD,8'hA1,8'h91,8'h31,8'h15})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD6,8'h01,8'h0E,8'h6E,8'hE6,8'h16,8'hC6,8'hEE,8'h40,8'h2E,8'h66,8'h56,8'hA1,8'h91,8'h26,8'h41,8'h60,8'h6C,8'h46,8'h61,8'h06,8'h4E,8'h76,8'hE1,8'h20,8'hF6,8'h21,8'h81,8'hC1,8'hCE,8'h36})|
	    (curr_cycle == 4)&(curr_ir inside {8'hD6,8'h4E,8'hF6,8'h60,8'h21,8'h61,8'h36,8'h76,8'hD1,8'hE1,8'h71,8'hB1,8'h01,8'h0E,8'h20,8'hEE,8'h16,8'h81,8'hC1,8'hCE,8'h51,8'h40,8'hA1,8'h2E,8'h31,8'h6E,8'hF1,8'h11,8'h41,8'h56,8'h91})|
	    (curr_cycle == 0))
		next_cycle = curr_cycle + 1;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h81,8'h61,8'hC1,8'hE1,8'h41,8'hA1,8'h01,8'h21})|
	    (curr_cycle == 3)&(curr_ir inside {8'hE1,8'h41,8'h01,8'hA1,8'h21,8'h6C,8'h81,8'h61,8'hC1})|
	    (curr_cycle == 4)&(curr_ir inside {8'h6C,8'h21,8'h81,8'h61,8'hC1,8'h41,8'hE1,8'hA1,8'h01}))
		G_addr = curr_ba;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h81,8'hA1,8'h01,8'hE1,8'h41,8'h61,8'hC1,8'h21}))
		next_bal = curr_bal + curr_x;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hD1,8'hF5,8'h34,8'h95,8'h85,8'hC5,8'h86,8'h14,8'h65,8'hC6,8'h11,8'hB4,8'hCD,8'h20,8'hEE,8'h8E,8'h84,8'hCE,8'h2C,8'h35,8'hED,8'h2E,8'h66,8'h54,8'h0E,8'h94,8'h25,8'h6E,8'hE6,8'h2D,8'h55,8'hB6,8'h8D,8'hAC,8'h06,8'hE4,8'hF1,8'hD5,8'h26,8'h4E,8'h05,8'hA5,8'h24,8'h6D,8'h31,8'h4C,8'hC4,8'h15,8'h91,8'h75,8'hB5,8'hCC,8'hA6,8'hD4,8'h76,8'h4D,8'h74,8'h64,8'hAE,8'h71,8'hA4,8'h0C,8'hB1,8'h44,8'hF6,8'hEC,8'h56,8'hAD,8'h16,8'hF4,8'h46,8'hE5,8'h36,8'h51,8'h0D,8'h45,8'h96,8'h8C,8'h04,8'hD6})|
	    (curr_cycle == 3)&(curr_ir inside {8'h01,8'hA1,8'h41,8'h6C,8'h61,8'hE1,8'h21,8'h81,8'hC1}))
		next_adl = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hE1,8'h41,8'h6C,8'hA1,8'h81,8'h01,8'h61,8'hC1,8'h21}))
		next_bal = curr_bal + 1;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hCD,8'h8E,8'h2D,8'hCC,8'h8D,8'hAC,8'hEE,8'hCE,8'h0D,8'h8C,8'h4D,8'h4E,8'h2C,8'hAE,8'hED,8'h2E,8'h0C,8'h6D,8'hAD,8'h6E,8'h4C,8'h0E,8'hEC})|
	    (curr_cycle == 4)&(curr_ir inside {8'h6C,8'h21,8'h81,8'h61,8'hC1,8'h41,8'hE1,8'hA1,8'h01})|
	    (curr_cycle == 5)&(curr_ir == 8'h20))
		next_adh = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h71,8'h8C,8'hED,8'hD6,8'h34,8'hD1,8'h0E,8'h94,8'hF5,8'h6E,8'hE6,8'h16,8'hC6,8'h11,8'hB6,8'h8D,8'hEE,8'hF4,8'h35,8'hF1,8'h96,8'h2E,8'h66,8'h56,8'h91,8'h75,8'h2D,8'hCC,8'hCD,8'hAC,8'h74,8'hAE,8'hD5,8'h26,8'h31,8'hAD,8'h15,8'hB4,8'h55,8'h46,8'hB5,8'h06,8'h4E,8'hD4,8'h76,8'h4D,8'h0C,8'h6D,8'hB1,8'h95,8'hF6,8'hEC,8'h14,8'h8E,8'hCE,8'h36,8'h0D,8'h2C,8'h51,8'h54})|
	    (curr_cycle == 2)&(curr_ir inside {8'h55,8'hB6,8'h46,8'hB5,8'h06,8'hD5,8'h04,8'hD4,8'h44,8'hA5,8'hC4,8'h14,8'h75,8'h45,8'hA6,8'h36,8'h76,8'h64,8'h71,8'hA4,8'hD6,8'hB1,8'h34,8'h95,8'hF6,8'h25,8'hF5,8'h65,8'hC5,8'h16,8'h11,8'hE5,8'h51,8'hF4,8'hE4,8'h35,8'h96,8'h05,8'hD1,8'h85,8'hE6,8'h86,8'hC6,8'hB4,8'h84,8'h74,8'hF1,8'h26,8'h66,8'h56,8'h54,8'h94,8'h91,8'h24,8'h31,8'h15})|
	    (curr_cycle == 4)&(curr_ir inside {8'h46,8'hD6,8'h4E,8'hF6,8'hC6,8'h36,8'h76,8'h0E,8'hEE,8'h16,8'hCE,8'h26,8'h66,8'h2E,8'h6E,8'hE6,8'h06,8'h56})|
	    (curr_cycle == 5)&(curr_ir inside {8'h01,8'h0E,8'hA1,8'h6E,8'hF1,8'h2E,8'h31,8'hCE,8'h91,8'h41,8'h4E,8'hE1,8'h56,8'hF6,8'h81,8'hC1,8'h36,8'h76,8'h71,8'hD6,8'hD1,8'hB1,8'h16,8'h21,8'h11,8'h61,8'h51,8'hEE}))
		G_addr = curr_ad;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h8C,8'hED,8'h70,8'h34,8'h94,8'h50,8'hF5,8'hB6,8'h8D,8'hF4,8'h35,8'h10,8'h96,8'h75,8'h2D,8'hCC,8'hB0,8'hCD,8'hAC,8'h68,8'h90,8'h74,8'h28,8'hAE,8'hD5,8'hAD,8'h15,8'hB4,8'h55,8'hB5,8'hF0,8'hD4,8'h4D,8'h0C,8'h6D,8'h95,8'h30,8'hEC,8'h14,8'hD0,8'h8E,8'h0D,8'h2C,8'h54})|
	    (curr_cycle == 1)&(curr_ir inside {8'h18,8'h5A,8'h88,8'hC0,8'h49,8'hA0,8'hA2,8'hC9,8'hFA,8'h4A,8'hB8,8'h09,8'h1A,8'hF8,8'h69,8'hA9,8'h9A,8'hDA,8'h38,8'hC8,8'h6A,8'h58,8'h98,8'h89,8'hEA,8'hE0,8'h3A,8'h7A,8'hC2,8'h2A,8'h80,8'hE9,8'h0A,8'hAA,8'hE2,8'hD8,8'hE8,8'h29,8'h78,8'hA8,8'h8A,8'hCA,8'hBA})|
	    (curr_cycle == 4)&(curr_ir inside {8'h46,8'hC6,8'h26,8'h66,8'hE6,8'h6C,8'h06})|
	    (curr_cycle == 5)&(curr_ir inside {8'h01,8'h0E,8'hA1,8'h6E,8'hF1,8'h60,8'h40,8'h2E,8'h31,8'h91,8'h41,8'h4E,8'hE1,8'h56,8'hF6,8'h81,8'hC1,8'h36,8'h76,8'h71,8'hD6,8'hD1,8'hB1,8'h20,8'h16,8'h21,8'h11,8'h61,8'h51,8'hEE,8'hCE})|
	    (curr_cycle == 2)&(curr_ir inside {8'h04,8'h44,8'hA5,8'h4C,8'hC4,8'h45,8'hA6,8'h64,8'hA4,8'h25,8'h65,8'hC5,8'h48,8'hE5,8'hE4,8'h05,8'h85,8'h86,8'h84,8'h24,8'h08}))
		next_cycle = 0;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'h46,8'h45,8'h06,8'hE4,8'h05,8'h25,8'hE6,8'hC4,8'h24,8'hC6})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD5,8'h4D,8'hD6,8'h0E,8'h56,8'hF6,8'hEC,8'h15,8'h16,8'h55,8'h2D,8'hCC,8'hCD,8'hEE,8'h35,8'hCE,8'h0D,8'h2C,8'h4E})|
	    (curr_cycle == 1)&(curr_ir inside {8'h4A,8'hE0,8'h09,8'h0A,8'hC0,8'h49,8'h29,8'hC9})|
	    (curr_cycle == 5)&(curr_ir inside {8'hD1,8'h01,8'h31,8'h21,8'h11,8'h51,8'hC1,8'h41}))
		alu_in_c = 0;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE5,8'h45,8'h05,8'h25,8'h65,8'h24})|
	    (curr_cycle == 5)&(curr_ir inside {8'hF1,8'h71,8'hE1,8'hD1,8'h01,8'h31,8'h21,8'h11,8'h61,8'h51,8'hC1,8'h41})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD5,8'hED,8'h4D,8'h6D,8'hF5,8'h15,8'h75,8'h55,8'h2D,8'hCD,8'h35,8'h0D,8'h2C})|
	    (curr_cycle == 1)&(curr_ir inside {8'h4A,8'hE9,8'h09,8'h0A,8'h69,8'h49,8'h29,8'h2A,8'h6A,8'hC9}))
		alu_in_lhs = curr_a;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE5,8'h45,8'hE4,8'h05,8'h25,8'hC4,8'h65,8'h24})|
	    (curr_cycle == 5)&(curr_ir inside {8'hF1,8'h71,8'hE1,8'hD1,8'h01,8'h31,8'h21,8'h11,8'h61,8'h51,8'hC1,8'h41})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD5,8'hED,8'h4D,8'h6D,8'hF5,8'hEC,8'h15,8'h75,8'h55,8'h2D,8'hCC,8'hCD,8'h35,8'h0D,8'h2C})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE9,8'hE0,8'h09,8'hC0,8'h69,8'h49,8'h29,8'hC9}))
		alu_in_rhs = G_rd_data;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h09)|
	    (curr_cycle == 3)&(curr_ir inside {8'h0D,8'h15})|
	    (curr_cycle == 5)&(curr_ir inside {8'h01,8'h11})|
	    (curr_cycle == 2)&(curr_ir == 8'h05))
		next_a = alu_or;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF1,8'h71,8'hE1,8'h01,8'hB1,8'h31,8'hA1,8'h21,8'h11,8'h61,8'h51,8'h41})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'h4D,8'h6D,8'hF5,8'hAD,8'h15,8'h75,8'h55,8'h2D,8'hB5,8'h35,8'h0D})|
	    (curr_cycle == 1)&(curr_ir inside {8'h4A,8'hE9,8'h09,8'h0A,8'h69,8'h49,8'hA9,8'h29,8'h2A,8'h6A,8'h8A,8'h98})|
	    (curr_cycle == 2)&(curr_ir inside {8'hE5,8'h45,8'h05,8'hA5,8'h25,8'h65}))
		next_p[Z_bit] = next_a == 0;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF1,8'h71,8'hE1,8'h01,8'hB1,8'h31,8'hA1,8'h21,8'h11,8'h61,8'h51,8'h41})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'h4D,8'h6D,8'hF5,8'hAD,8'h15,8'h75,8'h55,8'h2D,8'hB5,8'h35,8'h0D})|
	    (curr_cycle == 1)&(curr_ir inside {8'h4A,8'hE9,8'h09,8'h0A,8'h69,8'h49,8'hA9,8'h29,8'h2A,8'h6A,8'h8A,8'h98})|
	    (curr_cycle == 2)&(curr_ir inside {8'hE5,8'h45,8'h05,8'hA5,8'h25,8'h65}))
		next_p[N_bit] = next_a[7];
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h22,8'h52,8'h82,8'h42,8'h02,8'hB2,8'hD2,8'h32,8'h92,8'hF2,8'h72,8'h62,8'h12}))
		next_cycle = -1;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hD1,8'hA5,8'hB1,8'h66,8'h44,8'h54,8'hF5,8'h34,8'h24,8'h94,8'hF6,8'h25,8'h31,8'h95,8'h85,8'h56,8'hC4,8'h15,8'hC5,8'h86,8'h14,8'h91,8'hE6,8'h65,8'hC6,8'h11,8'h75,8'h16,8'hB4,8'h55,8'hF4,8'hB5,8'hB6,8'h46,8'hE5,8'h36,8'h51,8'hA6,8'h84,8'h06,8'h45,8'hE4,8'hF1,8'hD4,8'h96,8'hD5,8'h76,8'h26,8'h35,8'h04,8'h74,8'hD6,8'h64,8'h05,8'h71,8'hA4}))
		next_adh = 0;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hEE,8'h56,8'h16,8'h76,8'hCE,8'hD6,8'h36,8'hF6,8'h6E,8'h2E,8'h4E,8'h0E})|
	    (curr_cycle == 2)&(curr_ir inside {8'h26,8'hE6,8'h66,8'h46,8'hC6,8'h06}))
		alu_in_lhs = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h56,8'h16,8'h76,8'h36,8'h6E,8'h2E,8'h4E,8'h0E})|
	    (curr_cycle == 2)&(curr_ir inside {8'h26,8'h66,8'h46,8'h06})|
	    (curr_cycle == 1)&(curr_ir inside {8'h0A,8'h6A,8'h4A,8'h2A}))
		alu_in_rhs = 0;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h4E,8'hD6,8'h56,8'h2E,8'h0E,8'hF6,8'h16,8'h6E,8'h91,8'h81,8'hEE,8'h36,8'h76,8'hCE})|
	    (curr_cycle == 3)&(curr_ir inside {8'h8C,8'h26,8'h96,8'h94,8'h66,8'h95,8'h20,8'hE6,8'hC6,8'h8D,8'h46,8'h8E,8'h06})|
	    (curr_cycle == 4)&(curr_ir inside {8'h20,8'hEE,8'h16,8'h06,8'hCE,8'h46,8'h36,8'hE6,8'h26,8'h76,8'hD6,8'h4E,8'h66,8'hF6,8'h56,8'h2E,8'h0E,8'h6E,8'hC6})|
	    (curr_cycle == 2)&(curr_ir inside {8'h84,8'h85,8'h86,8'h08,8'h48}))
		G_rdwr = 0;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h06,8'h26})|
	    (curr_cycle == 4)&(curr_ir inside {8'h36,8'h06,8'h26,8'h2E,8'h0E,8'h16})|
	    (curr_cycle == 5)&(curr_ir inside {8'h16,8'h36,8'h2E,8'h0E}))
		G_wr_data = alu_rol;
	
	if ((curr_cycle == 4)&(curr_ir inside {8'h06,8'h26})|
	    (curr_cycle == 5)&(curr_ir inside {8'h16,8'h36,8'h2E,8'h0E})|
	    (curr_cycle == 1)&(curr_ir inside {8'h0A,8'h2A}))
		next_p[C_bit] = alu_rol_c;
	
	if ((curr_cycle == 4)&(curr_ir inside {8'h06,8'h26})|
	    (curr_cycle == 5)&(curr_ir inside {8'h16,8'h36,8'h2E,8'h0E}))
		next_p[Z_bit] = alu_rol == 0;
	
	if ((curr_cycle == 4)&(curr_ir inside {8'h06,8'h26})|
	    (curr_cycle == 5)&(curr_ir inside {8'h16,8'h36,8'h2E,8'h0E}))
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
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hAE,8'h8C,8'hED,8'h4D,8'h2E,8'h0C,8'h6D,8'h0E,8'hEC,8'h6E,8'hAD,8'h2D,8'hCC,8'h8D,8'h8E,8'hCD,8'hEE,8'hCE,8'hAC,8'h2C,8'h0D,8'h4E}))
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
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h71,8'hD1,8'h91,8'hB1,8'h11,8'h31,8'h51,8'hF1}))
		next_adl = curr_adl + 1;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h71,8'hF1,8'h51,8'h11,8'h31,8'hD1,8'h91,8'hB1})|
	    (curr_cycle == 2)&(curr_ir == 8'h6C))
		next_bah = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h71,8'hF1,8'h51,8'h11,8'h31,8'hD1,8'h91,8'hB1}))
		{next_adh, next_adl} = {G_rd_data, curr_bal}  + {8'h00, curr_y};
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h71,8'hF1,8'h51,8'h11,8'h31,8'hD1,8'hB1}))
		next_cycle = curr_cycle + 1 + ((next_bah != next_adh) ? 0 : 1);
	
	if ((curr_cycle == 4)&(curr_ir inside {8'hB1,8'hD1,8'hF1,8'h11,8'h51,8'h71,8'h31,8'h91}))
		G_addr = {curr_bah, curr_adl};
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h75,8'h16,8'hB4,8'h55,8'hB5,8'h74,8'hF4,8'h35,8'h36,8'hD5,8'h76,8'hD4,8'hD6,8'h56,8'h34,8'h95,8'h54,8'h94,8'hF6,8'hF5,8'h14,8'h15}))
		next_adl = curr_adl + curr_x;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h18))
		next_p[C_bit] = 0;
	
	if ((curr_cycle == 3)&(curr_ir == 8'h20))
		G_wr_data = curr_pch;
	
	if ((curr_cycle == 4)&(curr_ir == 8'h20))
		G_wr_data = curr_pcl;
	
	if ((curr_cycle == 5)&(curr_ir == 8'h20)|
	    (curr_cycle == 2)&(curr_ir == 8'h4C)|
	    (curr_cycle == 4)&(curr_ir == 8'h6C))
		{next_pch, next_pcl} = next_ad;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h25)|
	    (curr_cycle == 3)&(curr_ir inside {8'h35,8'h2D})|
	    (curr_cycle == 1)&(curr_ir == 8'h29)|
	    (curr_cycle == 5)&(curr_ir inside {8'h21,8'h31}))
		next_a = alu_and;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h24)|
	    (curr_cycle == 3)&(curr_ir == 8'h2C))
		next_p[Z_bit] = alu_and == 0;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h24)|
	    (curr_cycle == 3)&(curr_ir == 8'h2C))
		next_p[V_bit] = G_rd_data[6];
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h68,8'h2C})|
	    (curr_cycle == 2)&(curr_ir == 8'h24))
		next_p[N_bit] = G_rd_data[7];
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF1,8'h71,8'hE1,8'h61})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'h76,8'h2E,8'h6D,8'hF5,8'h6E,8'h75,8'h36})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE9,8'h69,8'h2A,8'h6A})|
	    (curr_cycle == 2)&(curr_ir inside {8'hE5,8'h26,8'h66,8'h65}))
		alu_in_c = curr_p[C_bit];
	
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
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h51,8'h41})|
	    (curr_cycle == 1)&(curr_ir == 8'h49)|
	    (curr_cycle == 3)&(curr_ir inside {8'h4D,8'h55})|
	    (curr_cycle == 2)&(curr_ir == 8'h45))
		next_a = alu_xor;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h66,8'h46})|
	    (curr_cycle == 5)&(curr_ir inside {8'h4E,8'h56,8'h6E,8'h76})|
	    (curr_cycle == 4)&(curr_ir inside {8'h6E,8'h56,8'h76,8'h46,8'h4E,8'h66}))
		G_wr_data = alu_ror;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h4E,8'h56,8'h6E,8'h76})|
	    (curr_cycle == 4)&(curr_ir inside {8'h46,8'h66})|
	    (curr_cycle == 1)&(curr_ir inside {8'h6A,8'h4A}))
		next_p[C_bit] = alu_ror_c;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h4E,8'h56,8'h6E,8'h76})|
	    (curr_cycle == 4)&(curr_ir inside {8'h46,8'h66}))
		next_p[Z_bit] = alu_ror == 0;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'h4E,8'h56,8'h6E,8'h76})|
	    (curr_cycle == 4)&(curr_ir inside {8'h46,8'h66}))
		next_p[N_bit] = alu_ror[7];
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h85,8'h48})|
	    (curr_cycle == 3)&(curr_ir inside {8'h95,8'h8D})|
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
	    (curr_cycle == 1)&(curr_ir == 8'h69))
		next_a = alu_adc[7:0];
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h75,8'h6D})|
	    (curr_cycle == 5)&(curr_ir inside {8'h71,8'h61})|
	    (curr_cycle == 2)&(curr_ir == 8'h65)|
	    (curr_cycle == 1)&(curr_ir == 8'h69))
		next_p[C_bit] = alu_adc_c;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h75,8'h6D})|
	    (curr_cycle == 5)&(curr_ir inside {8'h71,8'h61})|
	    (curr_cycle == 2)&(curr_ir == 8'h65)|
	    (curr_cycle == 1)&(curr_ir == 8'h69))
		next_p[V_bit] = alu_adc_v;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hA9)|
	    (curr_cycle == 3)&(curr_ir inside {8'h68,8'hAD,8'hB5})|
	    (curr_cycle == 2)&(curr_ir == 8'hA5)|
	    (curr_cycle == 5)&(curr_ir inside {8'hB1,8'hA1}))
		next_a = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir == 8'h68))
		next_p[Z_bit] = G_rd_data == 0;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h70))
		next_cycle = (curr_p[V_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'h78))
		next_p[I_bit] = 1;
	
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
	    (curr_cycle == 3)&(curr_ir inside {8'hAC,8'hB4}))
		next_p[Z_bit] = next_y == 0;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hA4)|
	    (curr_cycle == 1)&(curr_ir inside {8'hA8,8'hC8,8'hA0,8'h88})|
	    (curr_cycle == 3)&(curr_ir inside {8'hAC,8'hB4}))
		next_p[N_bit] = next_y[7];
	
	if ((curr_cycle == 1)&(curr_ir == 8'h8A))
		next_a = curr_x;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h90))
		next_cycle = (curr_p[C_bit] ? 0 : (curr_cycle + 1));
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hB6,8'h96}))
		next_adl = curr_adl + curr_y;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h98))
		next_a = curr_y;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h9A))
		next_s = curr_x;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hA0)|
	    (curr_cycle == 2)&(curr_ir == 8'hA4)|
	    (curr_cycle == 3)&(curr_ir inside {8'hB4,8'hAC}))
		next_y = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hB6,8'hAE})|
	    (curr_cycle == 2)&(curr_ir == 8'hA6)|
	    (curr_cycle == 1)&(curr_ir == 8'hA2))
		next_x = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hAE,8'hB6})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE8,8'hA2,8'hCA,8'hAA,8'hBA})|
	    (curr_cycle == 2)&(curr_ir == 8'hA6))
		next_p[N_bit] = next_x[7];
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hAE,8'hB6})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE8,8'hA2,8'hCA,8'hAA,8'hBA})|
	    (curr_cycle == 2)&(curr_ir == 8'hA6))
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
	    (curr_cycle == 5)&(curr_ir inside {8'hC1,8'hD1})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD5,8'hCC,8'hEC,8'hCD})|
	    (curr_cycle == 1)&(curr_ir inside {8'hC9,8'hC0,8'hE0}))
		next_p[Z_bit] = alu_cmp_z;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE4,8'hC4})|
	    (curr_cycle == 5)&(curr_ir inside {8'hC1,8'hD1})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD5,8'hCC,8'hEC,8'hCD})|
	    (curr_cycle == 1)&(curr_ir inside {8'hC9,8'hC0,8'hE0}))
		next_p[N_bit] = alu_cmp_n;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE4,8'hC4})|
	    (curr_cycle == 5)&(curr_ir inside {8'hC1,8'hD1})|
	    (curr_cycle == 3)&(curr_ir inside {8'hD5,8'hCC,8'hEC,8'hCD})|
	    (curr_cycle == 1)&(curr_ir inside {8'hC9,8'hC0,8'hE0}))
		next_p[C_bit] = alu_cmp_c;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hCE,8'hD6})|
	    (curr_cycle == 2)&(curr_ir == 8'hC6))
		alu_in_rhs = 8'hFF;
	
	if ((curr_cycle == 4)&(curr_ir inside {8'hF6,8'hCE,8'hD6,8'hEE,8'hC6,8'hE6})|
	    (curr_cycle == 5)&(curr_ir inside {8'hEE,8'hD6,8'hF6,8'hCE})|
	    (curr_cycle == 3)&(curr_ir inside {8'hC6,8'hE6}))
		G_wr_data = alu_adc[7:0];
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hEE,8'hD6,8'hF6,8'hCE})|
	    (curr_cycle == 4)&(curr_ir inside {8'hC6,8'hE6}))
		next_p[Z_bit] = alu_adc[7:0] == 0;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hEE,8'hD6,8'hF6,8'hCE})|
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
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF1,8'hE1})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'hF5})|
	    (curr_cycle == 1)&(curr_ir == 8'hE9)|
	    (curr_cycle == 2)&(curr_ir == 8'hE5))
		next_a = alu_sbc[7:0];
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF1,8'hE1})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'hF5})|
	    (curr_cycle == 1)&(curr_ir == 8'hE9)|
	    (curr_cycle == 2)&(curr_ir == 8'hE5))
		next_p[C_bit] = alu_sbc_c;
	
	if ((curr_cycle == 5)&(curr_ir inside {8'hF1,8'hE1})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'hF5})|
	    (curr_cycle == 1)&(curr_ir == 8'hE9)|
	    (curr_cycle == 2)&(curr_ir == 8'hE5))
		next_p[V_bit] = alu_sbc_v;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hEE,8'hF6})|
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
	