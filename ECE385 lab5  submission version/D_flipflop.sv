//Module: D_filpflop.sv
//Inputs: clk, load, reset, datain
//Outputs: dataout
//Description: This is a 1-bit register. When reset is high, the register will be cleared. When load is high, the register will load the datain in.
//Purpose: This module is used to create a 1-bit register to hold X in the multiplier circuit.
module D_flipflop(input logic clk, load, reset, datain,
						output logic dataout);
	always_ff @ (posedge clk)
	begin
		if (reset)//this is a sycnrhonous reset, which is recommended on the FPGA
			dataout <= 1'b0;//clear the register
		else if (load)
			dataout <= datain;
	end

endmodule
	