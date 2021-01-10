module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

logic CLK = 0;

logic RESET;
logic AES_START;
logic AES_DONE;
logic [127:0] AES_KEY;
logic [127:0] AES_MSG_ENC;
logic [127:0] AES_MSG_DEC;

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 CLK = ~CLK;
end

initial begin: CLOCK_INITIALIZATION
    CLK = 0;
end 

AES AES_lab9(.*);

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
RESET = 1'b1;

#4 RESET = 1'b0;

#4;
AES_MSG_ENC = 128'h439d619920ce415661019634f59fcf63;
AES_KEY = 128'h3b280014beaac269d613a16bfdc2be03;

#4;
AES_START = 1'b1;

#22;



end

endmodule