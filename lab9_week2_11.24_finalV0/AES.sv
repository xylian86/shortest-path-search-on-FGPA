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
	output logic [127:0] AES_MSG_DEC,
	output logic [127:0] curout
);


//Define the variables
logic [1407:0] keySchedule;
logic [127:0]state;
logic [127:0]next_state;
logic [127:0]copy_state;
logic [127:0]shiftout;
logic [127:0]Sub_Out;
logic [127:0]roundkeyout;
logic [31:0]invin;
logic [31:0]invout;
logic [127:0]inputRoundKey;
logic [4:0]count1_cur;
logic [4:0]count1_next;
logic [4:0]count2_cur;
logic [4:0]count2_next;
logic [2:0]muxsignal;
logic [127:0]datastream;
logic [127:0]cache;
logic [127:0]cacheout;
//define the state
	enum logic [4:0]{
		WAIT,
		KEY_SCHEDULE,
		ADDROUNDKEY0,

		INVSHIFTROWSLOOP,
		INVSUBBYTESLOOP,
		ADDROUNDKEYLOOP,
		INVMIXCOLUMNS1,
		INVMIXCOLUMNS2,
		INVMIXCOLUMNS3,
		INVMIXCOLUMNS4,
		INVMIXCOLUMNSfinish,

		INVSHIFTROWS1,
		INVSUBBYTES1,
		ADDROUNDKEY1,
		DONE
	} MAINSTATE, NEXTSTATE;

	
mux3 #(128) mainMux  (.a0(state),
							 .a1(roundkeyout),
							 .a2(shiftout),
							 .a3(Sub_Out),
							 .a4(AES_MSG_ENC),
							 .a5(cacheout),
							 .select(muxsignal), 
							 .out(datastream));
							 
//module instances
KeyExpansion keyEx(.clk(CLK), 
					    .Cipherkey(AES_KEY), 
					    .KeySchedule(keySchedule));

AddRoundKey roundMod(.state(state), 
							.key(inputRoundKey),
							.out(roundkeyout));
								
InvShiftRows shiftMod(.data_in(state), 
							 .data_out(shiftout));	
								  
