module delay (I_clock, I_reset, I_tick, I_signal, O_signal);

  parameter P_width  = 1;
  parameter P_length = 1;

  input   wire                 I_clock;
  input   wire                 I_reset;
  input   wire                 I_tick;
  input   wire[P_width - 1: 0] I_signal;
  output  wire[P_width - 1: 0] O_signal;

  bit[P_width - 1:0] FF_delay [0:P_length-1];

  assign O_signal = FF_delay[0];

  always @(posedge I_clock, negedge I_reset)
  if (~I_reset) 
    for (integer i = 0; i < P_length; ++i)
      FF_delay[i] <= {P_width{1'b0}};
  else begin
    if (I_tick)
    begin
      for (integer i = 0; i < P_length - 1; ++i)
        FF_delay[i] <= FF_delay[i+1];
      FF_delay[P_length - 1] <= I_signal;
    end
  end
endmodule