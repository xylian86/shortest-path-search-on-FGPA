
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

module MUXIR(input logic [15:0] BUSRESULT, input logic Clk, Reset_ah, LD_IR, output logic [15:0] IR);
//IR part
always_ff @(posedge Clk) 
	begin 
		if (Reset_ah)
			IR<=16'b0;
		else if(LD_IR)
			IR<=BUSRESULT;
	end
endmodule


module MUXPC(input logic [15:0] MUX_to_PC, input logic Clk, Reset_ah, LD_PC, output logic [15:0] PC);
//PC part
always_ff @(posedge Clk) 
	begin 
		if (Reset_ah)
			PC<=16'b0;
		else if(LD_PC)
			PC<=MUX_to_PC;
	end
endmodule

module MUXMDR(input logic [15:0] MUX_to_MDR, input logic Clk, Reset_ah, LD_MDR, output logic [15:0] MDR);
always_ff @(posedge Clk) 
	begin 
		if (Reset_ah)
			MDR<=16'b0;
		else if(LD_MDR)
			MDR<=MUX_to_MDR;
	end
endmodule

module MUXMAR(input logic [15:0] BUSRESULT, input logic Clk, Reset_ah, LD_MAR, output logic [15:0] MAR);
always_ff @(posedge Clk) 
	begin 
		if (Reset_ah)
			MAR<=16'b0;
		else if(LD_MAR)
			MAR<=BUSRESULT;
	end
endmodule