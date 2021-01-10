//-------------------------------------------------------------------------
//      lab6_toplevel.sv                                                 --
//                                                                       --
//      Created 10-19-2017 by Po-Han Huang                               --
//                        Spring 2018 Distribution                       --
//                                                                       --
//      For use with ECE 385 Experment 6                                 --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------
module lab6_toplevel( input logic [15:0] S,
                      input logic Clk, Reset, Run, Continue,
                      output logic [11:0] LED,
                      output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
                      output logic CE, UB, LB, OE, WE,
                      output logic [19:0] ADDR,
                      inout wire [15:0] Data);

logic Reset_sync,Run_sync,Continue_sync;
logic [15:0]S_sync;

//slc3 my_slc(.*);
// Even though test memory is instantiated here, it will be synthesized into 
// a blank module, and will not interfere with the actual SRAM.
// Test memory is to play the role of physical SRAM in simulation.
//test_memory my_test_memory(.Reset(~Reset), .I_O(Data), .A(ADDR), .*);
slc3 my_slc(.*,.S(S_sync),.Reset(Reset_sync),.Run(Run_sync),.Continue(Continue_sync));
test_memory my_test_memory(.Reset(~Reset_sync), .I_O(Data), .A(ADDR),.*);

sync_r1 sy1(.Clk(Clk),.d(Reset),.q(Reset_sync));
sync_r1 sy2(.Clk(Clk),.d(Run),.q(Run_sync));
sync_r1 sy3(.Clk(Clk),.d(Continue),.q(Continue_sync));
sync_r16 sy4(.Clk(Clk), .d(S), .q(S_sync));


endmodule