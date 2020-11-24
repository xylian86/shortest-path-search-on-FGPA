/************************************************************************
AES Decryption Core Logic

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department
************************************************************************/

module AES (
	input	 logic CLK,
	input  logic RESET,
	input  logic AES_START,
	output logic AES_DONE,
	input  logic [127:0] AES_KEY,
	input  logic [127:0] AES_MSG_ENC,
	output logic [127:0] AES_MSG_DEC
);
	logic [1407:0] keySchedule; 
	logic [10:0][127:0] key_state;
	logic [127:0] state, msg_reg_in, Sub_Out;
	logic [1:0] InvColSelect,InvColDecSelect;
	logic [2:0] mainMuxSelect;
	logic [3:0] roundKeySelect;
	logic [31:0] InvColMuxOut,InvColOut, InvColDec0,InvColDec1,InvColDec2,InvColDec3;
	logic [127:0] inputRoundKey, roundKeytoMux, shiftRowtoMux;

	
	KeyExpansion keyExpansion(.clk(CLK), .Cipherkey(AES_KEY),.KeySchedule(keySchedule));
	
	
	always_ff @ (posedge CLK) begin 
		if (RESET) 
			begin 
				for(int i=0;i<11;i++)
					begin 
					key_state[i] <= 128'b0;
					end
			end
		else 
		begin
		state <= msg_reg_in;
		key_state[0] <= keySchedule[127:0];
		key_state[1] <= keySchedule[255:128];
		key_state[2] <= keySchedule[383:256];
		key_state[3] <= keySchedule[511:384];
		key_state[4] <= keySchedule[639:512];
		key_state[5] <= keySchedule[767:640];
		key_state[6] <= keySchedule[895:768];
		key_state[7] <= keySchedule[1023:896];
		key_state[8] <= keySchedule[1151:1024];
		key_state[9] <= keySchedule[1279:1152];
		key_state[10] <= keySchedule[1407:1280];
		end
	end


mux11 #(128) roundKeyMux (.a0(key_state[0]), 
								  .a1(key_state[1]), 
								  .a2(key_state[2]), 
								  .a3(key_state[3]),
								  .a4(key_state[4]), 
								  .a5(key_state[5]), 
								  .a6(key_state[6]), 
								  .a7(key_state[7]), 
								  .a8(key_state[8]), 
								  .a9(key_state[9]), 
								  .a10(key_state[10]),
								  .select(roundKeySelect), 
								  .out(inputRoundKey));	
//Mux before invmixcolumns
mux2 InvColMux(.a0(state[127:96]),
					.a1(state[95:64]),
					.a2(state[63:32]),
					.a3(state[31:0]),
					.select(InvColSelect), 
					.out(InvColMuxOut));

//InvMixColumns Module		
InvMixColumns InvMixCol( .in(InvColMuxOut),.out(InvColOut));

//Decoder for invmixcol
dec2 InvMixColDec(.y(InvColOut),.s(InvColDecSelect),.d0(InvColDec0),
					.d1(InvColDec1),.d2(InvColDec2),.d3(InvColDec3),.clk(CLK));
						
//Mux as input to the current state register
mux3 #(128) mainMux  (.a0(roundKeytoMux),
							 .a1(shiftRowtoMux),
							 .a2({InvColDec0,InvColDec1,InvColDec2,InvColDec3}),
							 .a3(Sub_out),
							 .a4(AES_MSG_ENC),.d5(state),
							 .select(mainMuxSelect), 
							 .out(msg_reg_in));
							 
											

//Roundkeymodule to mainmux											
AddRoundKey roundKeyMod(.state(state), 
								.key(inputRoundKey),
								.out(roundKeytoMux));	
							
//Inv shift row to mainmux					
InvShiftRows shiftRowsMod(.data_in(state), .data_out(shiftRowtoMux));
		
// InvSubBytes
InvSubBytes sub0(.clk(CLK), .in(state[7:0]), .out(Sub_Out[7:0]));
InvSubBytes sub1(.clk(CLK), .in(state[15:8]), .out(Sub_Out[15:8]));
InvSubBytes sub2(.clk(CLK), .in(state[23:16]), .out(Sub_Out[23:16]));
InvSubBytes sub3(.clk(CLK), .in(state[31:24]), .out(Sub_Out[31:24]));
InvSubBytes sub4(.clk(CLK), .in(state[39:32]), .out(Sub_Out[39:32]));
InvSubBytes sub5(.clk(CLK), .in(state[47:40]), .out(Sub_Out[47:40]));
InvSubBytes sub6(.clk(CLK), .in(state[55:48]), .out(Sub_Out[55:48]));
InvSubBytes sub7(.clk(CLK), .in(state[63:56]), .out(Sub_Out[63:56]));
InvSubBytes sub8(.clk(CLK), .in(state[71:64]), .out(Sub_Out[71:64]));
InvSubBytes sub9(.clk(CLK), .in(state[79:72]), .out(Sub_Out[79:72]));
InvSubBytes sub10(.clk(CLK), .in(state[87:80]), .out(Sub_Out[87:80]));
InvSubBytes sub11(.clk(CLK), .in(state[95:88]), .out(Sub_Out[95:88]));
InvSubBytes sub12(.clk(CLK), .in(state[103:96]), .out(Sub_Out[103:96]));
InvSubBytes sub13(.clk(CLK), .in(state[111:104]), .out(Sub_Out[111:104]));
InvSubBytes sub14(.clk(CLK), .in(state[119:112]), .out(Sub_Out[119:112]));
InvSubBytes sub15(.clk(CLK), .in(state[127:120]), .out(Sub_Out[127:120]));

