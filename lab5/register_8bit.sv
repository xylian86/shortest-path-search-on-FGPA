//Module: register_8bit.sv
//Inputs: clk, reset, shiftin, load, enable, [7:0]datain
//Outputs: shiftout, [7:0]dataout
//Description: This is a 8-bit register. When reset is high, the register will be cleared . When load is high, the register will load datain in. When enable is high, the register will perform a right-shift operation. It will take shiftin as the new most significant bit and shift out its original least significant bit to shiftout. 
//Purpose: This module is used to create 8-bit registers like A and B in the multiplier circuit.
module register_8bit (input  logic clk, reset, shiftin, load, enable,
              input  logic [7:0]  datain,
              output logic shiftout,
              output logic [7:0]  dataout);

    always_ff @ (posedge clk)
    begin
	 	 if (reset) //this is a sycnrhonous reset, which is recommended on the FPGA
			  dataout <= 8'h00;//clear the register
		 else if (load)
			  dataout <= datain;
		 else if (enable)
		 begin
			  dataout <= { shiftin, dataout[7:1] }; // need to shift right, the new most significant bit will be the new input
	    end
    end
	
    assign shiftout = dataout[0];

endmodule