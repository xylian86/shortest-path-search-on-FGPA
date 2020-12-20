//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  12-08-2017                               --
//    Spring 2018 Distribution                                           --
//                                                                       --
//    For use with ECE 385 Lab 8                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------
module  mouseclick ( input         Clk,                // 50 MHz clock
                             Reset,              // Active-high reset signal
                             frame_clk,          // The clock indicating a new frame (~60Hz)
               input [9:0]   DrawX, DrawY,       // Current pixel coordinates
					input logic [9:0] XMOV_MOUSE,YMOV_MOUSE,
               output logic  is_mouse             // Whether current pixel belongs to ball or background
              );
			  
	 logic frame_clk_delayed, frame_clk_rising_edge;
	 logic [9:0] XMOTION,YMOTION;
	 
    always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
	always_comb
	begin
	XMOTION=10'd0;
	YMOTION=10'd0;
	if(frame_clk_rising_edge)
		XMOTION=XMOV_MOUSE;
		YMOTION=YMOV_MOUSE;
	end
    parameter [9:0] Ball_Size = 10'd4;
    int DistX, DistY, Size;
    assign DistX = DrawX - XMOTION;
    assign DistY = DrawY - 10'd480 + YMOTION;
    assign Size = Ball_Size;
	 always_comb
	 begin
        if ( ( DistX*DistX + DistY*DistY) <= (Size*Size) ) 
            is_mouse = 1'b1;
        else
            is_mouse = 1'b0;
	 end
    
endmodule
