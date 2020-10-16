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
	
	always_comb
		begin
			next_state = curr_state;
			unique case(curr_state)
				
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
					Shift = 1'b0;
					add=1'b0;
					sub=m;
					Clr_Ld = 1'b0;
					ResetA = (!Reset)|Clr_Ld;	
				end
				R:
				begin
					Shift = 1'b0;
					add=1'b0;
					sub=1'b0;
					Clr_Ld = 1'b0;
					ResetA = (!Reset)|Clr_Ld;	
				end
				Z:
				begin
					Shift = 1'b0;
					add=1'b0;
					sub=1'b0;
					Clr_Ld = 1'b0;
					ResetA = 1'b1;
				end
				default:
				begin
					Shift = 1'b1;
					add=1'b0;
					sub=1'b0;
					Clr_Ld = 1'b0;
					ResetA = (!Reset)|Clr_Ld;	
				end
			endcase
		end
																
endmodule


