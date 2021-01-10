module testbench();

timeunit 10ns;

timeprecision 1ns;

logic Clk;

logic [15:0] S;

logic Run, Reset, Continue;

logic [11:0] LED;

logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

logic CE, UB, LB, OE, WE;

logic [19:0] ADDR;

wire [15:0] Data;

lab6_toplevel lab6_toplevel(.*);
	

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

initial begin: TEST_VECTORS
Reset = 1'b1;		//reset is inactive
Run = 1'b1; 
Continue = 1'b1;
S = 16'b0;

#2 Reset = 0;//trigger Reset
#2 Reset = 1;
#2 Run = 0;//triger Run
#2 Run = 1;

#20 Continue = 1'b0;
#2 Continue = 1'b1;

#20 Continue = 1'b0;
#2 Continue = 1'b1;

#20 Continue = 1'b0;
#2 Continue = 1'b1;

end
endmodule
