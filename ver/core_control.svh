
always @*
begin
  next_t = curr_t;
  
       if (G_control[  0]) next_t = curr_t_p1;
  else if (G_control[ 13]) next_t = 0;
  else if (G_control[ 35]) next_t = (~curr_p[N_bit] ? (curr_t_p1) : 0);
  else if (G_control[ 45]) next_t = I_addr_carry ^ curr_ba[0] ? curr_t_p1 : 0;
  else if (G_control[ 49]) next_t = curr_t_p1 + 4'(!O_addr_carry);
  else if (G_control[ 56]) next_t = ( curr_p[N_bit] ? (curr_t_p1) : 0);
  else if (G_control[ 62]) next_t = (~curr_p[V_bit] ? (curr_t_p1) : 0);
  else if (G_control[ 68]) next_t = ( curr_p[V_bit] ? (curr_t_p1) : 0);
  else if (G_control[ 77]) next_t = (~curr_p[C_bit] ? (curr_t_p1) : 0);
  else if (G_control[ 80]) next_t = ( curr_p[C_bit] ? (curr_t_p1) : 0);
  else if (G_control[ 86]) next_t = (~curr_p[Z_bit] ? (curr_t_p1) : 0);
  else if (G_control[ 89]) next_t = ( curr_p[Z_bit] ? (curr_t_p1) : 0);
  
end

always @*
begin
  O_addr = curr_pc;
  
       if (G_control[  1]) O_addr = curr_sp;
  else if (G_control[  8]) O_addr = vec_addr_lo;
  else if (G_control[ 10]) O_addr = vec_addr_hi;
  else if (G_control[ 17]) O_addr = curr_ba;
  else if (G_control[ 22]) O_addr = curr_ad;
  
end

always @*
begin
  O_rdwr = 1;
  
       if (G_control[  2]) O_rdwr = 0;
  
end

always @*
begin
  O_wr_data = 0;
  
       if (G_control[  3]) O_wr_data = curr_pc[15:8];
  else if (G_control[  6]) O_wr_data = curr_pc[7:0];
  else if (G_control[  7]) O_wr_data = curr_p_wr;
  else if (G_control[ 30]) O_wr_data = curr_dr;
  else if (G_control[ 34]) O_wr_data = O_alu_result;
  
end

always @*
begin
  next_s = curr_s;
  
       if (G_control[  4]) next_s = curr_s_m1;
  else if (G_control[ 54]) next_s = curr_s_p1;
  else if (G_control[ 78]) next_s = curr_x;
  
end

always @*
begin
  next_p[N_bit] = O_alu_sign;
  next_p[Z_bit] = O_alu_zero;
  next_p[B_bit] = curr_p[B_bit];
  next_p[X_bit] = 1'b1;
  next_p[V_bit] = O_alu_overflow;
  next_p[C_bit] = O_alu_carry;
  next_p[I_bit] = curr_p[I_bit];
  next_p[D_bit] = curr_p[D_bit];


  if (G_control[ 55]) 
    next_p = I_rd_data;
  else begin
         if (G_control[  5]) next_p[I_bit] = force_irq_mask;
    else if (G_control[ 63]) next_p[I_bit] = 0;
    else if (G_control[ 69]) next_p[I_bit] = 1;
    
         if (G_control[ 50]) next_p[C_bit] = 0;
    else if (G_control[ 57]) next_p[C_bit] = 1;
    
         if (G_control[ 81]) next_p[V_bit] = 0;
    
         if (G_control[ 87]) next_p[D_bit] = 0;
    else if (G_control[ 90]) next_p[D_bit] = 1;
  end
  
end

always @*
begin
  next_ad[7:0] = curr_ad[7:0];
  
       if (G_control[  9]) next_ad[7:0] = I_rd_data;
  else if (G_control[ 38]) next_ad[7:0] = O_addr_sum;
  else if (G_control[ 47]) next_ad[7:0] = O_addr_lhs_p1;
  
end

always @*
begin
  next_ad[15:8] = curr_ad[15:8];
  
       if (G_control[ 11]) next_ad[15:8] = I_rd_data;
  else if (G_control[ 31]) next_ad[15:8] = 0;
  else if (G_control[ 39]) next_ad[15:8] = curr_pc_p1[15:8];
  else if (G_control[ 43]) next_ad[15:8] = O_addr_sum;
  
end

always @*
begin
  next_pc = curr_pc;
  
       if (G_control[ 12]) next_pc = next_ad;
  else if (G_control[ 14]) next_pc = curr_pc_p1;
  else if (G_control[ 44]) next_pc = curr_ad;
  else if (G_control[ 91]) next_pc = ~force_brk ? curr_pc_p1 : curr_pc;
  else begin
    if (G_control[ 58]) next_pc[7:0] = I_rd_data;
    if (G_control[ 59]) next_pc[15:8] = I_rd_data;
  end
