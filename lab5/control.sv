//Module: control.sv
//Inputs: clk, reset, run, calb, m
//Outputs: clearA, loadA, loadB, shift, add_sub
//Description: This is a finite state machine to control the current and the next state. The state will change at the rising edge of the clk. The run signal will determine whether the first state should jump to the next state. The other input calb and m are used to determine the outputs. There are 19 states in the state machine.
//Purpose: This module is used to create a finite state machine to control the multiplier to implement the add-shift algorithm to calculate the product. 
module control (input logic clk, reset, run, calb, m,
					 output logic clearA, loadA, loadB, shift,add_sub);
	//declare signals curr_state, next_state of type enum
	enum logic[4:0] {resetstate, beginrun, A1, S1,A2, S2,A3, S3,A4, S4,A5, S5,A6, S6,A7, S7,A8, S8,hold} curr_state, next_state;
	
	//update the state
	always_ff @ (posedge clk)
	begin
		if(reset)
			curr_state <= resetstate;
		else
			curr_state <= next_state;
	end
	
	always_comb
		begin
			//state transition
			next_state = curr_state;
			
			unique case (curr_state)
				
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
			endcase
			
		//assign outputs based on state
		case(curr_state)
			resetstate:
				begin
					loadA = 1'b0;
					shift = 1'b0;
					add_sub = 1'b0;
					loadB = 1'b0;
					clearA = 1'b0;
					if(calb)// if we want to clear A and load B
						begin
							loadB = 1'b1;
							clearA = 1'b1;
						end
					end
			
			beginrun:
				begin
					clearA = 1'b1;// neec to clear A before the operation
					loadA = 1'b0;
					loadB = 1'b0;
					shift = 1'b0;
					add_sub = 1'b0;
				end
			A1,A2,A3,A4,A5,A6,A7:
				begin
					if(m == 1'b1)//If the least siginificant bit is 1
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
				begin
					clearA = 1'b0;
					loadA = 1'b0;
					loadB = 1'b0;
					shift = 1'b1;// need to shift the register
					add_sub = 1'b0;
				end						
			A8:
				begin
					if(m == 1'b1)
						begin
							clearA = 1'b0;
							loadA = 1'b1;
							loadB = 1'b0;
							shift = 1'b0;
							add_sub = 1'b1;// need to do the subtract operation
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
					
					
			
			

						
					