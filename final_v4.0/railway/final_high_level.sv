module final_high_level(
				 //IO and normal clock
				 input               CLOCK_50,
             input        [3:0]  KEY,          //bit 0 is set up as Reset
				 input [15:0] SW,
             output logic [6:0]  HEX0,HEX1,HEX2,HEX3,
             // VGA Interface 
				 output logic [7:0] LEDG,LEDR,			  //LED used to show the direction key
             output logic [7:0]  VGA_R,        //VGA Red
                                 VGA_G,        //VGA Green
                                 VGA_B,        //VGA Blue
             output logic        VGA_CLK,      //VGA Clock
                                 VGA_SYNC_N,   //VGA Sync signal
                                 VGA_BLANK_N,  //VGA Blank signal
                                 VGA_VS,       //VGA virtical sync signal
                                 VGA_HS,       //VGA horizontal sync signal
             // CY7C67200 Interface
             inout  wire  [15:0] OTG_DATA,     //CY7C67200 Data bus 16 Bits
             output logic [1:0]  OTG_ADDR,     //CY7C67200 Address 2 Bits
             output logic        OTG_CS_N,     //CY7C67200 Chip Select
                                 OTG_RD_N,     //CY7C67200 Write
                                 OTG_WR_N,     //CY7C67200 Read
                                 OTG_RST_N,    //CY7C67200 Reset
             input               OTG_INT,      //CY7C67200 Interrupt
             // SDRAM Interface for Nios II Software
             output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
             inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
             output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
             output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
             output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
                                 DRAM_CAS_N,   //SDRAM Column Address Strobe
                                 DRAM_CKE,     //SDRAM Clock Enable
                                 DRAM_WE_N,    //SDRAM Write Enable
                                 DRAM_CS_N,    //SDRAM Chip Select
											DRAM_CLK,      //SDRAM Clock
				//sound
				inout I2C_SDAT,						//I2C Data
				output I2C_SCLK,AUD_XCK,AUD_BCLK,//I2C clock, USB clock and BCLK
				output reg AUD_DACLRCK,				//synchronizing the left channel and right channel
				output AUD_DACDAT,					//DAC data for CODEC chip
	
				//PS2
				inout PS2_CLK,							//PS2 clk
				inout PS2_DAT							//PS2 data
				);
				
logic LEFT;
logic RIGHT;
assign LEFT=LEDG[0];
assign RIGHT=LEDG[1];
//Graph and A star file
lab8 lab8file(.*);

// Sound file
Top SoundTop(.clk(CLOCK_50),
	.SDIN(I2C_SDAT),
	.SCLK(I2C_SCLK),
	.DAC_LR_CLK(AUD_DACLRCK),
	.DAC_DATA(AUD_DACDAT),
	.USB_clk(AUD_XCK),
	.BCLK(AUD_BCLK),
	.SW0(SW[0]),
	.ACK_LEDR(LEDR[2:0]),
	.reset(KEY[0]),
	);

logic [9:0] XMOV_MOUSE;
logic [9:0] YMOV_MOUSE;

logic [7:0] X_CHANGE;
logic [7:0] Y_CHANGE;

//Mouse file
ps2 U1(.iSTART(KEY[0]),  //press the button for transmitting instrucions to device;
           .iRST_n(KEY[1]),  //global reset signal;
           .iCLK_50(CLOCK_50),  //clock source;
           .PS2_CLK(PS2_CLK), //ps2_clock signal inout;
           .PS2_DAT(PS2_DAT), //ps2_data  signal inout;
           .oLEFBUT(LEDG[0]),  //left button press display;
           .oRIGBUT(LEDG[1]),  //right button press display;
           .oMIDBUT(LEDG[2]),  //middle button press display;
           .oX_MOV1(HEX0),  //lower SEG of mouse displacement display for X axis.
           .oX_MOV2(HEX1),  //higher SEG of mouse displacement display for X axis.
           .oY_MOV1(HEX2),  //lower SEG of mouse displacement display for Y axis.
           .oY_MOV2(HEX3),
			  .*); //higher SEG of mouse displacement display for Y axis. 

endmodule