module double_pulse_trigger (
  input wire           clk,
  input  wire           trigger,
  input  wire [15:0]   window,
  input  wire [7:0]   veto,
  output reg           double_trig,
  output reg [15:0] delta_time 
);
  reg [15:0] counter = 16'd0;

  reg Q1,Q2,Q3;
  wire int_trig;
  reg busy = 1'b0;

  always @(posedge clk, posedge int_trig)
  begin
  if (int_trig) begin
    if (counter >= window)
      counter <= 16'd0;
    else if ((counter > {8'd0,veto}) && (counter < window))
      double_trig <= 1'b1;
      delta_time <= counter;
  end 
  else begin
    if (counter < window)
      counter <= counter + 1'b1;
    else if (counter == window)
     double_trig <= 1'b0;
  end
  end
always @(posedge clk)
begin
      Q1 <= trigger; 
      Q2 <= Q1;
      Q3 <= Q2;
end

assign int_trig = (Q1 & Q2 & (~Q3));
endmodule
