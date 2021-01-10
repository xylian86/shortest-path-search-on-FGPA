module mux3  (input logic [127:0] a0,a1,a2,a3,a4,a5,
				  input logic [2:0] select, 
				  output logic [127:0] out);

always_comb 
	begin 
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
		3'b101:
		out = a5;
		default:
		out = a0;
		endcase
	end

endmodule

