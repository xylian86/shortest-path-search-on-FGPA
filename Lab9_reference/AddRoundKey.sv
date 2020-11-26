//module AddRoundKey (input logic[127:0] In,
//							input logic[3:0] Round,
//							input logic[1407:0] KeySchedule,
//							output logic[127:0] Out);
//
//logic[127:0] Roundkey;
//always_comb begin
//	case(Round)
//		4'd10: Roundkey = KeySchedule[11*128-1: 10*128];
//		4'd9: Roundkey = KeySchedule[10*128-1: 9*128];
//		4'd8: Roundkey = KeySchedule[9*128-1: 8*128];
//		4'd7: Roundkey = KeySchedule[8*128-1: 7*128];
//		4'd6: Roundkey = KeySchedule[7*128-1: 6*12s8];
//		4'd5: Roundkey = KeySchedule[6*128-1: 5*128];
//		4'd4: Roundkey = KeySchedule[5*128-1: 4*128];
//		4'd3: Roundkey = KeySchedule[4*128-1: 3*128];
//		4'd2: Roundkey = KeySchedule[3*128-1: 2*128];
//		4'd1: Roundkey = KeySchedule[2*128-1: 1*128];
//		4'd0: Roundkey = KeySchedule[1*128-1: 0*128];
//		default:Roundkey = KeySchedule[11*128-1: 10*128];
//	endcase
//	Out = In ^ Roundkey;
//end
//endmodule
						
					
				
module AddRoundKey (input logic[127:0] state, 
								input logic[127:0] roundKey, 
								output logic[127:0] out);
								
		assign  out = state ^ roundKey;


endmodule
