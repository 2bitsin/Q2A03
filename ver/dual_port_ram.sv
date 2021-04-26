`define CLOG2(x) 		         \
	((x) < 32'h00000001 ?  0 : \
	((x) < 32'h00000002 ?  1 : \
	((x) < 32'h00000004 ?  2 : \
	((x) < 32'h00000008 ?  3 : \
	((x) < 32'h00000010 ?  4 : \
	((x) < 32'h00000020 ?  5 : \
	((x) < 32'h00000040 ?  6 : \
	((x) < 32'h00000080 ?  7 : \
	((x) < 32'h00000100 ?  8 : \
	((x) < 32'h00000200 ?  9 : \
	((x) < 32'h00000400 ? 10 : \
	((x) < 32'h00000800 ? 11 : \
	((x) < 32'h00001000 ? 12 : \
	((x) < 32'h00002000 ? 13 : \
	((x) < 32'h00004000 ? 14 : \
	((x) < 32'h00008000 ? 15 : \
	((x) < 32'h00010000 ? 16 : \
	((x) < 32'h00020000 ? 17 : \
	((x) < 32'h00040000 ? 18 : \
	((x) < 32'h00080000 ? 19 : \
	((x) < 32'h00100000 ? 20 : \
	((x) < 32'h00200000 ? 21 : \
	((x) < 32'h00400000 ? 22 : \
	((x) < 32'h00800000 ? 23 : \
	((x) < 32'h01000000 ? 24 : \
	((x) < 32'h02000000 ? 25 : \
	((x) < 32'h04000000 ? 26 : \
	((x) < 32'h08000000 ? 27 : \
	((x) < 32'h10000000 ? 28 : \
	((x) < 32'h20000000 ? 29 : \
	((x) < 32'h40000000 ? 30 : \
	((x) < 32'h80000000 ? 31 : 32))))))))))))))))))))))))))))))))

	
module dual_port_ram #(parameter P_size = 1024) (I_clock0, G_cs0, O_addr0, O_rdwr0, I_rd_data0, O_wr_data0,
                                                 I_clock1, G_cs1, O_addr1, O_rdwr1, I_rd_data1, O_wr_data1);		
		localparam Ax = `CLOG2(P_size - 1) - 1;
		
		input wire 				I_clock0;
		input wire 				G_cs0;
		input wire 				O_rdwr0;
		input wire[Ax:0]	O_addr0;
		input wire[7:0]		O_wr_data0;			
		output wire[7:0]  I_rd_data0;
		
		input wire 				I_clock1;
		input wire 				G_cs1;
		input wire 				O_rdwr1;
		input wire[Ax:0]	O_addr1;
		input wire[7:0]		O_wr_data1;
		output wire[7:0]  I_rd_data1;
		
		bit[7:0] storage [0:P_size - 1];
		
		reg[7:0] buff0;
		reg[7:0] buff1;
		
		assign I_rd_data0 = G_cs0 ? buff0 : {8{1'bZ}};
		assign I_rd_data1 = G_cs1 ? buff1 : {8{1'bZ}};
		
		always @(posedge I_clock0) if (G_cs0) 
		begin
			if (~O_rdwr0)				
				storage[O_addr0] <= O_wr_data0;		
			buff0 <= storage[O_addr0];
		end
		
		always @(posedge I_clock1) if (G_cs1) 
		begin
			if (~O_rdwr1)
				storage[O_addr1] <= O_wr_data1;		
			buff1 <= storage[O_addr1];			
		end		
	
endmodule