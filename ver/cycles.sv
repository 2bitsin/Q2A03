
	if (t0 | (o1 & o2 & o3 & o5 & o7 & t1 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o3 & o5 & o7 & t2 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o3 & o7 & t1 & ~o0 & ~o4 & ~o5 & ~o6) | (o1 & o2 & o3 & o7 & t2 & ~o0 & ~o4 & ~o5 & ~o6) | (o1 & o2 & o5 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o6) | (o1 & o2 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o5 & ~o6) | (o1 & o5 & o7 & t1 & ~o0 & ~o2 & ~o3 & ~o4 & ~o6) | (o2 & o3 & o6 & t1 & ~o0 & ~o1 & ~o4 & ~o5 & ~o7) | (o2 & o3 & o6 & t2 & ~o0 & ~o1 & ~o4 & ~o5 & ~o7))
		G_addr = curr_pc;
	if (t0 | (o1 & o2 & o3 & o5 & o7 & t1 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o3 & o5 & o7 & t2 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o3 & o7 & t1 & ~o0 & ~o4 & ~o5 & ~o6) | (o1 & o2 & o5 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o6) | (o1 & o2 & o5 & o7 & t2 & ~o0 & ~o3 & ~o4 & ~o6) | (o1 & o2 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o5 & ~o6) | (o1 & o5 & o7 & t1 & ~o0 & ~o2 & ~o3 & ~o4 & ~o6) | (o2 & o3 & o6 & t1 & ~o0 & ~o1 & ~o4 & ~o5 & ~o7) | (o2 & o3 & o6 & t2 & ~o0 & ~o1 & ~o4 & ~o5 & ~o7))
		G_rdwr = 1;
	if (t0 | (o1 & o2 & o3 & o5 & o7 & t1 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o3 & o5 & o7 & t2 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o3 & o7 & t1 & ~o0 & ~o4 & ~o5 & ~o6) | (o1 & o2 & o3 & o7 & t2 & ~o0 & ~o4 & ~o5 & ~o6) | (o1 & o2 & o5 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o6) | (o1 & o2 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o5 & ~o6) | (o1 & o5 & o7 & t1 & ~o0 & ~o2 & ~o3 & ~o4 & ~o6) | (o2 & o3 & o6 & t1 & ~o0 & ~o1 & ~o4 & ~o5 & ~o7))
		{next_pch, next_pcl} = curr_pc + 1;
	if ((o1 & o2 & o3 & o5 & o7 & t1 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o3 & o7 & t1 & ~o0 & ~o4 & ~o5 & ~o6) | (o1 & o2 & o5 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o6) | (o1 & o2 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o5 & ~o6) | (o2 & o3 & o6 & t1 & ~o0 & ~o1 & ~o4 & ~o5 & ~o7))
		next_adl = G_rd_data;
	if (t0 | (o1 & o2 & o3 & o5 & o7 & t1 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o3 & o7 & t1 & ~o0 & ~o4 & ~o5 & ~o6) | (o1 & o2 & o5 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o6) | (o1 & o2 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o5 & ~o6) | (o2 & o3 & o6 & t1 & ~o0 & ~o1 & ~o4 & ~o5 & ~o7))
		next_cycle = curr_cycle + 1;
	if (o2 & o3 & o6 & t2 & ~o0 & ~o1 & ~o4 & ~o5 & ~o7)
		{next_pch, next_pcl} = next_ad;
	if ((o1 & o2 & o3 & o5 & o7 & t2 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o3 & o7 & t2 & ~o0 & ~o4 & ~o5 & ~o6) | (o2 & o3 & o6 & t2 & ~o0 & ~o1 & ~o4 & ~o5 & ~o7))
		next_adh = G_rd_data;
	if ((o1 & o2 & o3 & o5 & o7 & t2 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o3 & o7 & t2 & ~o0 & ~o4 & ~o5 & ~o6) | (o1 & o2 & o5 & o7 & t2 & ~o0 & ~o3 & ~o4 & ~o6) | (o1 & o2 & o7 & t2 & ~o0 & ~o3 & ~o4 & ~o5 & ~o6) | (o1 & o5 & o7 & t1 & ~o0 & ~o2 & ~o3 & ~o4 & ~o6) | (o2 & o3 & o6 & t2 & ~o0 & ~o1 & ~o4 & ~o5 & ~o7))
		next_cycle = 0;
	if ((o1 & o2 & o5 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o6) | (o1 & o2 & o7 & t1 & ~o0 & ~o3 & ~o4 & ~o5 & ~o6))
		next_adh = 0;
	if ((o1 & o2 & o5 & o7 & t2 & ~o0 & ~o3 & ~o4 & ~o6) | (o1 & o2 & o7 & t2 & ~o0 & ~o3 & ~o4 & ~o5 & ~o6))
		G_addr = curr_ad;
	if ((o1 & o2 & o3 & o7 & t2 & ~o0 & ~o4 & ~o5 & ~o6) | (o1 & o2 & o7 & t2 & ~o0 & ~o3 & ~o4 & ~o5 & ~o6))
		G_rdwr = 0;
	if ((o1 & o2 & o3 & o7 & t2 & ~o0 & ~o4 & ~o5 & ~o6) | (o1 & o2 & o7 & t2 & ~o0 & ~o3 & ~o4 & ~o5 & ~o6))
		G_wr_data = curr_x;
	if ((o1 & o2 & o3 & o5 & o7 & t2 & ~o0 & ~o4 & ~o6) | (o1 & o2 & o5 & o7 & t2 & ~o0 & ~o3 & ~o4 & ~o6) | (o1 & o5 & o7 & t1 & ~o0 & ~o2 & ~o3 & ~o4 & ~o6))
		next_x = G_rd_data;
	if (t0)
		next_ir = G_rd_data;