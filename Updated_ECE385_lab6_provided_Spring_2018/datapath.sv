
module datapath(  input logic [15:0] PC, ADDER_OUT, ALU_OUT, MDR,
						input logic GatePC, GateMDR, GateALU, GateMARMUX,
						output logic [15:0] BUSRESULT);
logic [3:0] select;
assign select={GatePC, GateMDR, GateALU, GateMARMUX};
always_comb 
	begin
		case(select)
		4'b1000: BUSRESULT=PC;
		4'b0100: BUSRESULT=MDR;
		4'b0010: BUSRESULT=ALU_OUT;
		4'b0001: BUSRESULT=ADDER_OUT;
		default: BUSRESULT=16'bX;
		endcase
	end
	
	
	
endmodule