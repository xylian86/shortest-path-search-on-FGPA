module final_high_level(input               CLOCK_50,
             input        [3:0]  KEY,          //bit 0 is set up as Reset
				 input [15:0] SW,
             output logic [6:0]  HEX0,HEX1,HEX2,HEX3,
             // VGA Interface 
				 output logic [7:0] LEDG,			  //LED used to show the direction key
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
				//////// CLOCK //////////
   input CLOCK2_50,
   input CLOCK3_50,
	input ENETCLK_25,

	//////// SEG7 //////////

	//////// PS2 //////////
	inout PS2_CLK,
	inout PS2_DAT
				);
				
logic LEFT;
logic RIGHT;
assign LEFT=LEDG[0];
assign RIGHT=LEDG[1];
lab8 lab8file(.*);

logic [9:0] XMOV_MOUSE;
logic [9:0] YMOV_MOUSE;
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