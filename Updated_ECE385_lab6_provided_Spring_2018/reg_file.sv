module reg_file(	input logic [15:0] BUSRESULT,
			input logic [2:0] DR, SR1, SR2,
		   input logic LD, Clk, Reset,
		   output logic [15:0] SR1_OUT, SR2_OUT	);
			
logic W0,W1,W2,W3,W4,W5,W6,W7;
logic L0,L1,L2,L3,L4,L5,L6,L7;
logic O0,O1,O2,O3,O4,O5,O6,O7;		
	
assign W0=L0&LD;
assign W1=L1&LD;
assign W2=L2&LD;
assign W3=L3&LD;
assign W4=L4&LD;
assign W5=L5&LD;
assign W6=L6&LD;
assign W7=L7&LD;			

always_comb 
	begin
		L0=1'b0;
		L1=1'b0;
		L2=1'b0;
		L3=1'b0;
		L4=1'b0;
		L5=1'b0;
		L6=1'b0;
		L7=1'b0;
		case(DR)
			3'b000: L0=1'b1;
			3'b001: L1=1'b1;
			3'b010: L2=1'b1;
			3'b011: L3=1'b1;
			3'b100: L4=1'b1;
			3'b101: L5=1'b1;
			3'b110: L6=1'b1;
			3'b111: L7=1'b1;
		endcase
	end
	
register R0(.datain(BUSRESULT), .W(W0), .Clk, .Reset, .dataout(O0));
register R1(.datain(BUSRESULT), .W(W1), .Clk, .Reset, .dataout(O1));
register R2(.datain(BUSRESULT), .W(W2), .Clk, .Reset, .dataout(O2));
register R3(.datain(BUSRESULT), .W(W3), .Clk, .Reset, .dataout(O3));
register R4(.datain(BUSRESULT), .W(W4), .Clk, .Reset, .dataout(O4));
register R5(.datain(BUSRESULT), .W(W5), .Clk, .Reset, .dataout(O5));
register R6(.datain(BUSRESULT), .W(W6), .Clk, .Reset, .dataout(O6));
register R7(.datain(BUSRESULT), .W(W7), .Clk, .Reset, .dataout(O7));

mux8to1 MUXSR1(.data0(O0),.data1(O1),.data2(O2),.data3(O3),.data4(O4),.data5(O5),.data6(O6),.data7(O7), .select(SR1), .out(SR1_OUT));
mux8to1 MUXSR2(.data0(O0),.data1(O1),.data2(O2),.data3(O3),.data4(O4),.data5(O5),.data6(O6),.data7(O7), .select(SR2), .out(SR2_OUT));

endmodule

module register(
            input logic [15:0]  datain,
            input logic         W, Clk, Reset,
            output logic [15:0] dataout
);

always_ff @(posedge Clk) begin
    if (Reset)
        dataout <= 16'b0;
    else if (W)
        dataout <= datain;
end

endmodule