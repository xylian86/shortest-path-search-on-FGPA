module mux2to1(input logic [15:0] data0,data1,
					input logic  select,
					output logic [15:0] out);
			
always_comb
	begin
		if (select)
			out=data1;
		else
			out=data0;
	end
endmodule

module mux4to1(input logic [15:0] data0,data1,data2,data3,
					input logic [1:0] select,
					output logic [15:0] out);
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

module mux8to1(input logic [15:0] data0,data1,data2,data3,data4,data5,data6,data7,
					input logic [2:0] select,
					output logic [15:0] out);
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


		