//STATE LOGIC 			
enum logic [7:0] {WAIT,DONE,
						AddRoundKeyInitial1,AddRoundKeyInitial2,AddRoundKeyInitial3,AddRoundKeyInitial4,
						InvShiftRows1,InvShiftRows2,InvShiftRows3,
						AddRoundKey1,AddRoundKey2,AddRoundKey3,AddRoundKey4,
						InvSubBytes1,InvSubBytes2,InvSubBytes3,
						InvMixCols1,InvMixCols2,InvMixCols3,InvMixCols4,Checker,
						InvShiftRowsFinal1,InvShiftRowsFinal2,InvShiftRowsFinal3,
						InvSubBytesFinal1,InvSubBytesFinal2,InvSubBytesFinal3,
						AddRoundKeyFinal1,AddRoundKeyFinal2,AddRoundKeyFinal3,dummy}   State, Next_state; 
			
logic [3:0] tracker;
logic [3:0] tracker_in;
	always_ff @ (posedge CLK)
	begin
		if (RESET) 
		begin
			State <= WAIT;
			tracker<=4'b0000;
		end
		else 
			State <= Next_state;
			tracker<=tracker_in;
	end
	
   always_comb
	begin 
		// Default next state is staying at current state 
		
		Next_state = State;
		AES_DONE=1'b0;
		tracker_in = tracker;
		mainMuxSelect = 3'b111;
		roundKeySelect = 4'b0000;
		InvColSelect = 2'b00;
		InvColDecSelect = 2'b00;

		unique case (State) //BTW APPARENTLY YOU CAN USE TRACKER++ AND IT WILL WORK
			WAIT:
			begin
			tracker_in = 4'b0000;
			if(AES_START == 1'b1)
			Next_state = AddRoundKeyInitial1;
			else Next_state = WAIT; 
			end
			AddRoundKeyInitial1:
			begin
			mainMuxSelect = 3'b100;//AES MSG ENCRY
			Next_state = AddRoundKeyInitial2;
			end
			AddRoundKeyInitial2:
			begin 
			roundKeySelect = tracker;
			mainMuxSelect = 3'b000;
			Next_state= AddRoundKeyInitial3;
			end
			AddRoundKeyInitial3: 
			begin
			Next_state = AddRoundKeyInitial4;
			end
			AddRoundKeyInitial4:
			begin
			tracker_in++;
			Next_state = InvShiftRows2;
			end
			InvShiftRows2:
			begin
			mainMuxSelect = 3'b001;
			Next_state = InvShiftRows3;
			end
			InvShiftRows3:
			begin
			Next_state = InvSubBytes1;
			end
			InvSubBytes1:
			begin
			mainMuxSelect = 3'b111;
			Next_state = InvSubBytes2;
			end
			InvSubBytes2:
			begin
			mainMuxSelect = 3'b011;
			Next_state = InvSubBytes3;
			end
			InvSubBytes3:
			begin
			Next_state = AddRoundKey1;
			end
			AddRoundKey1:
			begin
			mainMuxSelect = 3'b111;
			Next_state = AddRoundKey2;
			end
			AddRoundKey2:
			begin 
			roundKeySelect = tracker;
			mainMuxSelect = 3'b000;
			Next_state= AddRoundKey3;
			end
			AddRoundKey3: 
			begin
			Next_state = AddRoundKey4;
			end
			AddRoundKey4:
			begin
			tracker_in++;
			Next_state = InvMixCols1;
			end
			InvMixCols1:
			begin
			InvColSelect = 2'b00;
			InvColDecSelect = 2'b00;
			Next_state=InvMixCols2;
			end
			InvMixCols2:
			begin
			InvColSelect = 2'b01;
			InvColDecSelect = 2'b01;
			Next_state=InvMixCols3;
			end
			InvMixCols3:
			begin
			InvColSelect = 2'b10;
			InvColDecSelect = 2'b10;
			Next_state=InvMixCols4;
			end
			InvMixCols4:
			begin 
			InvColSelect = 2'b11;
			InvColDecSelect = 2'b11;
			Next_state = Checker;
			end
			Checker:
			begin
			mainMuxSelect = 3'b010;
			if(tracker == 4'b1010)
			Next_state = InvShiftRowsFinal1;
			else
			Next_state = InvShiftRows2;
			end
			InvShiftRowsFinal1:
			begin
			mainMuxSelect = 3'b111;
			Next_state = InvShiftRowsFinal2;
			end
			InvShiftRowsFinal2:
			begin
			mainMuxSelect = 3'b001;
			Next_state = InvShiftRowsFinal3;
			end
			InvShiftRowsFinal3:
			begin
			Next_state = InvSubBytesFinal1;
			end
			InvSubBytesFinal1:
			begin
			mainMuxSelect = 3'b111;
			Next_state = InvSubBytesFinal2;
			end
			InvSubBytesFinal2:
			begin
			mainMuxSelect = 3'b011;
			Next_state = InvSubBytesFinal3;
			end
			InvSubBytesFinal3:
			begin
			Next_state = AddRoundKeyFinal1;
			end
			AddRoundKeyFinal1:
			begin
			mainMuxSelect = 3'b111;
			Next_state = AddRoundKeyFinal2;
			end
			AddRoundKeyFinal2:
			begin 
			roundKeySelect = tracker;
			mainMuxSelect = 3'b000;
			Next_state= AddRoundKeyFinal3;
			end
			AddRoundKeyFinal3: 
			begin
			Next_state = DONE;
			end
			DONE:
			begin
			AES_DONE = 1'b1;
			if(AES_START == 1'b0)
			begin
			Next_state = WAIT;
			end
			else
			begin
			Next_state = DONE;
			end
			end
			
			default: ;
		


	endcase
	end

assign AES_MSG_DEC = state;		
			

endmodule







