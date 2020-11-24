module mux2 #(parameter width =32) (input logic [width-1:0] a0,a1,a2,a3, // 前面的那个parameter能不能删掉
												input logic [1:0] select, 
												output logic [width-1:0] out);
always_comb
	begin 
	out = a3;
		case(select)
		2'b00:
		out = a0;
		2'b01:
		out = a1;
		2'b10:
		out = a2;		
		endcase
	end

endmodule

module mux3 #(parameter width =32) (input logic [width-1:0] a0,a1,a2,a3,a4,a5,
												input logic [2:0] select, 
												output logic [width-1:0] out);

always_comb 
	begin 
	out = a5;
		case(select)
		3'b000:
		out = a0;
		3'b001:
		out = a1;
		3'b010:
		out = a2;
		3'b011:
		out = a3;
		3'b100:
		out = a4;
		endcase
	end

endmodule


module mux11 #(parameter width =128) (input logic [width-1:0] a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,
												  input logic [3:0] select, 
												  output logic [width-1:0] out);

always_comb 
	begin 
	out = a10;
	unique case(select)
		4'b0000:
		out = a0;
		4'b0001:
		out = a1;
		4'b0010:
		out = a2;
		4'b0011:
		out = a3;
		4'b0100:
		out = a4;
		4'b0101:
		out = a5;
		4'b0110:
		out = a6;
		4'b0111:
		out = a7;
		4'b1000:
		out = a8;
		4'b1001:
		out = a9;
		endcase
	end	


endmodule
