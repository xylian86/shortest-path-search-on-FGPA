
/*This module includes the logic compartor we design for the decode part, NZP logic and BEN logic.  */


//NZP logic is used to determine the output value of N,Z,P, according to whether the value in BUS is negative, positive or zero. eg: 
//If the value is BUS is negative, N will be 1, and Z=0, P=0. 
module NZP_LOGIC(input logic [15:0] BUSRESULT, 
					  output logic N, Z, P);
always_comb 
	begin
		N=1'b0;
		Z=1'b0;
		P=1'b0;
		if (BUSRESULT[15]==1'b1)
			N = 1'b1;
		else if (BUSRESULT==16'b0)
			Z=1'b1;
		else
			P=1'b1;
	end
	
endmodule


//BEN logic is used to control the BR functions.
module BEN_LOGIC(input logic N, Z, P,
			        input logic[2:0] c,
					  output logic BENRESULT);

always_comb
	begin
		BENRESULT=1'b0;
		if(((N&c[2])|(Z&c[1])|(P&c[0])))
			BENRESULT=1'b1;
	end
endmodule