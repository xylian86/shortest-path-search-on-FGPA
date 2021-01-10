


/*This is the datapath module for our slc3 processor. We use a mux to replace four tristates, according to the instructions
	of our lectures.*/
	
	
	
//A MUX used to determine which signal should pass into the BUS wire.
module datapath(  input logic [15:0] PC, ADDER_OUT, ALU_OUT, MDR,
						input logic GatePC, GateMDR, GateALU, GateMARMUX,
						output logic [15:0] BUSRESULT);
logic [3:0] select;
assign select={GatePC, GateMDR, GateALU, GateMARMUX};//packed design
always_comb 
	begin
		unique case(select)
		4'b1000: BUSRESULT=PC;
		4'b0100: BUSRESULT=MDR;
		4'b0010: BUSRESULT=ALU_OUT;
		4'b0001: BUSRESULT=ADDER_OUT;
		default: BUSRESULT=16'bX;
		endcase
	end
	
endmodule

