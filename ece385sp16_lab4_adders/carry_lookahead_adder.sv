/*
	Created time:2020.10.6
	This is the module file for the Carry-Lookahead Adder (CLA).
	CLA speeds up computation by reducing the delay between carry operations.
	To implement the CLA module, we define a new full adder that performs different computing logic (p,g,s).
	In addition, we write the boolean expression to calculate carry-out bit.
*/


/* This is the module for one CLA.*/
module carry_lookahead_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  /* C_in=0*/
	  
	  /* Declare the output and elements used for logic process. */
	  logic C0,C4,C8,C12;
	  logic PG0,PG4,PG8,PG12;
	  logic GG0,GG4,GG8,GG12;
	  
	  /*Computing the carry-out bit*/
	  always_comb 
	  begin
	  C4 = GG0 | (0&PG0);
	  C8 = GG4| (GG0&PG4) |(0&PG0&PG4);
	  C12 = GG8|(GG4&PG8)|(GG0&PG8&PG4)|(0&PG8&PG4&PG0);
	  CO = GG12 | (GG8&PG12) |(GG4&PG8&PG12)|(GG0&PG4&PG8&PG12)|(0&PG0&PG4&PG8&PG12);
	  end
	  
		/*Perform the process*/
	  	new_four_bit_adder ADDER1(.x(A[3:0]),.y(B[3:0]),.c_in(0),.S(Sum[3:0]),.PG(PG0), .GG(GG0));
		new_four_bit_adder ADDER2(.x(A[7:4]),.y(B[7:4]),.c_in(C4),.S(Sum[7:4]),.PG(PG4), .GG(GG4));
		new_four_bit_adder ADDER3(.x(A[11:8]),.y(B[11:8]),.c_in(C8),.S(Sum[11:8]),.PG(PG8), .GG(GG8));
		new_four_bit_adder ADDER4(.x(A[15:12]),.y(B[15:12]),.c_in(C12),.S(Sum[15:12]),.PG(PG12), .GG(GG12));
endmodule


/* This is the module for one special full adder.*/
module new_full_adder(input x,y,z, output logic p,g,s);

	assign p = x^y; //Calculate p=X XOR Y
	assign g = x&y; //Calculate g= X AND Y
	assign s= x^y^z;//Calculate s= X XOR Y XOR Z
	
endmodule




/* This is the module for one special 4-bit adder.*/
module new_four_bit_adder(input [3:0]x, 
							input [3:0]y,
							input c_in,
							output logic [3:0]S,
							output logic PG,
							output logic GG);
							
		 /* Declare the output and elements used for logic process. */
		 /*Computing the carry-out bit*/
							
		  logic C1,C2,C3;
		  logic P0,P1,P2,P3;
		  logic G0,G1,G2,G3;
		  
		  /*Computing the carry-out bit*/
		  always_comb
		  begin
		  C1=(c_in&P0)|G0;
		  C2 = (c_in&P0&P1)|(G0&P1)|G1;
		  C3 = (c_in&P0&P1&P2)|(G0&P1&P2)|(G1&P2)|G2;
		  end
		  
		  
		  /*Perform the process.*/
		  new_full_adder FA0(.x(x[0]),.y(y[0]),.z(c_in),.p(P0),.g(G0),.s(S[0]));
		  new_full_adder FA1(.x(x[1]),.y(y[1]),.z(C1),.p(P1),.g(G1),.s(S[1]));
		  new_full_adder FA2(.x(x[2]),.y(y[2]),.z(C2),.p(P2),.g(G2),.s(S[2]));
		  new_full_adder FA3(.x(x[3]),.y(y[3]),.z(C3),.p(P3),.g(G3),.s(S[3]));
		  /*Computing group propagate and group generate.*/
		  assign PG=P0&P1&P2&P3;
		  assign GG=G3|(G2&P3)|(G1&P3&P2)|(G0&P3&P2&P1);
		  
endmodule

     
