/*
	Created time: 2020.10.6
	This is the module file for Carry-Select Adder (CSA).
	A CSA using more adders in lovel level design to speed up the computing process.
	To implement a CSA, we define two different componments, which are one adder with no selection function 
	and one adder withe selection function.
*/


/*This is the module for CSA*/
module carry_select_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a carry select.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	  /*Declare the output of full adders*/
	  logic C4,C8,C12;
	  /*Perform process*/
	  four_bit_CSA fbcra1(.x(A[3:0]),.y(B[3:0]), .c_in(1'd0), .s(Sum[3:0]), .cout(C4));//1'd0 means 0 (one bit)
	  super_four_bit_CSA sfbcra1(.A(A[7:4]),.B(B[7:4]),.c(C4),.sum(Sum[7:4]),.cout(C8));
	  super_four_bit_CSA sfbcra2(.A(A[11:8]),.B(B[11:8]),.c(C8),.sum(Sum[11:8]),.cout(C12));
	  super_four_bit_CSA sfbcra3(.A(A[15:12]),.B(B[15:12]),.c(C12),.sum(Sum[15:12]),.cout(CO));
	  
     
endmodule

/*This is the module for a multipulxer*/
module twooneMUX(input logic[3:0] A, 
					  input logic[3:0]B, 
					  input logic select,
			
	     output logic[3:0] Output);

/*This is main part, an if-else structure.*/		  
always_comb
begin
if (select==1'b1) begin //1'd1 means 1 (one bit)
	Output = B;
end else begin
	Output= A;
end
end

endmodule


/*This is the module of the adder with no selection functions.*/		
module four_bit_CSA(input logic[3:0]x, 
							input logic[3:0]y,
							input logic c_in,
							output logic [3:0]s,
							output logic cout
							);
		  /*Declare the output of full adders*/
		  logic c0,c1,c2;
		  
		  /*Perform process*/
		  full_adder FA0(.x(x[0]),.y(y[0]),.z(c_in),.s(s[0]),.c(c0));
		  full_adder FA1(.x(x[1]),.y(y[1]),.z(c0),.s(s[1]),.c(c1));
		  full_adder FA2(.x(x[2]),.y(y[2]),.z(c1),.s(s[2]),.c(c2));
		  full_adder FA3(.x(x[3]),.y(y[3]),.z(c2),.s(s[3]),.c(cout));
endmodule


/*This is the module of the adder with selection functions.*/
module super_four_bit_CSA(input logic[3:0] A,
								  input logic[3:0] B,
								  input logic      c,
								  output logic[3:0] sum,
								  output logic cout);
			 /*Declare the output of full adders*/
			logic c1,c2;
			logic[3:0] sum1,sum2;
			/*Perform computing process*/
			four_bit_CSA CSA1(.x(A),.y(B),.c_in(1'b0),.s(sum1),.cout(c1));
			four_bit_CSA CSA2(.x(A),.y(B),.c_in(1'b1),.s(sum2),.cout(c2));
			/*Perform selection process*/
			twooneMUX TWOBITMUX(.A(sum1),.B(sum2), .select(c), .Output(sum));
			/*Calculate carry-out bit*/
			assign cout= (c&c2)|(c1);
			
endmodule
								  
