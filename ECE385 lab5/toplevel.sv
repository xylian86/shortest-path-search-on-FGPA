module toplevel(
							input logic [7:0] S,
							input logic Clk, Reset, Run, ClearA_LoadB,
							output logic [6:0] AhexL, AhexU, BhexL, BhexU,
							output logic [7:0] Aval, Bval,
							output logic X
							);
							
					logic m, clearA, loadA, loadB, shift, add , sub, BmemoryIn, specialX;
					logic [7:0] S_S,A,B;
					
					assign Aval=A;
					assign Bval=B;
					assign m=B[0];
					assign loadA=add|sub;
						
							

register_8bit	Amemory(.shiftin(X), 
							  .clk(Clk), 
							  .reset(clearA), 
							  .load(loadA), 
							  .enable(shift),
							  .datain(S_S),
							  .shiftout(BmemoryIn),
							  .dataout(A));

register_8bit	Bmemory(.shiftin(BmemoryIn), 
							  .clk(Clk), 
							  .reset(!Reset), 
							  .load(loadB), 
							  .enable(shift),
							  .datain(S),
							  .shiftout(),
							  .dataout(B));

D_flipflop		Xmemory(.clk(Clk),
							  .load(loadA),
							  .reset(clearA),
							  .datain(specialX),
							  .dataout(X));
							  
Control controlunit(.Clk(Clk), 
						  .Reset(Reset), 
						  .Run(Run), 
						  .clab(ClearA_LoadB), 
						  .m(m),
						  .ResetA(clearA), 
						  .Clr_Ld(loadB), 
						  .Shift(shift),
						  .add(add),
						  .sub(sub));
						  
ADD_SUB9		operation(.A(A),
							 .B(S),
							 .add(add),
							 .sub(sub),
							 .S(S_S),
							 .specialX(specialX));
						  
	 HexDriver        HexAL (
                        .In0(A[3:0]),
                        .Out0(AhexL) );
	 HexDriver        HexAU (
                        .In0(A[7:4]),
                        .Out0(AhexU) );	
	 HexDriver        HexBL (
                        .In0(B[3:0]),
                        .Out0(BhexL) );
	 HexDriver        HexBU (
                        .In0(B[7:4]),
                        .Out0(BhexU) );

//	sync button_sync[2:0] (Clk, {~Reset, ~Run, ~ClearA_LoadB}, {reset_SH, run_SH, calb_SH});
//	sync Din_sync[7:0] (Clk, S, S_S);
	
endmodule