end

always @*
begin
  next_ba[15:8] = curr_ba[15:8];
  
       if (G_control[ 15]) next_ba[15:8] = 0;
  else if (G_control[ 67]) next_ba[15:8] = I_rd_data;
  
end

always @*
begin
  next_ba[7:0] = curr_ba[7:0];
  
       if (G_control[ 16]) next_ba[7:0] = I_rd_data;
  else if (G_control[ 20]) next_ba[7:0] = O_addr_sum;
  else if (G_control[ 21]) next_ba[7:0] = O_addr_lhs_p1;
  else if (G_control[ 40]) next_ba[7:0] = {8{I_rd_data[7]}};
  
end

always @*
begin
  I_addr_lhs = 0;
  
       if (G_control[ 18]) I_addr_lhs = curr_ba[7:0];
  else if (G_control[ 36]) I_addr_lhs = curr_pc_p1[7:0];
  else if (G_control[ 41]) I_addr_lhs = curr_ad[15:8];
  else if (G_control[ 46]) I_addr_lhs = curr_ad[7:0];
  
end

always @*
begin
  I_addr_rhs = 0;
  
       if (G_control[ 19]) I_addr_rhs = curr_x;
  else if (G_control[ 37]) I_addr_rhs = I_rd_data;
  else if (G_control[ 42]) I_addr_rhs = curr_ba[7:0];
  else if (G_control[ 48]) I_addr_rhs = curr_y;
  
end

always @*
begin
  I_alu_ctl = control_nop;
  
       if (G_control[ 23]) I_alu_ctl = control_or;
  else if (G_control[ 27]) I_alu_ctl = control_asl;
  else if (G_control[ 51]) I_alu_ctl = control_and;
  else if (G_control[ 52]) I_alu_ctl = control_rol;
  else if (G_control[ 53]) I_alu_ctl = control_bit;
  else if (G_control[ 60]) I_alu_ctl = control_xor;
  else if (G_control[ 61]) I_alu_ctl = control_lsr;
  else if (G_control[ 64]) I_alu_ctl = control_adc;
  else if (G_control[ 65]) I_alu_ctl = control_ror;
  else if (G_control[ 66]) I_alu_ctl = control_txr;
  else if (G_control[ 74]) I_alu_ctl = control_dec;
  else if (G_control[ 76]) I_alu_ctl = control_txl;
  else if (G_control[ 83]) I_alu_ctl = control_cmp;
  else if (G_control[ 85]) I_alu_ctl = control_inc;
  else if (G_control[ 88]) I_alu_ctl = control_sbc;
  
end

always @*
begin
  I_alu_lhs = 0;
  
       if (G_control[ 24]) I_alu_lhs = curr_a;
  else if (G_control[ 28]) I_alu_lhs = I_rd_data;
  else if (G_control[ 33]) I_alu_lhs = curr_dr;
  else if (G_control[ 72]) I_alu_lhs = curr_y;
  else if (G_control[ 73]) I_alu_lhs = curr_x;
  else if (G_control[ 82]) I_alu_lhs = curr_s;
  
end

always @*
begin
  I_alu_rhs = 0;
  
       if (G_control[ 25]) I_alu_rhs = I_rd_data;
  else if (G_control[ 71]) I_alu_rhs = curr_x;
  else if (G_control[ 84]) I_alu_rhs = curr_dr;
  
end

always @*
begin
  next_a = curr_a;
  
       if (G_control[ 26]) next_a = O_alu_result;
  
end

always @*
begin
  next_dr = curr_dr;
  
       if (G_control[ 29]) next_dr = O_alu_result;
  else if (G_control[ 32]) next_dr = I_rd_data;
  
end

always @*
begin
  I_alu_mask_p = 1;
  
       if (G_control[ 70]) I_alu_mask_p = 0;
  
end

always @*
begin
  next_y = curr_y;
  
       if (G_control[ 75]) next_y = O_alu_result;
  
end

always @*
begin
  next_x = curr_x;
  
       if (G_control[ 79]) next_x = O_alu_result;
  
end

always @*
begin
  next_ir = curr_ir;
  
       if (G_control[ 92]) next_ir = ~force_brk ? I_rd_data : 8'h00;
  
end

always @*
begin
  I_alu_carry = curr_p[C_bit];
  
end

always @*
begin
  I_alu_overflow = curr_p[V_bit];
  
end

always @*
begin
  I_alu_sign = curr_p[N_bit];
  
end

always @*
begin
  I_alu_zero = curr_p[Z_bit];
  
end
