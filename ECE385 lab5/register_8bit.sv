
module register_8bit (input  logic clk, reset, shiftin, load, enable,
              input  logic [7:0]  datain,
              output logic shiftout,
              output logic [7:0]  dataout);

    always_ff @ (posedge clk)
    begin
	 	 if (reset) 
			  dataout <= 8'h00;
		 else if (load)
			  dataout <= datain;
		 else if (enable)
		 begin
			  dataout <= { shiftin, dataout[7:1] }; 
	    end
    end
	
    assign shiftout = dataout[0];

endmodule