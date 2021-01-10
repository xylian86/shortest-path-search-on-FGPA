//Module: full_adder.sv
//Inputs: x, y, z
//Outputs: s, c
//Description: This is a 1-bit adder that have two input (x and y) and a carry-in bit (z) and outputs the sum (s) with the carry-out bit (c).
//Purpose: This module is used to as the underlying logic.
module full_adder(input x,y,z, output s,c);

	assign s =x^y^z;	//Computing s
	assign c=(x&y)|(y&z)|(x&z); //Computing c
	
endmodule