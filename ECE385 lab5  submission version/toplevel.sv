//8-bit multiplier top level module
//created by Tianyu Liu and Xinyu Lian

//Module: toplevel.sv
//Inputs: Clk, Reset, Run, ClearA_LoadB, [7:0]S
//Outputs: [7:0]Aval, [7:0]Bval,X,[6:0]AhexL, [6:0]AhexU, [6:0]BhexL, [6:0]BhexU
//Description: This is a top-level file that operates on two 8-bit 2’s compliment numbers and produce a 16-bit result. When Reset is high, the data in the register will be set to the initial value, the machine will go back to the initial state. When Run is high, the multiplier will execute the process. When ClearA_LoadB is high, the data in register A will be cleared and data in S will be loaded to register B.
//Purpose: This module is used as a top-level platform to create all the circuit.
module toplevel(
							input logic Clk, Reset, Run, ClearA_LoadB,
							input logic [7:0] S,
							output logic [7:0] Aval, Bval,
							output logic X,
							output logic [6:0] AhexL, AhexU, BhexL, BhexU
							);
							
					//local logic variables
					logic reset_SH, run_SH, calb_SH;
					logic m, clearA, loadA, loadB, shift, add_sub, BmemoryIn;
					logic [7:0] S_S;
					logic [8:0] operationresult;
						
//instantiation of modules	

//control part
control controlunit(.clk(Clk), 
						  .reset(reset_SH), 
						  .run(run_SH), 
						  .calb(calb_SH), 
						  .m(Bval[0]),
						  .clearA(clearA), 
						  .loadA(loadA), 
						  .loadB(loadB), 
						  .shift(shift),
						  .add_sub(add_sub));	

	
//Register A	
register_8bit				Amemory( 
							  .clk(Clk), 
							  .reset(clearA),
							  .shiftin(X), 
							  .load(loadA), 
							  .enable(shift),
							  .datain(operationresult[7:0]),
							  .shiftout(BmemoryIn),
							  .dataout(Aval));

//Register B							  
register_8bit				Bmemory( 
							  .clk(Clk), 
							  .reset(reset_SH),
							  .shiftin(BmemoryIn), 
							  .load(loadB), 
							  .enable(shift),
							  .datain(S_S),
							  .shiftout(),
							  .dataout(Bval));
				

// Register X
D_flipflop		Xmemory(.clk(Clk),
							  .load(loadA),
							  .reset(clearA),
							  .datain(operationresult[8]),
							  .dataout(X));
							  

//9-bit adder						  
ADD_SUB9		operation(.A(Aval),
							 .B(S_S),
							 .fn(add_sub),
							 .S(operationresult));
	
	//HexDriver	
	 HexDriver        HexAL (
                        .In0(Aval[3:0]),
                        .Out0(AhexL) );
	 HexDriver        HexAU (
                        .In0(Aval[7:4]),
                        .Out0(AhexU) );	
	 HexDriver        HexBL (
                        .In0(Bval[3:0]),
                        .Out0(BhexL) );
	 HexDriver        HexBU (
                        .In0(Bval[7:4]),
                        .Out0(BhexU) );

//Input synchronizers required for asynchronous inputs 
	sync button_sync[2:0] (Clk, {~Reset, ~Run, ~ClearA_LoadB}, {reset_SH, run_SH, calb_SH});
	sync Din_sync[7:0] (Clk, S, S_S);
	
endmodule
