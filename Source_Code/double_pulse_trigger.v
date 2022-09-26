module double_pulse_trigger (
  input wire           clk,
  input  wire           trigger,
  input  wire [15:0]   window,
  output reg           double_trig
);
  reg [15:0] counter = 16'd0;   
  reg Q1,Q2,Q3;
  wire int_trig;
  reg busy = 1'b0;

  always @(posedge clk, posedge int_trig)
  begin
  if (int_trig) begin
    counter <= 16'd0;
    if (busy)
      double_trig <= 1'b1;
    else
      double_trig <= 1'b0;
  end else begin
    if (counter < window)
    counter <= counter +1;
  end
  end

always @(counter)
  begin
    if ((counter > 16'd0) && (counter < window))
      busy <= 1'b1;
    else
      busy <= 1'b0;
  end





always @(posedge clk)
begin
      Q1 <= trigger; 
      Q2 <= Q1;
      Q3 <= Q2;
end

assign int_trig = (Q1 & Q2 & (~Q3));
endmodule
