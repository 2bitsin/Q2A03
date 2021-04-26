
module video (
	I_clock, 
	I_reset, 
	O_vid_clock, 
	O_vid_blank, 
	O_vid_hsync,
	O_vid_vsync, 
	O_vid_red, 
	O_vid_green, 
	O_vid_blue);

	input		wire			I_clock ;
	input 	wire			I_reset ;

	output 	wire 			O_vid_clock ;
	output 	wire 			O_vid_blank ;
	output 	bit 			O_vid_hsync ;
	output 	bit				O_vid_vsync ;
	output 	wire[7:0] O_vid_red ;
	output 	wire[7:0] O_vid_green ;
	output 	wire[7:0] O_vid_blue ;

	
	localparam G_active_h 		= 256;
	localparam G_active_v 		= 240;
	localparam G_front_h 			= 9;
	localparam O_sync_h 			= 51;
	localparam G_back_h 			= 25;
	localparam G_front_v 			= 5;
	localparam O_sync_v 			= 1;
	localparam G_back_v 			= 16;
	localparam G_blank_h  		= G_front_h + O_sync_h + G_back_h;
	localparam G_blank_v 			= G_front_v + O_sync_v + G_back_v;	
	localparam G_ticks_h 			= G_active_h + G_blank_h;
	localparam G_ticks_v			= G_active_v + G_blank_v;		
	
	bit[15:0] 	counter_v			= 0;
	bit[15:0] 	counter_h			= 0;		
	assign 			O_vid_clock 	= I_clock;
	assign 			O_vid_blank 	= counter_v >= G_blank_v && counter_h >= G_blank_h;
	

	always @(posedge I_clock, negedge I_reset)
	begin
		if (~reset) begin
			counter_v <= 0;
			counter_h <= 0;
			O_vid_hsync <= 0;
			O_vid_vsync <= 0;
		end
		else begin
										
			if (counter_h != G_ticks_h - 1) 
				counter_h <= counter_h + 1;				
			else begin
				counter_h <= 0;
				if (counter_v != G_ticks_v - 1) 
					counter_v <= counter_v + 1;
				else 
					counter_v <= 0;
			end  				
				
			O_vid_hsync <= (counter_h < G_front_h) || (counter_h >= (G_blank_h - G_back_h));
			O_vid_vsync <= (counter_v < G_front_v) || (counter_v >= (G_blank_v - G_back_v));
		end
	end

endmodule