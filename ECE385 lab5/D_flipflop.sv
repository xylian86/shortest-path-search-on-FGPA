module D_flipflop(input logic clk, load, reset, datain,
						output logic dataout);
	always_ff @ (posedge clk)
	begin
		if (reset)
			dataout <= 1'b0;
		else if (load)
			dataout <= datain;
		else
			dataout <= dataout;
	end

endmodule
	