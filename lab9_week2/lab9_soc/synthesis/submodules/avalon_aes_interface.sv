/************************************************************************
Avalon-MM Interface for AES Decryption IP Core

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department

Register Map:

 0-3 : 4x 32bit AES Key
 4-7 : 4x 32bit AES Encrypted Message
 8-11: 4x 32bit AES Decrypted Message
   12: Not Used
	13: Not Used
   14: 32bit Start Register
   15: 32bit Done Register

************************************************************************/

module avalon_aes_interface (
	// Avalon Clock Input
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [3:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit
	output logic [31:0] EXPORT_DATA		// Exported Conduit Signal to LEDs
);

	logic[15:0][31:0] Reg_list;
	logic[3:0] [31:0] Reg_temp;
	logic finish;//week2

	assign EXPORT_DATA={Reg_list[4][31:16], Reg_list[7][15:0]};
	always_ff @ (posedge CLK)
	begin
		if (RESET)
			begin
				//Can use for loop.
				Reg_list[0]<=32'b0;
				Reg_list[1]<=32'b0;
				Reg_list[2]<=32'b0;
				Reg_list[3]<=32'b0;
				Reg_list[4]<=32'b0;
				Reg_list[5]<=32'b0;
				Reg_list[6]<=32'b0;
				Reg_list[7]<=32'b0;
				Reg_list[8]<=32'b0;
				Reg_list[9]<=32'b0;
				Reg_list[10]<=32'b0;
				Reg_list[11]<=32'b0;
				Reg_list[12]<=32'b0;
				Reg_list[13]<=32'b0;
				Reg_list[14]<=32'b0;
				Reg_list[15]<=32'b0;
			 end
		 if (AVL_WRITE && AVL_CS)
			begin
				case(AVL_BYTE_EN)
					4'b0001:
						Reg_list[AVL_ADDR]<={Reg_list[AVL_ADDR][31:8],AVL_WRITEDATA[7:0]};
					4'b0010:
						Reg_list[AVL_ADDR]<={Reg_list[AVL_ADDR][31:16],AVL_WRITEDATA[15:8],Reg_list[AVL_ADDR][7:0]};
					4'b0100:
						Reg_list[AVL_ADDR]<={Reg_list[AVL_ADDR][31:24],AVL_WRITEDATA[23:16],Reg_list[AVL_ADDR][15:0]};
					4'b1000:
						Reg_list[AVL_ADDR]<={AVL_WRITEDATA[31:24],Reg_list[AVL_ADDR][23:0]};
					4'b0011:
						Reg_list[AVL_ADDR]<={Reg_list[AVL_ADDR][31:16],AVL_WRITEDATA[15:0]};
					4'b1100:
						Reg_list[AVL_ADDR]<={AVL_WRITEDATA[31:16],Reg_list[AVL_ADDR][15:0]};
					default:
						Reg_list[AVL_ADDR]<=AVL_WRITEDATA[31:0];
				endcase
			end
//		//WEEK2
//		 if (finish)
//			begin
//				Reg_list[8][31:0] <=  Reg_temp[0];
//				Reg_list[9][31:0] <=  Reg_temp[1];
//				Reg_list[10][31:0] <=  Reg_temp[2];
//				Reg_list[11][31:0] <=  Reg_temp[3];
//				Reg_list[15][0] <= finish;
//			end
						
	end
	always_comb
		begin
			if(AVL_READ&AVL_CS)
				begin 
					AVL_READDATA=Reg_list[AVL_ADDR];
				end
			else
				begin
					AVL_READDATA=32'hX;
				end
	   end
		
				

endmodule
