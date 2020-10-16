module register_8bit(input logic shiftin, clk, reset, load, enable, 
							input logic [7:0] datain,
							output logic shiftout,
							output logic [7:0] dataout);


	always_ff @ (posedge clk)
	begin
		if(reset)
			dataout <= 8'h00;
		else if (load)
			dataout <= datain;
		else if (enable)
		begin
			dataout <= {shiftin, datain[7:1]};
		end
	end
	
	assign shiftout = datain[0] ;
	
endmodule
							