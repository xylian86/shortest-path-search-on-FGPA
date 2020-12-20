//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  10-06-2017                               --
//                                                                       --
//    Fall 2017 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 8                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------

// color_mapper: Decide which color to be output to VGA for each pixel.
module  color_mapper_mouse ( input        [1:0]       data,            // Whether current pixel belongs to ball 
                                                              //   or background (computed in ball.sv)
							  input is_mouse,is_usbmouse,
							  input 			[9:0] XMOV_MOUSE,YMOV_MOUSE,
							  input key1,
							  input LEFT,RIGHT, 
                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
    
    logic [7:0] Red, Green, Blue;
    // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
	 logic flagsee;
	 logic flagnosee;
	always_ff @(posedge LEFT)
	begin
		if(key1==0)
			flagsee<=1'd0;
		else
			flagsee<=1'd1;
	end
	
	always_ff @(posedge RIGHT)
	begin
	if(key1==0)
		flagnosee<=1'd1;
	else
		flagnosee<=1'd0;
	end
	
	 

    // Assign color based on is_ball signal
    always_comb
    begin
		if (is_mouse==1)
			begin
					Red=8'd0;
					Green=8'd255;
					Blue=8'd255;
			end	
		else
			 unique case(data)
					2'd0:
						begin
						//if(flag && (DrawX-1'd1<=XMOV_MOUSE&&XMOV_MOUSE<=DrawX+1'd1) && (DrawY-1'd1<=(10'd480-YMOV_MOUSE)&&(10'd480-YMOV_MOUSE)<=DrawY+1'd1))
						if(flagsee&&(~flagnosee) && (DrawX-1'd1<=XMOV_MOUSE&&XMOV_MOUSE<=DrawX+1'd1) && (DrawY-1'd1<=(10'd480-YMOV_MOUSE)&&(10'd480-YMOV_MOUSE)<=DrawY+1'd1))
							begin
							Red=8'd255;
							Green=8'd0;
							Blue=8'd0;
							end
						else
						begin
							Red=8'd0;
							Green=8'd0;
							Blue=8'd0;
						end
						end
					
					2'd1:
						begin
							Red=8'd255;
							Green=8'd255;
							Blue=8'd255;
						end
					2'd2:
							begin
							Red=8'd85;
							Green=8'd109;
							Blue=8'd75;
							end
					2'd3:
						begin
							Red=8'd255;
							Green=8'd195;
							Blue=8'd195;
						end
					default:
						begin
							Red=8'd255;
							Green=8'd255;
							Blue=8'd255;
						end
					endcase
					
					
//			  case(data)
//					1'd1:
//						begin
//							Red=8'hff;
//							Green=8'hff;
//							Blue=8'hff;
//						end
//					default:
//						begin
//							Red=8'h00;
//							Green=8'h00;
//							Blue=8'h00;
//						end
//					endcase
//        if (is_ball == 1'b1) 
//        begin
//            // White ball
//            Red = 8'hff;
//            Green = 8'hff;
//            Blue = 8'hff;
//        end
//        else 
//        begin
//            // Background with nice color gradient
//            Red = 8'h3f; 
//            Green = 8'h00;
//            Blue = 8'h7f - {1'b0, DrawX[9:3]};
//        end

			

   end 
    
endmodule

/*two color*/
//module  color_mapper ( input               data,            // Whether current pixel belongs to ball 
//                                                              //   or background (computed in ball.sv)
//                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
//                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
//                     );
//    
//    logic [7:0] Red, Green, Blue;
//    // Output colors to VGA
//    assign VGA_R = Red;
//    assign VGA_G = Green;
//    assign VGA_B = Blue;
//	 
//
//    // Assign color based on is_ball signal
//    always_comb
//    begin
////			 unique case(data)
////					3'd1:
////						begin
////							Red=8'd208;
////							Green=8'd215;
////							Blue=8'd205;
////						end
////					
////					3'd2:
////						begin
////							Red=8'd255;
////							Green=8'd255;
////							Blue=8'd255;
////						end
////					3'd3:
////						begin
////							Red=8'd85;
////							Green=8'd109;
////							Blue=8'd75;
////						end
////					3'd4:
////						begin
////							Red=8'd0;
////							Green=8'd0;
////							Blue=8'd0;
////						end
////						
////					3'd5:
////						begin
////							Red=8'd117;
////							Green=8'd136;
////							Blue=8'd109;
////						end
////					3'd6:
////						begin
////							Red=8'd255;
////							Green=8'd195;
////							Blue=8'd195;
////						end
////					default:
////						begin
////							Red=8'd255;
////							Green=8'd255;
////							Blue=8'd255;
////						end
////					endcase
//			  case(data)
//					1'd1:
//						begin
//							Red=8'hff;
//							Green=8'hff;
//							Blue=8'hff;
//						end
//					default:
//						begin
//							Red=8'h00;
//							Green=8'h00;
//							Blue=8'h00;
//						end
//					endcase
////        if (is_ball == 1'b1) 
////        begin
////            // White ball
////            Red = 8'hff;
////            Green = 8'hff;
////            Blue = 8'hff;
////        end
////        else 
////        begin
////            // Background with nice color gradient
////            Red = 8'h3f; 
////            Green = 8'h00;
////            Blue = 8'h7f - {1'b0, DrawX[9:3]};
////        end
//
//			
//
//   end 
//    
//endmodule
