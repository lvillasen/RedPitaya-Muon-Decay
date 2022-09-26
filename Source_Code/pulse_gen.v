
module pulse_gen (
  input     wire        clk,
  input     wire        start,
  output    wire        pulse,
  input     wire [15:0] time_double,
  input     wire [11:0] width 
);
  reg [16:0]    counter = 17'd0;
  reg   int_pulse, Q1,Q2,Q3;


  always @(posedge clk, posedge int_start)
  begin

  if (int_start)
    counter <= 17'd0;
  else
    begin
      if (counter < (time_double + width +1))
        counter <= counter +1;
    if (counter < width || ((counter >= time_double) && (counter < (time_double + width) ))) 
      int_pulse <= 1'b1;
    else 
      int_pulse <= 1'b0;

    end
  end

    always @(posedge clk)
  begin
      Q1 <= start; 
      Q2 <= Q1;
      Q3 <= Q2;
  end

  
assign pulse = int_pulse;
assign int_start = Q1 && Q2 && (~ Q3);
endmodule
