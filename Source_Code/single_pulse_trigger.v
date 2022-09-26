
module single-pulse-trigger (
  input  wire          adc_clk,
  input  wire [13:0]   adc_dat_a_in,
  input  wire [13:0]   treshold,
  output reg           trig_out,
  output reg [13:0]    adc_dat_a_out
);
  reg [13:0] int_dat_a_reg;
  reg [13:0] int_treshold;

  always @(posedge adc_clk)
  begin
    adc_dat_a_out <= adc_dat_a_in;
    if (adc_dat_a > treshold) // neg edge
    trig_out <= 1'b1;
    else
    trig_out <= 1'b0;
  end
endmodule