
	if ((curr_cycle == 1)&(curr_ir inside {8'h22,8'h28,8'h18,8'h5A,8'h50,8'h88,8'h85,8'hC5,8'h86,8'hD0,8'h65,8'hC0,8'hCD,8'h49,8'h20,8'hA0,8'h8E,8'h84,8'h68,8'h2C,8'hB2,8'hA2,8'hC9,8'h10,8'hED,8'hFA,8'h70,8'h25,8'hB8,8'h09,8'h1A,8'hF8,8'h92,8'h2D,8'h48,8'h69,8'hA9,8'h8D,8'hAC,8'h9A,8'h90,8'hE4,8'hDA,8'h42,8'hC8,8'h38,8'h58,8'h05,8'h98,8'h12,8'hA5,8'h89,8'h60,8'h24,8'h6D,8'hEA,8'hE0,8'h4C,8'h08,8'hC4,8'h3A,8'h40,8'h30,8'h7A,8'hF2,8'h82,8'hCC,8'hD2,8'hC2,8'hB0,8'hA6,8'hF0,8'h80,8'h32,8'h4D,8'h64,8'hAE,8'hA4,8'h0C,8'h02,8'h44,8'hE9,8'h72,8'hEC,8'h62,8'hAD,8'hAA,8'hE2,8'hE8,8'hD8,8'h29,8'hE5,8'h0D,8'h78,8'h45,8'h52,8'hA8,8'h8C,8'h04,8'h8A,8'hCA,8'hBA})|
	    (curr_cycle == 3)&(curr_ir inside {8'h70,8'h50,8'h10,8'hB0,8'h90,8'hF0,8'h30,8'hD0})|
	    (curr_cycle == 2)&(curr_ir inside {8'h8D,8'hAC,8'h0C,8'h6D,8'h4C,8'hEC,8'hCC,8'h0D,8'h4D,8'hAE,8'h8E,8'h8C,8'h2C,8'hED,8'hCD,8'h2D,8'hAD})|
	    (curr_cycle == 5)&(curr_ir inside {8'h60,8'h20})|
	    (curr_cycle == 0))
		G_addr = curr_pc;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h22,8'h28,8'h18,8'h5A,8'h50,8'h88,8'h85,8'hC5,8'h86,8'hD0,8'h65,8'hC0,8'hCD,8'h49,8'h20,8'hA0,8'h8E,8'h84,8'h68,8'h2C,8'hB2,8'hA2,8'hC9,8'h10,8'hED,8'hFA,8'h70,8'h25,8'hB8,8'h09,8'h1A,8'hF8,8'h92,8'h2D,8'h48,8'h69,8'hA9,8'h8D,8'hAC,8'h9A,8'h90,8'hE4,8'hDA,8'h42,8'h38,8'hC8,8'h58,8'h05,8'h12,8'h98,8'hA5,8'h89,8'h60,8'h24,8'h6D,8'hEA,8'hE0,8'h4C,8'h08,8'hC4,8'h3A,8'h40,8'h30,8'h7A,8'hF2,8'h82,8'hCC,8'hD2,8'hC2,8'hB0,8'hA6,8'hF0,8'h80,8'h32,8'h4D,8'h64,8'hAE,8'hA4,8'h0C,8'h02,8'h44,8'hE9,8'h72,8'h62,8'hEC,8'hAD,8'hAA,8'hE2,8'hE8,8'hD8,8'h29,8'hE5,8'h0D,8'h78,8'h45,8'h52,8'hA8,8'h8C,8'h04,8'h8A,8'hCA,8'hBA})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'h70,8'h50,8'h10,8'h40,8'h2D,8'hCC,8'hB0,8'hCD,8'h68,8'hAC,8'h90,8'h28,8'hAE,8'h60,8'hAD,8'hF0,8'h4D,8'h0C,8'h6D,8'h30,8'hEC,8'hD0,8'h0D,8'h2C})|
	    (curr_cycle == 2)&(curr_ir inside {8'h8D,8'hAC,8'h90,8'hF0,8'h04,8'h44,8'hA5,8'h60,8'h0C,8'h6D,8'h4C,8'h30,8'hC4,8'hEC,8'hCC,8'hB0,8'h45,8'hA6,8'h0D,8'h4D,8'h64,8'hAE,8'hA4,8'h28,8'h25,8'h65,8'hD0,8'hC5,8'h8E,8'hE5,8'hE4,8'h8C,8'h70,8'h05,8'h2C,8'h10,8'h50,8'h40,8'hED,8'hCD,8'h20,8'h2D,8'h68,8'hAD,8'h24})|
	    (curr_cycle == 4)&(curr_ir inside {8'h60,8'h40})|
	    (curr_cycle == 5)&(curr_ir inside {8'h60,8'h40,8'h20})|
	    (curr_cycle == 0))
		G_rdwr = 1;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h22,8'h50,8'h85,8'hC5,8'h86,8'hD0,8'h65,8'hC0,8'hCD,8'h49,8'h20,8'hA0,8'h8E,8'h84,8'h2C,8'hB2,8'hA2,8'hC9,8'h10,8'hED,8'h70,8'h25,8'h09,8'h92,8'h2D,8'h69,8'hA9,8'h8D,8'hAC,8'h90,8'hE4,8'h42,8'h05,8'h12,8'hA5,8'h89,8'h24,8'h6D,8'hE0,8'h4C,8'hC4,8'h30,8'hF2,8'h82,8'hCC,8'hD2,8'hC2,8'hB0,8'hA6,8'hF0,8'h80,8'h32,8'h4D,8'h64,8'hAE,8'hA4,8'h0C,8'h02,8'h44,8'hE9,8'h72,8'hEC,8'h62,8'hAD,8'hE2,8'h29,8'hE5,8'h0D,8'h45,8'h52,8'h8C,8'h04})|
	    (curr_cycle == 2)&(curr_ir inside {8'h8D,8'hAC,8'h0C,8'h6D,8'hEC,8'hCC,8'h0D,8'h4D,8'hAE,8'h8E,8'h8C,8'h2C,8'hED,8'hCD,8'h2D,8'hAD})|
	    (curr_cycle == 5)&(curr_ir == 8'h60)|
	    (curr_cycle == 0))
		{next_pch, next_pcl} = curr_pc + 1;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h22,8'h52,8'h82,8'h42,8'h02,8'hB2,8'hD2,8'h32,8'h92,8'hF2,8'h72,8'h62,8'h12}))
		next_cycle = -1;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h85,8'hA5,8'hA4,8'hC4,8'h44,8'hC5,8'h84,8'h24,8'h04,8'h86,8'hE5,8'h64,8'hA6,8'h05,8'h65,8'h45,8'hE4,8'h25}))
		next_adh = 0;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hED,8'h0C,8'hA5,8'h44,8'h24,8'h6D,8'hEC,8'h25,8'h4C,8'h85,8'hC4,8'hC5,8'h86,8'hAD,8'h65,8'h2D,8'hCD,8'h20,8'hCC,8'h8D,8'hAC,8'hE5,8'h0D,8'h8E,8'h84,8'hA6,8'h45,8'hE4,8'h2C,8'h8C,8'h4D,8'h04,8'h64,8'h05,8'hAE,8'hA4}))
		next_adl = G_rd_data;
	
	if ((curr_cycle == 1)&(curr_ir inside {8'hED,8'h28,8'h0C,8'hA5,8'h44,8'h60,8'h24,8'h6D,8'hEC,8'h25,8'h4C,8'h08,8'h85,8'hC4,8'h40,8'hC5,8'h86,8'hAD,8'h65,8'h2D,8'h48,8'hCD,8'h20,8'hCC,8'h8D,8'hAC,8'hE5,8'h0D,8'h84,8'h8E,8'h45,8'hA6,8'hE4,8'h68,8'h2C,8'h8C,8'h4D,8'h04,8'h64,8'h05,8'hAE,8'hA4})|
	    (curr_cycle == 0)|
	    (curr_cycle == 2)&(curr_ir inside {8'hCD,8'h20,8'h8E,8'h2D,8'hCC,8'h8D,8'hAC,8'h68,8'h0D,8'h8C,8'h4D,8'h2C,8'hAE,8'h40,8'h60,8'hED,8'h28,8'h0C,8'h6D,8'hAD,8'hEC})|
	    (curr_cycle == 4)&(curr_ir inside {8'h20,8'h40,8'h60})|
	    (curr_cycle == 3)&(curr_ir inside {8'h40,8'h60,8'h20}))
		next_cycle = curr_cycle + 1;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE5,8'h45,8'hA6,8'h84,8'hE4,8'h04,8'h64,8'h05,8'h44,8'hA4,8'hA5,8'h25,8'h85,8'hC4,8'h65,8'h24,8'h86})|
	    (curr_cycle == 3)&(curr_ir inside {8'hAE,8'h8C,8'hED,8'h4D,8'h0C,8'h6D,8'hEC,8'hAD,8'h2D,8'hCC,8'h8D,8'h8E,8'hCD,8'hAC,8'h0D,8'h2C}))
		G_addr = curr_ad;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h8C,8'hED,8'h70,8'h50,8'h8D,8'h10,8'h2D,8'hCC,8'hB0,8'hCD,8'hAC,8'h68,8'h90,8'h28,8'hAE,8'hAD,8'hF0,8'h4D,8'h0C,8'h6D,8'h30,8'hEC,8'hD0,8'h8E,8'h0D,8'h2C})|
	    (curr_cycle == 1)&(curr_ir inside {8'h18,8'h5A,8'h88,8'hC0,8'h49,8'hA0,8'hA2,8'hC9,8'hFA,8'hB8,8'h09,8'h1A,8'hF8,8'h69,8'hA9,8'h9A,8'hDA,8'h38,8'hC8,8'h58,8'h98,8'h89,8'hEA,8'hE0,8'h3A,8'h7A,8'hC2,8'h80,8'hE9,8'hAA,8'hE2,8'hE8,8'hD8,8'h29,8'h78,8'hA8,8'h8A,8'hCA,8'hBA})|
	    (curr_cycle == 2)&(curr_ir inside {8'h04,8'h44,8'hA5,8'h4C,8'hC4,8'h45,8'hA6,8'h64,8'hA4,8'h25,8'h65,8'hC5,8'hE5,8'hE4,8'h05,8'h85,8'h86,8'h84,8'h24,8'h08,8'h48})|
	    (curr_cycle == 5)&(curr_ir inside {8'h60,8'h40,8'h20}))
		next_cycle = 0;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'h45,8'hE4,8'h05,8'h25,8'hC4,8'h24})|
	    (curr_cycle == 3)&(curr_ir inside {8'h4D,8'hEC,8'h2D,8'hCC,8'hCD,8'h0D,8'h2C})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE0,8'h09,8'hC0,8'h49,8'h29,8'hC9}))
		alu_in_c = 0;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE5,8'h45,8'h05,8'h25,8'h65,8'h24})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'h4D,8'h6D,8'h2D,8'hCD,8'h0D,8'h2C})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE9,8'h09,8'h69,8'h49,8'h29,8'hC9}))
		alu_in_lhs = curr_a;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE5,8'h45,8'hE4,8'h05,8'h25,8'hC4,8'h65,8'h24})|
	    (curr_cycle == 3)&(curr_ir inside {8'hED,8'h4D,8'h6D,8'hEC,8'h2D,8'hCC,8'hCD,8'h0D,8'h2C})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE9,8'hE0,8'h09,8'hC0,8'h69,8'h49,8'h29,8'hC9}))
		alu_in_rhs = G_rd_data;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h09)|
	    (curr_cycle == 2)&(curr_ir == 8'h05)|
	    (curr_cycle == 3)&(curr_ir == 8'h0D))
		next_a = alu_or;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hED,8'h4D,8'h6D,8'hAD,8'h2D,8'h0D})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE9,8'h09,8'h69,8'h49,8'hA9,8'h29,8'h8A,8'h98})|
	    (curr_cycle == 2)&(curr_ir inside {8'hE5,8'h45,8'h05,8'hA5,8'h25,8'h65}))
		next_p[Z_bit] = next_a == 0;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hED,8'h4D,8'h6D,8'hAD,8'h2D,8'h0D})|
	    (curr_cycle == 1)&(curr_ir inside {8'hE9,8'h09,8'h69,8'h49,8'hA9,8'h29,8'h8A,8'h98})|
	    (curr_cycle == 2)&(curr_ir inside {8'hE5,8'h45,8'h05,8'hA5,8'h25,8'h65}))
		next_p[N_bit] = next_a[7];
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h28,8'h60,8'h68,8'h20,8'h40})|
	    (curr_cycle == 2)&(curr_ir inside {8'h68,8'h20,8'h40,8'h08,8'h60,8'h28,8'h48})|
	    (curr_cycle == 4)&(curr_ir inside {8'h40,8'h20,8'h60})|
	    (curr_cycle == 5)&(curr_ir == 8'h40))
		G_addr = curr_sp;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h8C,8'h20,8'h8D,8'h8E})|
	    (curr_cycle == 2)&(curr_ir inside {8'h85,8'h86,8'h08,8'h84,8'h48})|
	    (curr_cycle == 4)&(curr_ir == 8'h20))
		G_rdwr = 0;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h08))
		G_wr_data = curr_p | B_mask;
	
	if ((curr_cycle == 3)&(curr_ir == 8'h20)|
	    (curr_cycle == 4)&(curr_ir == 8'h20)|
	    (curr_cycle == 2)&(curr_ir inside {8'h08,8'h48}))
		next_s = curr_s - 1;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hAE,8'h4C,8'hCD,8'h8E,8'h0D,8'h2D,8'hCC,8'h8C,8'hAD,8'hEC,8'h8D,8'h4D,8'hAC,8'hED,8'h0C,8'h6D,8'h2C})|
	    (curr_cycle == 5)&(curr_ir == 8'h20))
		next_adh = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hAE,8'h8C,8'hED,8'hAC,8'h4D,8'h0D,8'h2C,8'h2D,8'hCC,8'hEC,8'h8D,8'hAD,8'h8E,8'h0C,8'h6D,8'hCD}))
		{next_pch, next_pcl} = curr_pc;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h10))
		next_cycle = (~curr_p[N_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir inside {8'h70,8'h30,8'h50,8'h10,8'hB0,8'hD0,8'h90,8'hF0}))
		{next_adh, next_adl} = {8'h00, G_rd_data} + (curr_pc + 1) - {7'h00, G_rd_data[7], 8'h00};
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h10,8'hD0,8'h30,8'h50,8'hF0,8'hB0,8'h70,8'h90}))
		G_addr = {curr_pch, curr_adl};
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h10,8'hD0,8'h30,8'h50,8'hF0,8'hB0,8'h70,8'h90}))
		{next_pch, next_pcl} = curr_ad;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h10,8'hD0,8'h30,8'h50,8'hF0,8'hB0,8'h70,8'h90}))
		next_cycle = ((curr_adh != curr_pch) ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'h18))
		next_p = curr_p & ~C_mask;
	
	if ((curr_cycle == 3)&(curr_ir == 8'h20))
		G_wr_data = curr_pch;
	
	if ((curr_cycle == 4)&(curr_ir == 8'h20))
		G_wr_data = curr_pcl;
	
	if ((curr_cycle == 5)&(curr_ir == 8'h20)|
	    (curr_cycle == 2)&(curr_ir == 8'h4C))
		{next_pch, next_pcl} = next_ad;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h24)|
	    (curr_cycle == 3)&(curr_ir == 8'h2C))
		next_p[Z_bit] = alu_and == 0;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h24)|
	    (curr_cycle == 3)&(curr_ir == 8'h2C))
		next_p[V_bit] = G_rd_data[6];
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h68,8'h2C})|
	    (curr_cycle == 2)&(curr_ir == 8'h24))
		next_p[N_bit] = G_rd_data[7];
	
	if ((curr_cycle == 2)&(curr_ir == 8'h25)|
	    (curr_cycle == 3)&(curr_ir == 8'h2D)|
	    (curr_cycle == 1)&(curr_ir == 8'h29))
		next_a = alu_and;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h68,8'h40,8'h60,8'h28})|
	    (curr_cycle == 4)&(curr_ir == 8'h40)|
	    (curr_cycle == 3)&(curr_ir inside {8'h60,8'h40}))
		next_s = curr_s + 1;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h28,8'h40}))
		next_p = G_rd_data;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h30))
		next_cycle = (curr_p[N_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'h38))
		next_p = curr_p | C_mask;
	
	if ((curr_cycle == 4)&(curr_ir == 8'h40)|
	    (curr_cycle == 3)&(curr_ir == 8'h60))
		next_pcl = G_rd_data;
	
	if ((curr_cycle == 5)&(curr_ir == 8'h40)|
	    (curr_cycle == 4)&(curr_ir == 8'h60))
		next_pch = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir == 8'h4D)|
	    (curr_cycle == 2)&(curr_ir == 8'h45)|
	    (curr_cycle == 1)&(curr_ir == 8'h49))
		next_a = alu_xor;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'h85,8'h48})|
	    (curr_cycle == 3)&(curr_ir == 8'h8D))
		G_wr_data = curr_a;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h50))
		next_cycle = (~curr_p[V_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'h58))
		next_p = curr_p & ~I_mask;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'hED,8'h6D})|
	    (curr_cycle == 2)&(curr_ir inside {8'h65,8'hE5})|
	    (curr_cycle == 1)&(curr_ir inside {8'h69,8'hE9}))
		alu_in_c = curr_p[C_bit];
	
	if ((curr_cycle == 2)&(curr_ir == 8'h65)|
	    (curr_cycle == 3)&(curr_ir == 8'h6D)|
	    (curr_cycle == 1)&(curr_ir == 8'h69))
		next_a = alu_adc[7:0];
	
	if ((curr_cycle == 2)&(curr_ir == 8'h65)|
	    (curr_cycle == 3)&(curr_ir == 8'h6D)|
	    (curr_cycle == 1)&(curr_ir == 8'h69))
		next_p[C_bit] = alu_adc_c;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h65)|
	    (curr_cycle == 3)&(curr_ir == 8'h6D)|
	    (curr_cycle == 1)&(curr_ir == 8'h69))
		next_p[V_bit] = alu_adc_v;
	
	if ((curr_cycle == 3)&(curr_ir inside {8'h68,8'hAD})|
	    (curr_cycle == 2)&(curr_ir == 8'hA5)|
	    (curr_cycle == 1)&(curr_ir == 8'hA9))
		next_a = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir == 8'h68))
		next_p[Z_bit] = G_rd_data == 0;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h70))
		next_cycle = (curr_p[V_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'h78))
		next_p = curr_p | I_mask;
	
	if ((curr_cycle == 2)&(curr_ir == 8'h84)|
	    (curr_cycle == 3)&(curr_ir == 8'h8C))
		G_wr_data = curr_y;
	
	if ((curr_cycle == 3)&(curr_ir == 8'h8E)|
	    (curr_cycle == 2)&(curr_ir == 8'h86))
		G_wr_data = curr_x;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h88))
		next_y = curr_y - 1;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hA4)|
	    (curr_cycle == 1)&(curr_ir inside {8'hA8,8'hC8,8'hA0,8'h88})|
	    (curr_cycle == 3)&(curr_ir == 8'hAC))
		next_p[Z_bit] = next_y == 0;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hA4)|
	    (curr_cycle == 1)&(curr_ir inside {8'hA8,8'hC8,8'hA0,8'h88})|
	    (curr_cycle == 3)&(curr_ir == 8'hAC))
		next_p[N_bit] = next_y[7];
	
	if ((curr_cycle == 1)&(curr_ir == 8'h8A))
		next_a = curr_x;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h90))
		next_cycle = (~curr_p[C_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'h98))
		next_a = curr_y;
	
	if ((curr_cycle == 1)&(curr_ir == 8'h9A))
		next_s = curr_x;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hA0)|
	    (curr_cycle == 2)&(curr_ir == 8'hA4)|
	    (curr_cycle == 3)&(curr_ir == 8'hAC))
		next_y = G_rd_data;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hA6)|
	    (curr_cycle == 1)&(curr_ir == 8'hA2)|
	    (curr_cycle == 3)&(curr_ir == 8'hAE))
		next_x = G_rd_data;
	
	if ((curr_cycle == 3)&(curr_ir == 8'hAE)|
	    (curr_cycle == 1)&(curr_ir inside {8'hE8,8'hA2,8'hCA,8'hAA,8'hBA})|
	    (curr_cycle == 2)&(curr_ir == 8'hA6))
		next_p[N_bit] = next_x[7];
	
	if ((curr_cycle == 3)&(curr_ir == 8'hAE)|
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
		next_p = curr_p & ~V_mask;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hBA))
		next_x = curr_s;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hC4)|
	    (curr_cycle == 1)&(curr_ir == 8'hC0)|
	    (curr_cycle == 3)&(curr_ir == 8'hCC))
		alu_in_lhs = curr_y;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE4,8'hC4})|
	    (curr_cycle == 1)&(curr_ir inside {8'hC9,8'hC0,8'hE0})|
	    (curr_cycle == 3)&(curr_ir inside {8'hCC,8'hEC,8'hCD}))
		next_p[Z_bit] = alu_cmp_z;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE4,8'hC4})|
	    (curr_cycle == 1)&(curr_ir inside {8'hC9,8'hC0,8'hE0})|
	    (curr_cycle == 3)&(curr_ir inside {8'hCC,8'hEC,8'hCD}))
		next_p[N_bit] = alu_cmp_n;
	
	if ((curr_cycle == 2)&(curr_ir inside {8'hC5,8'hE4,8'hC4})|
	    (curr_cycle == 1)&(curr_ir inside {8'hC9,8'hC0,8'hE0})|
	    (curr_cycle == 3)&(curr_ir inside {8'hCC,8'hEC,8'hCD}))
		next_p[C_bit] = alu_cmp_c;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hC8))
		next_y = curr_y + 1;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hCA))
		next_x = curr_x - 1;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hD0))
		next_cycle = (~curr_p[Z_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'hD8))
		next_p = curr_p & ~D_mask;
	
	if ((curr_cycle == 2)&(curr_ir == 8'hE4)|
	    (curr_cycle == 3)&(curr_ir == 8'hEC)|
	    (curr_cycle == 1)&(curr_ir == 8'hE0))
		alu_in_lhs = curr_x;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hE9)|
	    (curr_cycle == 3)&(curr_ir == 8'hED)|
	    (curr_cycle == 2)&(curr_ir == 8'hE5))
		next_a = alu_sbc[7:0];
	
	if ((curr_cycle == 1)&(curr_ir == 8'hE9)|
	    (curr_cycle == 3)&(curr_ir == 8'hED)|
	    (curr_cycle == 2)&(curr_ir == 8'hE5))
		next_p[C_bit] = alu_sbc_c;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hE9)|
	    (curr_cycle == 3)&(curr_ir == 8'hED)|
	    (curr_cycle == 2)&(curr_ir == 8'hE5))
		next_p[V_bit] = alu_sbc_v;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hE8))
		next_x = curr_x + 1;
	
	if ((curr_cycle == 1)&(curr_ir == 8'hF0))
		next_cycle = (curr_p[Z_bit] ? (curr_cycle + 1) : 0);
	
	if ((curr_cycle == 1)&(curr_ir == 8'hF8))
		next_p = curr_p | D_mask;
	
	if ((curr_cycle == 0))
		next_ir = G_rd_data;
	