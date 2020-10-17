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
					  
register_8bit				Amemory( 
							  .clk(Clk), 
<<<<<<< HEAD
							  .reset(clearA),
							  .shiftin(X), 
=======
							  .reset(clearA), 
>>>>>>> 417fb817bae660e9708fc5600586f138f956582b
							  .load(loadA), 
							  .enable(shift),
							  .datain(S_S),
							  .shiftout(BmemoryIn),
<<<<<<< HEAD
							  .dataout(Aval));
							  
register_8bit				Bmemory( 
							  .clk(Clk), 
							  .reset(reset_SH),
							  .shiftin(BmemoryIn), 
=======
							  .dataout(A));

register_8bit	Bmemory(.shiftin(BmemoryIn), 
							  .clk(Clk), 
							  .reset(!Reset), 
>>>>>>> 417fb817bae660e9708fc5600586f138f956582b
							  .load(loadB), 
							  .enable(shift),
							  .datain(S),
							  .shiftout(),
<<<<<<< HEAD
							  .dataout(Bval));
				

=======
							  .dataout(B));
>>>>>>> 417fb817bae660e9708fc5600586f138f956582b

D_flipflop		Xmemory(.clk(Clk),
							  .load(loadA),
							  .reset(clearA),
<<<<<<< HEAD
							  .datain(operationresult[8]),
							  .dataout(X));
							  

=======
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
>>>>>>> 417fb817bae660e9708fc5600586f138f956582b
						  
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
