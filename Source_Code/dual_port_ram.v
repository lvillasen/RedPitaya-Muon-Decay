
module dual_port_ram (
input clka,
input clkb,
input rst,
input trig,
input  [11:0] addrb,
input  [13:0] dia,
input [11:0] pnts_after_trig,
output reg [13:0] dob,
output reg [11:0] addr_trig,
output wire enabled
);

reg Q1,Q2,Q3,QQ1,QQ2,QQ3;
reg int_ena = 1'b0;
reg [13:0] ram [4095:0];

wire int_trig,int_rst;

reg  [11:0] int_addra = 12'd0;

reg [11:0] counter;



       
always @(posedge clka)

begin

 if (int_ena )

   begin
       ram[int_addra] <= dia;
   end

end

always @(negedge clka)

begin

 if (int_ena )

   begin
       int_addra <= int_addra + 1'b1;
   end

end

always @(posedge clka, posedge int_trig)
begin
 if (int_trig && int_ena) 
 begin
      counter <= 0; 
      addr_trig <=  int_addra;
 end
  else begin  
      if (counter < pnts_after_trig)  
        
        counter <= counter + 1;  
  end  

end

always @(posedge clka, posedge int_rst)
begin
if (int_rst)
  int_ena <= 1'b1;
else if (counter == pnts_after_trig -1'b1)
  int_ena <= 1'b0;
end


always @(posedge clkb)
begin
dob <= ram[addrb];
end

always @(posedge clka)
begin
      Q1 <= rst; 
      Q2 <= Q1;
      Q3 <= Q2;
      QQ1 <= trig; 
      QQ2 <= QQ1;
      QQ3 <= QQ2;
end
assign int_rst = Q1 && Q2 && (~ Q3);

assign int_trig = QQ1 && QQ2 && (~ QQ3);
assign enabled = int_ena;
endmodule
