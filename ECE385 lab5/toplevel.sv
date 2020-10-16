module toplevel(
							input logic Clk, Reset, Run, ClearA_LoadB,
							input logic [7:0] S,
							output logic [7:0] Aval, Bval,
							output logic X,
							output logic [6:0] AhexL, AhexU, BhexL, BhexU
							);
							
					logic reset_SH, run_SH, calb_SH;
					logic m, clearA, loadA, loadB, shift, add_sub, BmemoryIn;
					logic [7:0] S_S;
					logic [8:0] operationresult;
						
							

register_8bit	Amemory(.shiftin(X), 
							  .clk(Clk), 
							  .reset(reset_SH | clearA), 
							  .load(loadA), 
							  .enable(shift),
							  .datain(operationresult[7:0]),
							  .shiftout(BmemoryIn),
							  .dataout(Aval));

register_8bit	Bmemory(.shiftin(BmemoryIn), 
							  .clk(Clk), 
							  .reset(reset_SH), 
							  .load(calb_SH), 
							  .enable(shift),
							  .datain(S_S),
							  .shiftout(),
							  .dataout(Bval));

D_flipflop		Xmemory(.clk(Clk),
							  .load(loadA),
							  .reset(reset_SH | clearA),
							  .datain(operationresult[8]),
							  .dataout(X));
							  
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
						  
ADD_SUB9		operation(.A(Aval),
							 .B(S_S),
							 .fn(add_sub),
							 .S(operationresult));
						  
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

	sync button_sync[2:0] (Clk, {~Reset, ~Run, ~ClearA_LoadB}, {reset_SH, run_SH, calb_SH});
	sync Din_sync[7:0] (Clk, S, S_S);
	
endmodule
