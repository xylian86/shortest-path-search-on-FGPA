<<<<<<< HEAD
module control (input logic clk, reset, run, calb, m,
					 output logic clearA, loadA, loadB, shift,add_sub);

	enum logic[4:0] {resetstate, beginrun, A1, S1,A2, S2,A3, S3,A4, S4,A5, S5,A6, S6,A7, S7,A8, S8,hold} curr_state, next_state;				 
	always_ff @ (posedge clk)
	begin
		if(reset)
			curr_state <= resetstate;
		else
			curr_state <= next_state;
	end
=======
module Control(
			input logic Clk, Reset, Run, clab, m,
			output logic Clr_Ld, Shift, add,sub, ResetA
);
	enum logic [4:0] {A, B, C, D, E, F, G, H, I, J, K, L, M_, N, O, P, Q, R, Z}   curr_state, next_state; 
	
	always_ff @ (posedge Clk)  
		begin
			if (!Reset)
            curr_state <= A;
			else 
            curr_state <= next_state;
		end	
>>>>>>> 417fb817bae660e9708fc5600586f138f956582b
	
	always_comb
		begin
			next_state = curr_state;
			unique case(curr_state)
				
<<<<<<< HEAD
				resetstate: if(run)
									next_state = beginrun;
				beginrun:	next_state = A1;
				A1:			next_state = S1;
				S1:			next_state = A2;
				A2:			next_state = S2;
				S2:			next_state = A3;
				A3:			next_state = S3;
				S3:			next_state = A4;	
				A4:			next_state = S4;
				S4:			next_state = A5;
				A5:			next_state = S5;
				S5:			next_state = A6;
				A6:			next_state = S6;
				S6:			next_state = A7;
				A7:			next_state = S7;
				S7:			next_state = A8;
				A8:			next_state = S8;
				S8:			next_state = hold;
				hold:			if(~run)
									next_state = resetstate;
=======
				A : if (~Run)
						next_state = Z;
				Z : next_state = B;
				B : next_state = C;
				C : next_state = D;
				D : next_state = E;
				E : next_state = F;
				F : next_state = G;
				G : next_state = H;
				H : next_state = I;
				I : next_state = J;
				J : next_state = K;
				K : next_state = L;
				L : next_state = M_;
				M_ : next_state = N;
				N : next_state = O;
				O : next_state = P;
				P : next_state = Q;
				Q : next_state = R;
				R : if (Run)
						next_state = A;
			
>>>>>>> 417fb817bae660e9708fc5600586f138f956582b
			endcase
			
			case (curr_state)
				A:
				begin
					Shift = 1'b0;
					add=1'b0;
					sub=1'b0;
					Clr_Ld = !clab;
					ResetA = (!Reset)|Clr_Ld;
				end
				B, D, F, H, J, L, N:
				begin
					Shift = 1'b0;
					add=m;
					sub=1'b0;
					Clr_Ld = 1'b0;
					ResetA = (!Reset)|Clr_Ld;	
				end
				P:
				begin
<<<<<<< HEAD
					if(m == 1'b1)
						begin
							clearA = 1'b0;
							loadA = 1'b1;
							loadB = 1'b0;
							shift = 1'b0;
							add_sub = 1'b0;
						end
					else
						begin
							clearA = 1'b0;
							loadA = 1'b0;
							loadB = 1'b0;
							shift = 1'b0;
							add_sub = 1'b0;
						end
				end
							
									
			S1,S2,S3,S4,S5,S6,S7,S8:
=======
					Shift = 1'b0;
					add=1'b0;
					sub=m;
					Clr_Ld = 1'b0;
					ResetA = (!Reset)|Clr_Ld;	
				end
				R:
>>>>>>> 417fb817bae660e9708fc5600586f138f956582b
				begin
					Shift = 1'b0;
					add=1'b0;
					sub=1'b0;
					Clr_Ld = 1'b0;
					ResetA = (!Reset)|Clr_Ld;	
				end
				Z:
				begin
<<<<<<< HEAD
					if(m == 1'b1)
						begin
							clearA = 1'b0;
							loadA = 1'b1;
							loadB = 1'b0;
							shift = 1'b0;
							add_sub = 1'b1;
						end
					else
						begin
							clearA = 1'b0;
							loadA = 1'b0;
							loadB = 1'b0;
							shift = 1'b0;
							add_sub = 1'b0;
						end
				end
			hold:
=======
					Shift = 1'b0;
					add=1'b0;
					sub=1'b0;
					Clr_Ld = 1'b0;
					ResetA = 1'b1;
				end
				default:
>>>>>>> 417fb817bae660e9708fc5600586f138f956582b
				begin
					Shift = 1'b1;
					add=1'b0;
					sub=1'b0;
					Clr_Ld = 1'b0;
					ResetA = (!Reset)|Clr_Ld;	
				end
			endcase
<<<<<<< HEAD
	end
endmodule
					
					
			
			
=======
		end
																
endmodule
>>>>>>> 417fb817bae660e9708fc5600586f138f956582b


