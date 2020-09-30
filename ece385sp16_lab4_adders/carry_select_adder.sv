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
	  logic C4,C8,C12;
	  four_bit_CRA fbcra1(.A(A[3:0]),.B(B[3:0]), .c_in(0), .sum(Sum[3:0]), .cout(C4));
	  super_four_bit_CRA sfbcra1(.A(A[7:4]),.B(B[7:4]),.c(C4),.sum(Sum[7:4]),.cout(C8));
	  super_four_bit_CRA sfbcra2(.A(A[11:8]),.B(B[11:8]),.c(C8),.sum(Sum[11:8]),.cout(C12));
	  super_four_bit_CRA sfbcra3(.A(A[15:12]),.B(B[15:12]),.c(C12),.sum(Sum[15:12]),.cout(CO));
	  
     
endmodule


module twooneMUX(input logic[3:0] A, input logic[3:0]B, input logic select,
				output logic[3:0] Output);
				
always_comb
begin
if (select==1'b1)
	Output = B;
else
	Output= A;
end

endmodule

module four_bit_CRA(input [3:0]x, 
							input [3:0]y,
							input c_in,
							output logic [3:0]s,
							output logic cout
							);
		  logic c0,c1,c2;
		  full_adder FA0(.x(x[0]),.y(y[0]),.z(cin),.s(s[0]),.c(c0));
		  full_adder FA1(.x(x[1]),.y(y[1]),.z(c0),.s(s[1]),.c(c1));
		  full_adder FA2(.x(x[2]),.y(y[2]),.z(c1),.s(s[2]),.c(c2));
		  full_adder FA3(.x(x[3]),.y(y[3]),.z(c2),.s(s[3]),.c(cout));
endmodule

module super_four_bit_CRA(input logic[3:0] A,
								  input logic[3:0] B,
								  input logic      c,
								  output logic[3:0] sum,
								  output logic cout);
			logic c1,c2;
			logic[3:0] sum1,sum2;
			four_bit_CRA CRA1(.x(A),.y(B),.c(0),.s(sum1),.cout(c1));
			four_bit_CRA CRA2(.x(A),.y(B),.c(1),.s(sum2),.cout(c2));
			twooneMUX TWOBITMUX(.A(sum2),.B(sum1), .select(c), .Output(sum));
			assign cout= (c&c2)|(c1);
			
endmodule
								  
