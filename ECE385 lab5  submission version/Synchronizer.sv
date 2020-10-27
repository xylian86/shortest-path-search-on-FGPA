//Module: synchronizers.sv
//Inputs: Clk, d
//Outputs: q
//Description: This is a 1-bit synchronizer. It synchronizes input s to output q.
//Purpose: This module is used to synchronize the inputs from the FPGA board to the logic inside the circuit.
//synchronizers to bring asynchronous signals into the FPGA
module sync (
	input  logic Clk, d, 
	output logic q
);

always_ff @ (posedge Clk)
begin
	q <= d;
end

endmodule


//synchronizer with reset to 0
module sync_r0 (
	input  logic Clk, Reset, d, 
	output logic q
);



always_ff @ (posedge Clk or posedge Reset)
begin
	if (Reset)
		q <= 1'b0;
	else
		q <= d;
end

endmodule


//synchronizer with reset to 1
module sync_r1 (
	input  logic Clk, Reset, d, 
	output logic q
);


always_ff @ (posedge Clk or posedge Reset)
begin
	if (Reset)
		q <= 1'b1;
	else
		q <= d;
end
	
endmodule