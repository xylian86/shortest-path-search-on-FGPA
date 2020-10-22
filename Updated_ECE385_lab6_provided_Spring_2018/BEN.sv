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

module BEN_LOGIC(input logic N, Z, P,
			        input logic[2:0] c,
					  output logic BENRESULT);
logic temp;
always_comb
	begin
		BENRESULT=1'b0;
		temp=((N&c[2])|(Z&c[1])|(P&c[0]));
		if(temp==1'b1)
			BENRESULT=1'B1;
	end
endmodule