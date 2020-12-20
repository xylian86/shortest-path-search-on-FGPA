//-------------------------------------------------------------------------
//      lab8.sv                                                          --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Modified by Po-Han Huang                                         --
//      10/06/2017                                                       --
//                                                                       --
//      Fall 2017 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 8                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab8( input               CLOCK_50,PS2_CLK,
             input        [3:0]  KEY,          //bit 0 is set up as Reset
				 input [15:0] SW,
				 input [9:0] XMOV_MOUSE,YMOV_MOUSE,
				 input LEFT,RIGHT,
             //output logic [6:0]  HEX0, HEX1,
             // VGA Interface 
				 //output logic [7:0] LEDG,			  //LED used to show the direction key
				 
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
                                 DRAM_CLK      //SDRAM Clock
                    );
    
    logic Reset_h, Clk, SetColor,is_mouse,is_usbmouse;
    logic [7:0] keycode;
	 logic [7:0] led;
	 logic [31:0] path1_export,path2_export;
    
    assign Clk = CLOCK_50;
    always_ff @ (posedge Clk) begin
        Reset_h <= ~(KEY[0]);        // The push buttons are active low
		  SetColor <= ~(SW[0]);
		  //LEDG<=led;						 // The led will show the key we push.
    end
	 
	 
    
    logic [1:0] hpi_addr;
    logic [15:0] hpi_data_in, hpi_data_out;
    logic hpi_r, hpi_w, hpi_cs, hpi_reset;
	 
	 //Using for color_mapper input
	 logic [9:0] DrawX, DrawY,Ball_X_OUT, Ball_Y_OUT;
	 logic [9:0] pos_x_out, pos_y_out;
	 logic [1:0] data;
	 
	 logic is_ball;
	 
	 logic STOREBEGIN,STOREEND;
	 
	 logic cityname;
	 logic [31:0] storedata;
	 //assign led = DrawX;
	 
	 ramstore store(.*);
	 ramstore2 store2(.*);
	 detect beginend_instance(.*);
    
    // Interface between NIOS II and EZ-OTG chip
    hpi_io_intf hpi_io_inst(
                            .Clk(Clk),
                            .Reset(Reset_h),
                            // signals connected to NIOS II
                            .from_sw_address(hpi_addr),
                            .from_sw_data_in(hpi_data_in),
                            .from_sw_data_out(hpi_data_out),
                            .from_sw_r(hpi_r),
                            .from_sw_w(hpi_w),
                            .from_sw_cs(hpi_cs),
                            .from_sw_reset(hpi_reset),
                            // signals connected to EZ-OTG chip
                            .OTG_DATA(OTG_DATA),    
                            .OTG_ADDR(OTG_ADDR),    
                            .OTG_RD_N(OTG_RD_N),    
                            .OTG_WR_N(OTG_WR_N),    
                            .OTG_CS_N(OTG_CS_N),
                            .OTG_RST_N(OTG_RST_N)
    );
     
     // You need to make sure that the port names here match the ports in Qsys-generated codes.
     lab8_soc nios_system(
                             .clk_clk(Clk),         
                             .reset_reset_n(1'b1),    // Never reset NIOS
                             .sdram_wire_addr(DRAM_ADDR), 
                             .sdram_wire_ba(DRAM_BA),   
                             .sdram_wire_cas_n(DRAM_CAS_N),
                             .sdram_wire_cke(DRAM_CKE),  
                             .sdram_wire_cs_n(DRAM_CS_N), 
                             .sdram_wire_dq(DRAM_DQ),   
                             .sdram_wire_dqm(DRAM_DQM),  
                             .sdram_wire_ras_n(DRAM_RAS_N),
                             .sdram_wire_we_n(DRAM_WE_N), 
                             .sdram_clk_clk(DRAM_CLK),
                             .keycode_export(keycode),  
                             .otg_hpi_address_export(hpi_addr),
                             .otg_hpi_data_in_port(hpi_data_in),
                             .otg_hpi_data_out_port(hpi_data_out),
                             .otg_hpi_cs_export(hpi_cs),
                             .otg_hpi_r_export(hpi_r),
                             .otg_hpi_w_export(hpi_w),
                             .otg_hpi_reset_export(hpi_reset),
									  .path1_export(path1_export),
									  .path2_export(path2_export),
									  .pos_x_export(pos_x_out),
									  .pos_y_export(pos_y_out)
    );
    
    // Use PLL to generate the 25MHZ VGA_CLK.
    // You will have to generate it on your own in simulation.
    vga_clk vga_clk_instance(.inclk0(Clk), .c0(VGA_CLK));
    
    // TODO: Fill in the connections for the rest of the modules 
    VGA_controller vga_controller_instance(.Reset(Reset_h), .*);
	 
	 mouseclick mouse(.Reset(Reset_h), .frame_clk(VGA_VS), .*);
	 usbmouse usbmouseclick(.Reset(Reset_h), .frame_clk(VGA_VS), .*);
	 //color_mapper_mouse color_instance(.*,.key1(SetColor));
	 
    
    // Which signal should be frame_clk?
	 //VGA_VS. Because VGA_HS is Horizontal Timing with 25MHZ, not suitable for 60HZ signal.
    //ball ball_instance(.Reset(Reset_h), .frame_clk(VGA_VS), .*);
    
    color_mapper color_instance(.*,.key1(SetColor));
    
    // Display keycode on hex display
    //HexDriver hex_inst_0 (keycode[3:0], HEX0);
    //HexDriver hex_inst_1 (keycode[7:4], HEX1);
	 
	 //This part is used to show the key we push and the data passed into the DE2-115 board.
		
    
    /**************************************************************************************
        ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
        Hidden Question #1/2:
        What are the advantages and/or disadvantages of using a USB interface over PS/2 interface to
             connect to the keyboard? List any two.  Give an answer in your Post-Lab.
		  Answer: 
		  Advantages:
		  1. The USB supports hot plug, which means that you can plug it in and use it immediately, 
		  and then you can just pull the USB plug out when it's not in use. But not for PS2 devices.
		  2.	USB is a bus that can connect with many devices, however, the PS/2 port can only connect with one device.
		  Disadvantages:
		  1.	USB uses polling method while PS/2 uses interrupt method. In addition, the interrput method will not 
		  keep asking the keyboard for input, so the efficiency of PS/2 will be higher than USB.
		  2.	If USB is used by different devices, there will be delay in the response time. However, for 
	     PS/2 port, this will not happen because interrput always work as the highest priority in operating systems.
    **************************************************************************************/
endmodule
