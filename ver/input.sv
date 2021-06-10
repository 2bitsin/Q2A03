module input (I_clock, I_reset, I_GPIO_state, O_joy_mode, I_GPIO_strobe, I_GPIO_rden, O_GPIO_data);

  input   wire            I_clock;
  input   wire            I_reset;
  input   wire[1:0][5:0]  I_GPIO_state;
  output  wire[1:0]       O_joy_mode;

  input   wire[1:0]       I_GPIO_strobe;
  input   wire[1:0]       I_GPIO_rden;
  output  wire[1:0]       O_GPIO_data;

  bit[7:0]        clock_divide    ;

  bit[1:0][7:0]   curr_GPIO_state   ;
  bit[1:0][7:0]   next_GPIO_state   ;

  bit[1:0]        last_GPIO_rden  ;
  bit[1:0][7:0]   latch_bits      ;

  assign          O_joy_mode[0]   = clock_divide[$high(clock_divide)] ;
  assign          O_joy_mode[1]   = clock_divide[$high(clock_divide)] ;
  assign          O_GPIO_data[0]  = latch_bits[0][0] ;  
  assign          O_GPIO_data[1]  = latch_bits[1][0] ;

  always_ff @(posedge I_sys_clock)
  begin
    clock_divide      <= clock_divide + 1 ;    

    curr_GPIO_state     <= next_GPIO_state ;    
    last_GPIO_rden[0] <= I_GPIO_rden[0] ; 
    last_GPIO_rden[1] <= I_GPIO_rden[1] ; 

    if (I_GPIO_strobe[0]) 
      latch_bits[0] <= curr_GPIO_state[0];
    if (I_GPIO_strobe[1]) 
      latch_bits[1] <= curr_GPIO_state[1];
    if (last_GPIO_rden[0] & ~I_GPIO_rden[0]) 
      latch_bits[0] <= latch_bits[0] >> 1;
    if (last_GPIO_rden[1] & ~I_GPIO_rden[1]) 
      latch_bits[1] <= latch_bits[1] >> 1;
  end

  always_comb
  begin
    next_GPIO_state = 16'b0;
    if (I_sys_reset)
    begin
     /*
      * Up    (0, if sel = *)
      * Down  (1, if sel = *)
      * Left  (2, if sel = 1)
      * Right (3, if sel = 1)
      * A     (4, if sel = 0)
      * B     (4, if sel = 1)
      * C     (5, if sel = 1)
      * Start (5, if sel = 0)
      *****************************/

      next_GPIO_state = curr_GPIO_state;

      next_GPIO_state[0][5:4] = I_joy_bits[0][1:0];
      next_GPIO_state[1][5:4] = I_joy_bits[1][1:0];

      if (clock_divide[$high(clock_divide)])
      begin
        next_GPIO_state[0][7:6] = I_joy_bits[0][3:2];
        next_GPIO_state[1][7:6] = I_joy_bits[1][3:2];

        next_GPIO_state[0][0] = I_joy_bits[0][4];
        next_GPIO_state[0][2] = I_joy_bits[0][5];
        next_GPIO_state[1][0] = I_joy_bits[1][4];
        next_GPIO_state[1][2] = I_joy_bits[1][5];
      end else begin
        next_GPIO_state[0][1] = I_joy_bits[0][4];
        next_GPIO_state[0][3] = I_joy_bits[0][5];
        next_GPIO_state[1][1] = I_joy_bits[1][4];
        next_GPIO_state[1][3] = I_joy_bits[1][5];
      end
    end
  end


endmodule