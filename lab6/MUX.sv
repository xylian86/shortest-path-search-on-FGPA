
/*This module includes three kinds of design for MUXs:2to1, 4to1 and 8to1. To make it more flexible, we use
	parameters to adjust the width of input logic.*/

	
//2to1 MUX, using if-else design.
module mux2to1 #(parameter width=16 )(input logic [width-1:0] data0,data1,
					input logic  select,
					output logic [width-1:0] out);
			
always_comb
	begin
		if (select)
			out=data1;
		else
			out=data0;
	end
endmodule


//4to1 MUX, using case design.
module mux4to1 #(parameter width=16)(input logic [width-1:0] data0,data1,data2,data3,
					input logic [1:0] select,
					output logic [width-1:0] out);
always_comb
	begin
		case(select)
			2'b00: out=data0;
			2'b01: out=data1;
			2'b10: out=data2;
			2'b11: out=data3;
		endcase
	end
endmodule



//8to1 MUX, using case design.
module mux8to1 #(parameter width=16) (input logic [width-1:0] data0,data1,data2,data3,data4,data5,data6,data7,
					input logic [2:0] select,
					output logic [width-1:0] out);
always_comb
	begin
		case(select)
			3'b000: out=data0;
			3'b001: out=data1;
			3'b010: out=data2;
			3'b011: out=data3;
			3'b100: out=data4;
			3'b101: out=data5;
			3'b110: out=data6;
			3'b111: out=data7;
		endcase
	end
endmodule


		