InvMixColumns ColMod(.in(invin),
							.out(invout));
							
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


	always_ff @(posedge CLK)
	begin
		if (RESET) 
			begin
			MAINSTATE <= WAIT;
			state <= 128'b0;
			count1_cur <= 4'b0;
			count2_cur <= 4'b0;
			cacheout <= 128'b0;
			end
		
		else 
			begin
			cacheout <= cache;
			state <= datastream;
			//state <= next_state;
			MAINSTATE <= NEXTSTATE;
			count1_cur <= count1_next;
			count2_cur <= count2_next;
			end
	end

	
	always_comb begin
			count1_next = count1_cur;
			count2_next = count2_cur;
			NEXTSTATE = MAINSTATE;
			unique case (MAINSTATE)
			WAIT:
				begin
				if (AES_START ==1'b1)
					begin
					NEXTSTATE = KEY_SCHEDULE;
					end 
				else 
					begin
					NEXTSTATE = WAIT;
					end
				end
			
			// give ten clocks to generate keys
			KEY_SCHEDULE:
				begin
				if (count1_cur == 4'd10) 
					begin
					NEXTSTATE = ADDROUNDKEY0;
					end
				else 
					begin
					NEXTSTATE = KEY_SCHEDULE;
					count1_next = count1_cur + 4'b1;
					end
				end
			
			ADDROUNDKEY0: 
				NEXTSTATE = INVSHIFTROWSLOOP;		
			INVSHIFTROWSLOOP: 
				NEXTSTATE = INVSUBBYTESLOOP;	
			INVSUBBYTESLOOP: 
				NEXTSTATE = ADDROUNDKEYLOOP;
			ADDROUNDKEYLOOP:
				NEXTSTATE = INVMIXCOLUMNS1;
			INVMIXCOLUMNS1: 
				NEXTSTATE = INVMIXCOLUMNS2;		
			INVMIXCOLUMNS2: 
				NEXTSTATE = INVMIXCOLUMNS3;					
			INVMIXCOLUMNS3: 
				NEXTSTATE = INVMIXCOLUMNS4;
			INVMIXCOLUMNS4: 
				NEXTSTATE = INVMIXCOLUMNSfinish;

			INVMIXCOLUMNSfinish:begin
				if (count2_cur == 4'd8)
					begin
					NEXTSTATE = INVSHIFTROWS1;
					end
				else 
					begin
					NEXTSTATE = INVSHIFTROWSLOOP;
					count2_next = count2_cur + 4'b1;
					end
				end
			
			INVSHIFTROWS1: 
				NEXTSTATE = INVSUBBYTES1;		
			INVSUBBYTES1:	
				NEXTSTATE = ADDROUNDKEY1;	
			ADDROUNDKEY1: 
				NEXTSTATE = DONE;
			
			DONE:
				begin
				if (AES_START==0) 
					begin
					NEXTSTATE = WAIT;
					end
				else 
					begin
					NEXTSTATE = DONE;
					end
				end
			
			default: 
				begin
				NEXTSTATE = WAIT;
				end
		endcase
		
		
		
		//next_state = state;		
		muxsignal = 3'b000;
		AES_DONE = 1'b0;
		AES_MSG_DEC = 128'b0;
		invin = 32'b0;
		inputRoundKey = 128'b0;
		cache = cacheout;
		curout = 128'b0;
		case (MAINSTATE)
			WAIT:
				begin
				end
			
			KEY_SCHEDULE:begin
				muxsignal = 3'b100;
				//next_state = AES_MSG_ENC;
			end
			
			ADDROUNDKEY0:
				begin
				inputRoundKey = keySchedule[127:0];
				muxsignal = 3'b001;
				curout = state;
				//next_state = roundkeyout;
				end
			
			INVSHIFTROWSLOOP:
				begin
				muxsignal = 3'b010;
				curout = state;
				//next_state = shiftout;
				end
			
			INVSUBBYTESLOOP:
				begin
				muxsignal = 3'b011;
				curout = state;
				//next_state = Sub_Out;
				end
			
			ADDROUNDKEYLOOP:
				begin
				case (count2_cur)
					4'd8:inputRoundKey = keySchedule[1279:1152];
					4'd7:inputRoundKey = keySchedule[1151:1024];
					4'd6:inputRoundKey = keySchedule[1023:896];
					4'd5:inputRoundKey = keySchedule[895:768];
					4'd4:inputRoundKey = keySchedule[767:640];
					4'd3:inputRoundKey = keySchedule[639:512];
					4'd2:inputRoundKey = keySchedule[511:384];
					4'd1:inputRoundKey = keySchedule[383:256];
					4'd0:inputRoundKey = keySchedule[255:128];
					default: inputRoundKey = 128'b0;
				endcase
				muxsignal = 3'b001;
				curout = state;
				//next_state = roundkeyout;
				end
			
			INVMIXCOLUMNS1:
				begin
				invin = state[31:0];
				//next_state[63:32] = invout;
				cache[31:0] = invout;
				muxsignal = 3'd0;
				curout = cache;
				end
			
			INVMIXCOLUMNS2:
				begin
				invin = state[63:32];
				cache[63:32] = invout;
				//next_state[63:32] = invout;
				muxsignal = 3'd0;
				curout = cache;
				end
			
			INVMIXCOLUMNS3:
				begin
				invin = state[95:64];
				cache[95:64] = invout;
				muxsignal = 3'd0;
				curout = cache;
				end
			
			INVMIXCOLUMNS4:
				begin
				invin = state[127:96];
				muxsignal = 3'd0;
				cache[127:96] = invout;
				curout = cache;
				end
			
			INVMIXCOLUMNSfinish:
				begin
				muxsignal = 3'b101;
				curout = state;
				end
			
			INVSHIFTROWS1:
				begin
				muxsignal = 3'd2;
				curout = state;
				//next_state = shiftout;
				end
			
			INVSUBBYTES1:
				begin
				muxsignal = 3'd3;
				curout = state;
				//next_state = Sub_Out;				
				end
			
			ADDROUNDKEY1:
				begin
				inputRoundKey = keySchedule[1407:1280];
				muxsignal = 3'd1;
				curout = state;
				//next_state = roundkeyout;
				end
			
			DONE:
				begin
				AES_MSG_DEC = datastream;
				AES_DONE = 1'b1;
				end
			
			default: 
				begin
				end
		endcase
	end
endmodule

///************************************************************************
//AES Decryption Core Logic
//Dong Kai Wang, Fall 2017
//For use with ECE 385 Experiment 9
//University of Illinois ECE Department
//************************************************************************/
//module AES (
//	input	 logic CLK,
//	input  logic RESET,
//	input  logic AES_START,
//	output logic AES_DONE,
//	input  logic [127:0] AES_KEY,
//	input  logic [127:0] AES_MSG_ENC,
//	output logic [127:0] AES_MSG_DEC
//);
//
//
////Define the variables
//logic [1407:0] keySchedule;
//logic [127:0]state;
//logic [127:0]next_state;
//logic [127:0]copy_state;
//logic [127:0]shiftout;
//logic [127:0]Sub_Out;
//logic [127:0]roundkeyout;
//logic [31:0]invin;
//logic [31:0]invout;
//logic [127:0]inputRoundKey;
//logic [4:0]count1_cur;
//logic [4:0]count1_next;
//logic [4:0]count2_cur;
//logic [4:0]count2_next;
//logic [2:0]muxsignal;
//logic [127:0]datastream;
////define the state
//	enum logic [4:0]{
//		WAIT,
//		KEY_SCHEDULE,
//		ADDROUNDKEY0,
//
//		INVSHIFTROWSLOOP,
//		INVSUBBYTESLOOP,
//		ADDROUNDKEYLOOP,
//		INVMIXCOLUMNS1,
//		INVMIXCOLUMNS2,
//		INVMIXCOLUMNS3,
//		INVMIXCOLUMNS4,
//		INVMIXCOLUMNSfinish,
//
//		INVSHIFTROWS1,
//		INVSUBBYTES1,
//		ADDROUNDKEY1,
//		DONE
//	} MAINSTATE, NEXTSTATE;
//
//	
////mux3 #(128) mainMux  (.a0(state),
////							 .a1(roundkeyout),
////							 .a2(shiftout),
////							 .a3(Sub_Out),
////							 .a4(AES_MSG_ENC),
////							 .select(muxsignal), 
////							 .out(datastream));
//							 
////module instances
//KeyExpansion keyEx(.clk(CLK), 
//					    .Cipherkey(AES_KEY), 
//					    .KeySchedule(keySchedule));
//
//AddRoundKey roundMod(.state(state), 
//							.key(inputRoundKey),
//							.out(roundkeyout));
//								
//InvShiftRows shiftMod(.data_in(state), 
//							 .data_out(shiftout));	
//								  
//InvMixColumns ColMod(.in(invin),
//							.out(invout));
//							
//InvSubBytes sub0(.clk(CLK), .in(state[7:0]), .out(Sub_Out[7:0]));
//InvSubBytes sub1(.clk(CLK), .in(state[15:8]), .out(Sub_Out[15:8]));
//InvSubBytes sub2(.clk(CLK), .in(state[23:16]), .out(Sub_Out[23:16]));
//InvSubBytes sub3(.clk(CLK), .in(state[31:24]), .out(Sub_Out[31:24]));
//InvSubBytes sub4(.clk(CLK), .in(state[39:32]), .out(Sub_Out[39:32]));
//InvSubBytes sub5(.clk(CLK), .in(state[47:40]), .out(Sub_Out[47:40]));
//InvSubBytes sub6(.clk(CLK), .in(state[55:48]), .out(Sub_Out[55:48]));
//InvSubBytes sub7(.clk(CLK), .in(state[63:56]), .out(Sub_Out[63:56]));
//InvSubBytes sub8(.clk(CLK), .in(state[71:64]), .out(Sub_Out[71:64]));
//InvSubBytes sub9(.clk(CLK), .in(state[79:72]), .out(Sub_Out[79:72]));
//InvSubBytes sub10(.clk(CLK), .in(state[87:80]), .out(Sub_Out[87:80]));
//InvSubBytes sub11(.clk(CLK), .in(state[95:88]), .out(Sub_Out[95:88]));
//InvSubBytes sub12(.clk(CLK), .in(state[103:96]), .out(Sub_Out[103:96]));
//InvSubBytes sub13(.clk(CLK), .in(state[111:104]), .out(Sub_Out[111:104]));
//InvSubBytes sub14(.clk(CLK), .in(state[119:112]), .out(Sub_Out[119:112]));
//InvSubBytes sub15(.clk(CLK), .in(state[127:120]), .out(Sub_Out[127:120]));
//
//
//	always_ff @(posedge CLK)
//	begin
//		if (RESET) 
//			begin
//			MAINSTATE <= WAIT;
//			count1_cur <= 4'b0;
//			count2_cur <= 4'b0;
//			end
//		
//		else 
//			begin
//			//state <= datastream;
//			state <= next_state;
//			MAINSTATE <= NEXTSTATE;
//			count1_cur <= count1_next;
//			count2_cur <= count2_next;
//			end
//	end
//
//	
//	always_comb begin
//			count1_next = count1_cur;
//			count2_next = count2_cur;
//			NEXTSTATE = MAINSTATE;
//			unique case (MAINSTATE)
//			WAIT:
//				begin
//				if (AES_START ==1'b1)
//					begin
//					NEXTSTATE = KEY_SCHEDULE;
//					end 
//				else 
//					begin
//					NEXTSTATE = WAIT;
//					end
//				end
//			
//			// give ten clocks to generate keys
//			KEY_SCHEDULE:
//				begin
//				if (count1_cur == 4'd10) 
//					begin
//					NEXTSTATE = ADDROUNDKEY0;
//					end
//				else 
//					begin
//					NEXTSTATE = KEY_SCHEDULE;
//					count1_next = count1_cur + 4'b1;
//					end
//				end
//			
//			ADDROUNDKEY0: 
//				NEXTSTATE = INVSHIFTROWSLOOP;		
//			INVSHIFTROWSLOOP: 
//				NEXTSTATE = INVSUBBYTESLOOP;	
//			INVSUBBYTESLOOP: 
//				NEXTSTATE = ADDROUNDKEYLOOP;
//			ADDROUNDKEYLOOP:
//				NEXTSTATE = INVMIXCOLUMNS1;
//			INVMIXCOLUMNS1: 
//				NEXTSTATE = INVMIXCOLUMNS2;		
//			INVMIXCOLUMNS2: 
//				NEXTSTATE = INVMIXCOLUMNS3;					
//			INVMIXCOLUMNS3: 
//				NEXTSTATE = INVMIXCOLUMNS4;
//			INVMIXCOLUMNS4: 
//				NEXTSTATE = INVMIXCOLUMNSfinish;
//
//			INVMIXCOLUMNSfinish:begin
//				if (count2_cur == 4'd8)
//					begin
//					NEXTSTATE = INVSHIFTROWS1;
//					end
//				else 
//					begin
//					NEXTSTATE = INVSHIFTROWSLOOP;
//					count2_next = count2_cur + 4'b1;
//					end
//				end
//			
//			INVSHIFTROWS1: 
//				NEXTSTATE = INVSUBBYTES1;		
//			INVSUBBYTES1:	
//				NEXTSTATE = ADDROUNDKEY1;	
//			ADDROUNDKEY1: 
//				NEXTSTATE = DONE;
//			
//			DONE:
//				begin
//				if (AES_START==0) 
//					begin
//					NEXTSTATE = WAIT;
//					end
//				else 
//					begin
//					NEXTSTATE = DONE;
//					end
//				end
//			
//			default: 
//				begin
//				NEXTSTATE = WAIT;
//				end
//		endcase
//		
//		
//		
//		next_state = state;		
//		//muxsignal = 3'b0;
//		AES_DONE = 1'b0;
//		AES_MSG_DEC = 128'b0;
//		invin = 32'b0;
//		inputRoundKey = 128'b0;
//		case (MAINSTATE)
//			WAIT:
//				begin
//				end
//			
//			KEY_SCHEDULE:begin
//				//muxsignal = 3'd4;
//				next_state = AES_MSG_ENC;
//			end
//			
//			ADDROUNDKEY0:
//				begin
//				inputRoundKey = keySchedule[127:0];
//				//muxsignal = 3'd1;
//				next_state = roundkeyout;
//				end
//			
//			INVSHIFTROWSLOOP:
//				begin
//				//muxsignal = 3'd2;
//				next_state = shiftout;
//				end
//			
//			INVSUBBYTESLOOP:
//				begin
//				//muxsignal = 3'd3;
//				next_state = Sub_Out;
//				end
//			
//			ADDROUNDKEYLOOP:
//				begin
//				case (count2_cur)
//					4'd8:inputRoundKey = keySchedule[1279:1152];
//					4'd7:inputRoundKey = keySchedule[1151:1024];
//					4'd6:inputRoundKey = keySchedule[1023:896];
//					4'd5:inputRoundKey = keySchedule[895:768];
//					4'd4:inputRoundKey = keySchedule[767:640];
//					4'd3:inputRoundKey = keySchedule[639:512];
//					4'd2:inputRoundKey = keySchedule[511:384];
//					4'd1:inputRoundKey = keySchedule[383:256];
//					4'd0:inputRoundKey = keySchedule[255:128];
//					default: inputRoundKey = 128'b0;
//				endcase
//				//muxsignal = 3'd1;
//				next_state = roundkeyout;
//				end
//			
//			INVMIXCOLUMNS1:
//				begin
//				invin = state[31:0];
//				next_state[31:0] = invout;
//				//muxsignal = 3'd0;
//				end
//			
//			INVMIXCOLUMNS2:
//				begin
//				invin = state[63:32];
//				next_state[63:32] = invout;
//				//muxsignal = 3'd0;
//				end
//			
//			INVMIXCOLUMNS3:
//				begin
//				invin = state[95:64];
//				next_state[95:64] = invout;
//				//muxsignal = 3'd0;
//				end
//			
//			INVMIXCOLUMNS4:
//				begin
//				invin = state[127:96];
//				//muxsignal = 3'd0;
//				next_state[127:96] = invout;
//				end
//			
//			INVMIXCOLUMNSfinish:
//				begin
//				end
//			
//			INVSHIFTROWS1:
//				begin
//				//muxsignal = 3'd2;
//				next_state = shiftout;
//				end
//			
//			INVSUBBYTES1:
//				begin
//				//muxsignal = 3'd3;
//				next_state = Sub_Out;				
//				end
//			
//			ADDROUNDKEY1:
//				begin
//				inputRoundKey = keySchedule[1407:1280];
//				//muxsignal = 3'd1;
//				next_state = roundkeyout;
//				end
//			
//			DONE:
//				begin
//				AES_MSG_DEC = roundkeyout;
//				AES_DONE = 1'b1;
//				end
//			
//			default: 
//				begin
//				end
//		endcase
//	end
//endmodule
