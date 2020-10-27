//Module: ADD_SUB9.sv
//Inputs: [7:0]A, [7:0]B, fn
//Outputs: [8:0]S
//Description: This is a 9-bit carry-select adder. This module extend to input A and B to 9 bits. Then adds them together to produce a 9-bit sum using the carry-select method. When fn is 1, the module will do the subtraction.
//Purpose: This module add or subtract the two 8-bit data and produce a 9-bit result with the 9th bit indicate the sign.
module ADD_SUB9(input [7:0] A, B,
					 input 		 fn,
					 output [8:0] S);

logic			c0,c1,c2,c3,c4,c5,c6,c7;
logic	[7:0]	BB;
logic			A8, BB8;

assign BB = (B ^ {8{fn}}); // from the logic analysis
assign A8 = A[7];// extend the 8-bit number to 9-bit
assign BB8 = BB[7];
//use the full_adder to add one bit by one bit
full_adder FA0(.x(A[0]), .y(BB[0]), .z(fn), .s(S[0]), .c(c0));
full_adder FA1(.x(A[1]), .y(BB[1]), .z(c0), .s(S[1]), .c(c1));
full_adder FA2(.x(A[2]), .y(BB[2]), .z(c1), .s(S[2]), .c(c2));
full_adder FA3(.x(A[3]), .y(BB[3]), .z(c2), .s(S[3]), .c(c3));
full_adder FA4(.x(A[4]), .y(BB[4]), .z(c3), .s(S[4]), .c(c4));
full_adder FA5(.x(A[5]), .y(BB[5]), .z(c4), .s(S[5]), .c(c5));
full_adder FA6(.x(A[6]), .y(BB[6]), .z(c5), .s(S[6]), .c(c6));
full_adder FA7(.x(A[7]), .y(BB[7]), .z(c6), .s(S[7]), .c(c7));
full_adder FA8(.x(A8), .y(BB8), .z(c7), .s(S[8]), .c()); 

endmodule
