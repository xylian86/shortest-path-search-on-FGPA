module ripple_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic C0,C1,C2;
	  
	//Connecting the four bit adders according to the schematic
	four_bit_adder ADDER1(.x(A[3:0]),.y(B[3:0]),.c_in(0),.s(Sum[3:0]),.cout(C0));
	four_bit_adder ADDER2(.x(A[7:4]),.y(B[7:4]),.c_in(C0),.s(Sum[7:4]),.cout(C1));
	four_bit_adder ADDER3(.x(A[11:8]),.y(B[11:8]),.c_in(C1),.s(Sum[11:8]),.cout(C2));
	four_bit_adder ADDER4(.x(A[15:12]),.y(B[15:12]),.c_in(C2),.s(Sum[15:12]),.cout(CO));
	  
endmodule

/* This is the module of one full adder. */
module full_adder(input x,y,z, output s,c);

	assign s =x^y^z;	/*computing S*/
	assign c=(x&y)|(y&z)|(x&z); //computing c
	
endmodule

/* We need to build a four bit adder for a sixteen bit ripple adder. */

module four_bit_adder(input [3:0]x, 
							input [3:0]y,
							input c_in,
							output logic [3:0]s,
							output logic cout
							);
		  logic c0,c1,c2;
		  //Connecting adder according to the schematic
		  full_adder FA0(.x(x[0]),.y(y[0]),.z(cin),.s(s[0]),.c(c0));	 
		  full_adder FA1(.x(x[1]),.y(y[1]),.z(c0),.s(s[1]),.c(c1));
		  full_adder FA2(.x(x[2]),.y(y[2]),.z(c1),.s(s[2]),.c(c2));
		  full_adder FA3(.x(x[3]),.y(y[3]),.z(c2),.s(s[3]),.c(cout));
endmodule
							
