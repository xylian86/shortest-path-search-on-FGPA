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
	
	always_comb
		begin
		
			next_state = curr_state;
			
			unique case (curr_state)
				
				resetstate: if(run)
									next_state = beginrun;
				beginrun:	if(m)
									next_state = A1;
								else
									next_state = S1;
				A1:			next_state = S1;
				S1:			if(m)
									next_state = A2;
								else
									next_state = S2;
				A2:			next_state = S2;
				S2:			if(m)
									next_state = A3;
								else
									next_state = S3;
				A3:			next_state = S3;
				S3:			if(m)
									next_state = A4;
								else
									next_state = S4;	
				A4:			next_state = S4;
				S4:			if(m)
									next_state = A5;
								else
									next_state = S5;
				A5:			next_state = S5;
				S5:			if(m)
									next_state = A6;
								else
									next_state = S6;
				A6:			next_state = S6;
				S6:			if(m)
									next_state = A7;
								else
									next_state = S7;
				A7:			next_state = S7;
				S7:			if(m)
									next_state = A8;
								else
									next_state = S8;
				A8:			next_state = S8;
				S8:			next_state = hold;
				hold:			if(~run)
									next_state = resetstate;
			endcase
			
		//unique case(curr_state)
		case(curr_state)
			resetstate:
				begin
					loadA = 1'b0;
					shift = 1'b0;
					add_sub = 1'b0;
					loadB = 1'b0;
					clearA = 1'b0;
					if(calb)
						begin
							loadB = 1'b1;
							clearA = 1'b1;
						end
					end
			
			beginrun:
				begin
					clearA = 1'b1;
					loadA = 1'b0;
					loadB = 1'b0;
					shift = 1'b0;
					add_sub = 1'b0;
				end
			A1,A2,A3,A4,A5,A6,A7:
				begin
					clearA = 1'b0;
					loadA = 1'b1;
					loadB = 1'b0;
					shift = 1'b0;
					add_sub = 1'b0;
				end					
			S1,S2,S3,S4,S5,S6,S7,S8:
				begin
					clearA = 1'b0;
					loadA = 1'b0;
					loadB = 1'b0;
					shift = 1'b1;
					add_sub = 1'b0;
				end						
			A8:
				begin
					clearA = 1'b0;
					loadA = 1'b1;
					loadB = 1'b0;
					shift = 1'b0;
					add_sub = 1'b1;
				end	
			hold:
				begin
					clearA = 1'b0;
					loadA = 1'b0;
					loadB = 1'b0;
					shift = 1'b0;
					add_sub = 1'b0;
				end
			endcase
	end
	
endmodule
			
					
					
			
			

						
					