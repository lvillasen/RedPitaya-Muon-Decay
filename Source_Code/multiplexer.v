module multiplexer( 
input 				Trig_Single, 
input  				Trig_Double, 
input [6:0] 		LED_Single,
input [6:0] 		LED_Double,
input 				S,
output reg 			Trig_Out,
output reg 	[6:0]	LED_Out
);

always @(Trig_Single or Trig_Double or S)
begin
if(S) 
	Trig_Out= Trig_Double;
else
	Trig_Out=Trig_Single;
end

always @(LED_Single or LED_Double or S)
begin
if(S) 
	LED_Out= LED_Double;
else
	LED_Out=LED_Single;
end

endmodule

