module audio_i2s (I_clock, I_reset, I_data, O_mclk, O_wclk, O_sclk, O_data);

  input   wire        I_clock;
  input   wire        I_reset;
  input   wire[15:0]  I_data;

  output  wire        O_mclk;
  output  wire        O_wclk;
  output  wire        O_sclk;
  output  bit         O_data;

  bit[7:0]    divide_mclk;
  bit[15:0]   curr_sample;  

  assign O_mclk = I_clock;
  assign O_wclk = divide_mclk [$high(divide_mclk)];
  assign O_sclk = divide_mclk [$high(divide_mclk) - 5];


  always_ff @(posedge I_clock, negedge I_reset)
  begin
    if (~I_reset)
    begin
      divide_mclk <= 8'd0;  
      curr_sample <= 16'd0;
    end else
    begin
      divide_mclk <= divide_mclk + 1;      

      if (&divide_mclk[$high(divide_mclk) - 5:0])
      begin
        O_data <= curr_sample [$high(curr_sample)];
        curr_sample <= (curr_sample << 1);
      end

      if (&divide_mclk[$high(divide_mclk) - 1:0])
        curr_sample <= I_data ;              
    end
  end

endmodule