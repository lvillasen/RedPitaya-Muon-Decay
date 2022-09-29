module counter (
input CLK, 
input CLR, 
output [15:0] Counter_Out
); 
 
reg [15:0] counter; 
 
  always @(posedge CLK or posedge CLR) 
    begin 
      if (CLR) 
        counter = 16'd0; 
      else 
        counter = counter + 1'b1; 
      end 
  assign Counter_Out = counter; 
endmodule 