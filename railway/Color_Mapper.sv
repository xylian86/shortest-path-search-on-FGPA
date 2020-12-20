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
module  color_mapper ( input        [1:0]       data,            // Whether current pixel belongs to ball 
                                                              //   or background (computed in ball.sv)
							  input is_mouse,is_usbmouse,
							  input [31:0] path1_export,path2_export,
							  //input [15:0] SW,
							  input logic [7:0] keycode,
							  input logic [9:0] XMOV_MOUSE,YMOV_MOUSE,Ball_X_OUT,Ball_Y_OUT,
							  input key1,
							  input LEFT,RIGHT, 
                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
							  input cityname,
//							  output logic [9:0] pos_x_out,pos_y_out,
                       output logic [7:0] VGA_R, VGA_G, VGA_B, // VGA RGB output
							  output logic STOREBEGIN,STOREEND,
							  output logic [31:0] storedata
                     );
    
    logic [7:0] Red, Green, Blue, Q,E; //Q means start, E means End. 
	 //logic [63:0] SW;
    // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
	 assign Q=8'h14;
	 assign E=8'h08;
	 logic flagsee;
	 logic flagnosee;
//	always_ff @(posedge LEFT)
//	begin
//		if(key1==0)
//			flagsee<=1'd0;
//		else
//			flagsee<=1'd1;
//	end
//	
//	always_ff @(posedge RIGHT)
//	begin
//	if(key1==0)
//		flagnosee<=1'd1;
//	else
//		flagnosee<=1'd0;
//	end
	
    // Assign color based on is_ball signal
 
 always_comb
    begin
		STOREBEGIN=1'd0;
		STOREEND=1'd0;
		storedata=32'd0;
		if(Ball_X_OUT<=10'd570&&Ball_X_OUT>=10'd568&&Ball_Y_OUT<=10'd98&&Ball_Y_OUT>=10'd96)//HAERBIN
			storedata=32'd1;
			
		if(Ball_X_OUT<=10'd564&&Ball_X_OUT>=10'd562&&Ball_Y_OUT<=10'd126&&Ball_Y_OUT>=10'd124)//CHANGCHUN
			storedata=32'd2;
			
		if(Ball_X_OUT<=10'd548&&Ball_X_OUT>=10'd546&&Ball_Y_OUT<=10'd161&&Ball_Y_OUT>=10'd159)//SHENYANG
			storedata=32'd3;
			
		if(Ball_X_OUT<=10'd466&&Ball_X_OUT>=10'd464&&Ball_Y_OUT<=10'd187&&Ball_Y_OUT>=10'd185)//BEIJING
			storedata=32'd4;
			
		if(Ball_X_OUT<=10'd479&&Ball_X_OUT>=10'd477&&Ball_Y_OUT<=10'd200&&Ball_Y_OUT>=10'd198)//TIANJIN
			storedata=32'd5;
			
		if(Ball_X_OUT<=10'd490&&Ball_X_OUT>=10'd488&&Ball_Y_OUT<=10'd230&&Ball_Y_OUT>=10'd228)//JINAN
			storedata=32'd6;
			
		if(Ball_X_OUT<=10'd528&&Ball_X_OUT>=10'd526&&Ball_Y_OUT<=10'd236&&Ball_Y_OUT>=10'd234)//QINGDAO
			storedata=32'd7;
			
		if(Ball_X_OUT<=10'd531&&Ball_X_OUT>=10'd529&&Ball_Y_OUT<=10'd302&&Ball_Y_OUT>=10'd300)//SHANGHAI
			storedata=32'd8;
			
		if(Ball_X_OUT<=10'd521&&Ball_X_OUT>=10'd519&&Ball_Y_OUT<=10'd312&&Ball_Y_OUT>=10'd310)//HANGZHOU
			storedata=32'd9;
			
		if(Ball_X_OUT<=10'd538&&Ball_X_OUT>=10'd536&&Ball_Y_OUT<=10'd318&&Ball_Y_OUT>=10'd316)//NINGBO
			storedata=32'd10;
			
		if(Ball_X_OUT<=10'd512&&Ball_X_OUT>=10'd510&&Ball_Y_OUT<=10'd376&&Ball_Y_OUT>=10'd374)//FUZHOU
			storedata=32'd11;
			
		if(Ball_X_OUT<=10'd495&&Ball_X_OUT>=10'd493&&Ball_Y_OUT<=10'd389&&Ball_Y_OUT>=10'd387)//XIAMEN
			storedata=32'd12;
			
		if(Ball_X_OUT<=10'd499&&Ball_X_OUT>=10'd497&&Ball_Y_OUT<=10'd287&&Ball_Y_OUT>=10'd285)//NANJING
			storedata=32'd13;
			
		if(Ball_X_OUT<=10'd479&&Ball_X_OUT>=10'd477&&Ball_Y_OUT<=10'd298&&Ball_Y_OUT>=10'd296)//HEFEI
			storedata=32'd14;
			
		if(Ball_X_OUT<=10'd464&&Ball_X_OUT>=10'd462&&Ball_Y_OUT<=10'd326&&Ball_Y_OUT>=10'd324)//NANCHANG
			storedata=32'd15;
			
		if(Ball_X_OUT<=10'd427&&Ball_X_OUT>=10'd425&&Ball_Y_OUT<=10'd408&&Ball_Y_OUT>=10'd406)//GUANGZHOU
			storedata=32'd16;
			
		if(Ball_X_OUT<=10'd437&&Ball_X_OUT>=10'd435&&Ball_Y_OUT<=10'd417&&Ball_Y_OUT>=10'd415)//SHENZHEN
			storedata=32'd17;
			
		if(Ball_X_OUT<=10'd437&&Ball_X_OUT>=10'd435&&Ball_Y_OUT<=10'd424&&Ball_Y_OUT>=10'd422)//HONGKONG
			storedata=32'd18;
			
		if(Ball_X_OUT<=10'd393&&Ball_X_OUT>=10'd391&&Ball_Y_OUT<=10'd459&&Ball_Y_OUT>=10'd457)//HAIKOU
			storedata=32'd19;
			
		if(Ball_X_OUT<=10'd373&&Ball_X_OUT>=10'd371&&Ball_Y_OUT<=10'd414&&Ball_Y_OUT>=10'd412)//NANNING
			storedata=32'd20;
			
		if(Ball_X_OUT<=10'd376&&Ball_X_OUT>=10'd374&&Ball_Y_OUT<=10'd260&&Ball_Y_OUT>=10'd258)//XIAN
			storedata=32'd21;
			
		if(Ball_X_OUT<=10'd404&&Ball_X_OUT>=10'd402&&Ball_Y_OUT<=10'd167&&Ball_Y_OUT>=10'd165)//HUHEHAOTE
			storedata=32'd22;
			
		if(Ball_X_OUT<=10'd445&&Ball_X_OUT>=10'd443&&Ball_Y_OUT<=10'd214&&Ball_Y_OUT>=10'd212)//SHIJIAZHUANG
			storedata=32'd23;
			
		if(Ball_X_OUT<=10'd422&&Ball_X_OUT>=10'd420&&Ball_Y_OUT<=10'd214&&Ball_Y_OUT>=10'd212)//TAIYUAN
			storedata=32'd24;
			
		if(Ball_X_OUT<=10'd435&&Ball_X_OUT>=10'd433&&Ball_Y_OUT<=10'd312&&Ball_Y_OUT>=10'd310)//WUHAN
			storedata=32'd25;
			
		if(Ball_X_OUT<=10'd421&&Ball_X_OUT>=10'd419&&Ball_Y_OUT<=10'd341&&Ball_Y_OUT>=10'd339)//CHANGSHA
			storedata=32'd26;
			
		if(Ball_X_OUT<=10'd334&&Ball_X_OUT>=10'd332&&Ball_Y_OUT<=10'd196&&Ball_Y_OUT>=10'd194)//YINCHUAN
			storedata=32'd27;
			
		if(Ball_X_OUT<=10'd301&&Ball_X_OUT>=10'd299&&Ball_Y_OUT<=10'd298&&Ball_Y_OUT>=10'd296)//CHENGDU
			storedata=32'd28;
			
		if(Ball_X_OUT<=10'd325&&Ball_X_OUT>=10'd323&&Ball_Y_OUT<=10'd319&&Ball_Y_OUT>=10'd317)//CHONGQING
			storedata=32'd29;
			
		if(Ball_X_OUT<=10'd326&&Ball_X_OUT>=10'd324&&Ball_Y_OUT<=10'd348&&Ball_Y_OUT>=10'd346)//GUIYANG
			storedata=32'd30;
			
		if(Ball_X_OUT<=10'd286&&Ball_X_OUT>=10'd284&&Ball_Y_OUT<=10'd368&&Ball_Y_OUT>=10'd366)//KUNMING
			storedata=32'd31;
			
		if(Ball_X_OUT<=10'd270&&Ball_X_OUT>=10'd268&&Ball_Y_OUT<=10'd224&&Ball_Y_OUT>=10'd222)//XINING
			storedata=32'd32;
			
		if(Ball_X_OUT<=10'd183&&Ball_X_OUT>=10'd181&&Ball_Y_OUT<=10'd304&&Ball_Y_OUT>=10'd302)//LASA
			storedata=32'd33;
			
		if(Ball_X_OUT<=10'd161&&Ball_X_OUT>=10'd159&&Ball_Y_OUT<=10'd108&&Ball_Y_OUT>=10'd106)//WULUMUQI
			storedata=32'd34;
			
		if(Ball_X_OUT<=10'd76&&Ball_X_OUT>=10'd74&&Ball_Y_OUT<=10'd154&&Ball_Y_OUT>=10'd152)//KASHI
			storedata=32'd35;
			
		if(Ball_X_OUT<=10'd178&&Ball_X_OUT>=10'd176&&Ball_Y_OUT<=10'd126&&Ball_Y_OUT>=10'd124)//TULUFAN
			storedata=32'd36;
			
		if(Ball_X_OUT<=10'd226&&Ball_X_OUT>=10'd224&&Ball_Y_OUT<=10'd139&&Ball_Y_OUT>=10'd137)//HAMI
			storedata=32'd37;
			
		if(Ball_X_OUT<=10'd237&&Ball_X_OUT>=10'd235&&Ball_Y_OUT<=10'd150&&Ball_Y_OUT>=10'd148)//DUNHUANG
			storedata=32'd38;
			
		if(Ball_X_OUT<=10'd259&&Ball_X_OUT>=10'd257&&Ball_Y_OUT<=10'd172&&Ball_Y_OUT>=10'd170)//JIAYUGUAN
			storedata=32'd39;
			
		if(Ball_X_OUT<=10'd290&&Ball_X_OUT>=10'd288&&Ball_Y_OUT<=10'd234&&Ball_Y_OUT>=10'd232)//LANZHOU
			storedata=32'd40;
			
		if(Ball_X_OUT<=10'd538&&Ball_X_OUT>=10'd536&&Ball_Y_OUT<=10'd390&&Ball_Y_OUT>=10'd388)//TAIPEI
			storedata=32'd41;
			
		if(Ball_X_OUT<=10'd529&&Ball_X_OUT>=10'd527&&Ball_Y_OUT<=10'd415&&Ball_Y_OUT>=10'd413)//GAOXIONG
			storedata=32'd42;
			
		if(Ball_X_OUT<=10'd333&&Ball_X_OUT>=10'd331&&Ball_Y_OUT<=10'd261&&Ball_Y_OUT>=10'd259)//BAOJI
			storedata=32'd43;
			
		if(Ball_X_OUT<=10'd378&&Ball_X_OUT>=10'd376&&Ball_Y_OUT<=10'd391&&Ball_Y_OUT>=10'd389)//LIUZHOU
			storedata=32'd44;
			
		if(Ball_X_OUT<=10'd393&&Ball_X_OUT>=10'd391&&Ball_Y_OUT<=10'd421&&Ball_Y_OUT>=10'd419)//ZHANJIANG
			storedata=32'd45;
			
		if(Ball_X_OUT<=10'd479&&Ball_X_OUT>=10'd477&&Ball_Y_OUT<=10'd220&&Ball_Y_OUT>=10'd218)//DEZHOU
			storedata=32'd46;
			
		//end
		if (is_usbmouse==1)
			begin
			Red=8'd0;
			Green=8'd255;
			Blue=8'd255;
			end
//				if(keycode==Q && Ball_X_OUT==DrawX &&Ball_Y_OUT==DrawY)
//					begin
//					Red=8'd255;
//					Green=8'd0;
//					Blue=8'd0;
//					STOREBEGIN=1'b1;
//					end
//				else if(keycode==E &&Ball_X_OUT==DrawX&&Ball_Y_OUT==DrawY )
//					begin
//					Red=8'd255;
//					Green=8'd255;
//					Blue=8'd0;
//					STOREEND=1'b1;
//					end
				//instruction
//				if(DrawX<=98 &&DrawX>=0 && DrawY<=20 &&DrawY>=0)
//					begin
//					if(Ball_X_OUT==10'd569 && Ball_Y_OUT==10'd97)
//						begin
//							choosecity=32'd1;
//							if(cityname==1'b0)
//							begin
//							Red=8'd255;
//							Green=8'd255;
//							Blue=8'd255;
//							end
//							else
//							begin
//							Red=8'd222;
//							Green=8'd12;
//							Blue=8'd12;
//							end
//						end
//					end
//				else
//				begin
//					choosecity=32'd0;
//					Red=8'd0;
//					Green=8'd255;
//					Blue=8'd255;
//				end
//			end	
		else
			 unique case(data)
					2'd0:
						begin
						//if(flag && (DrawX-1'd1<=XMOV_MOUSE&&XMOV_MOUSE<=DrawX+1'd1) && (DrawY-1'd1<=(10'd480-YMOV_MOUSE)&&(10'd480-YMOV_MOUSE)<=DrawY+1'd1))
						if(STOREBEGIN)
							begin
							Red=8'd255;
							Green=8'd0;
							Blue=8'd0;
							end
						if(STOREEND)
							begin
							Red=8'd255;
							Green=8'd255;
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
							if(path1_export[0]==1)
								begin
								if(DrawX<=569&&DrawX>=563&&DrawY<=125&&DrawY>=97)//HAERBIN->CHANGCHUN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[1]==1)
								begin
								if(DrawX<=563&&DrawX>=547&&DrawY<=160&&DrawY>=125)//CHANGCHUN->SHENYANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[2]==1)
								begin
								if(DrawX<=545&&DrawX>=497&&DrawY<=160&&DrawY>=153)//SHENYANG->BEIJING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=497&&DrawX>=467&&DrawY<=185&&DrawY>=154)//SHENYANG->BEIJING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[3]==1)
								begin
								if(DrawX<=478&&DrawX>=465&&DrawY<=199&&DrawY>=188)//BEIJING->TIANJIN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[4]==1)
								begin
								if(DrawX<=479&&DrawX>=477&&DrawY<=219&&DrawY>=199)//TIANJIN->DEZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[5]==1)
								begin
								if(DrawX<=489&&DrawX>=478&&DrawY<=229&&DrawY>=219)//DEZHOU->JINAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[6]==1)
								begin
								if(DrawX<=520&&DrawX>=492&&DrawY<=230&&DrawY>=228)//JINAN->QINGDAO
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=525&&DrawX>=520&&DrawY<=236&&DrawY>=229)//JINAN->QINGDAO
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[7]==1)
								begin
								if(DrawX<=511&&DrawX>=491&&DrawY<=284&&DrawY>=231)//JINAN->NANJING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[8]==1)
								begin
								if(DrawX<=529&&DrawX>=501&&DrawY<=299&&DrawY>=285)//NANJING->SHANGHAI
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[9]==1)
								begin
								if(DrawX<=529&&DrawX>=521&&DrawY<=311&&DrawY>=302)//SHANGHAI->HANGZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[10]==1)
								begin
								if(DrawX<=535&&DrawX>=520&&DrawY<=318&&DrawY>=313)//HANGZHOU->NINGBO
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[11]==1)
								begin
								if(DrawX<=536&&DrawX>=529&&DrawY<=349&&DrawY>=319)//NINGBO->FUZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=528&&DrawX>=512&&DrawY<=373&&DrawY>=349)//NINGBO->FUZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[12]==1)
								begin
								if(DrawX<=509&&DrawX>=496&&DrawY<=388&&DrawY>=375)//FUZHOU->XIAMEN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[13]==1)
								begin
								if(DrawX<=492&&DrawX>=437&&DrawY<=414&&DrawY>=389)//XIAMEN->SHENZHEN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[14]==1)
								begin
								if(DrawX<=492&&DrawX>=450&&DrawY<=388&&DrawY>=343)//XIAMEN->NANCHANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=462&&DrawX>=461&&DrawY<=337&&DrawY>=341)//XIAMEN->NANCHANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[15]==1)
								begin
								if(DrawX<=436&&DrawX>=436&&DrawY<=421&&DrawY>=418)//SHENZHEN->HONGKONG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
//The following part is used for register[62:0]
							if(path1_export[16]==1)
								begin
								if(DrawX<=434&&DrawX>=428&&DrawY<=415&&DrawY>=409)//GUANGZHOU->SHENZHEN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[17]==1)
								begin
								if(DrawX<=428&&DrawX>=420&&DrawY<=405&&DrawY>=357)//GUANGZHOU->CHANGSHA
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=420&&DrawX>=420&&DrawY<=354&&DrawY>=342)//GUANGZHOU->CHANGSHA
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[18]==1)
								begin
								if(DrawX<=424&&DrawX>=394&&DrawY<=427&&DrawY>=407)//GUANGZHOU->ZHANJIANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[19]==1)
								begin
								if(DrawX<=393&&DrawX>=392&&DrawY<=456&&DrawY>=422)//ZHANJIANG->HAIKOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[20]==1)
								begin
								if(DrawX<=391&&DrawX>=374&&DrawY<=418&&DrawY>=412)//ZHANJIAN->NANNING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[21]==1)
								begin
								if(DrawX<=378&&DrawX>=372&&DrawY<=411&&DrawY>=392)//NANNING->LIUZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[22]==1)
								begin
								if(DrawX<=405&&DrawX>=379&&DrawY<=390&&DrawY>=348)//LIUZHOU->CHANGSHA
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=418&&DrawX>=405&&DrawY<=348&&DrawY>=341)//LIUZHOU->CHANGSHA
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[23]==1)
								begin
								if(DrawX<=461&&DrawX>=458&&DrawY<=338&&DrawY>=335)//CHANGSHA->NANCHANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=458&&DrawX>=442&&DrawY<=344&&DrawY>=339)//CHANGSHA->NANCHANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=436&&DrawX>=424&&DrawY<=347&&DrawY>=345)//CHANGSHA->NANCHANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[24]==1)
								begin
								if(DrawX<=520&&DrawX>=479&&DrawY<=341&&DrawY>=313)//NANCHANG->HANGZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=481&&DrawX>=463&&DrawY<=340&&DrawY>=336)//NANCHANG->HANGZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[25]==1)
								begin
								if(DrawX<=477&&DrawX>=463&&DrawY<=332&&DrawY>=301)//NANCHANG->HEFEI
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=477&&DrawX>=477&&DrawY<=300&&DrawY>=299)//NANCHANG->HEFEI
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[26]==1)
								begin
								if(DrawX<=464&&DrawX>=436&&DrawY<=332&&DrawY>=311)//NANCHANG->WUHAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[27]==1)
								begin
								if(DrawX<=432&&DrawX>=421&&DrawY<=338&&DrawY>=313)//WUHAN->CHANGSHA
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[28]==1)
								begin
								if(DrawX<=418&&DrawX>=326&&DrawY<=339&&DrawY>=319)//CHANGSHA->CHONGQING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=393&&DrawX>=368&&DrawY<=347&&DrawY>=340)//CHANGSHA->CHONGQING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[29]==1)
								begin
								if(DrawX<=476&&DrawX>=434&&DrawY<=306&&DrawY>=297)//WUHAN->HEFEI
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=434&&DrawX>=434&&DrawY<=310&&DrawY>=307)//WUHAN->HEFEI
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[30]==1)
								begin
								if(DrawX<=518&&DrawX>=496&&DrawY<=311&&DrawY>=308)//HEFEI->HANGZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=496&&DrawX>=480&&DrawY<=307&&DrawY>=298)//HEFEI->HANGZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path1_export[31]==1)
								begin
								if(DrawX<=496&&DrawX>=480&&DrawY<=296&&DrawY>=287)//HEFEI->NANJING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[0]==1)
								begin
								if(DrawX<=489&&DrawX>=477&&DrawY<=283&&DrawY>=231)//HEFEI->JINAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=478&&DrawX>=477&&DrawY<=295&&DrawY>=284)//HEFEI->JINAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[1]==1)
								begin
								if(DrawX<=476&&DrawX>=434&&DrawY<=293&&DrawY>=259)//HEFEI->SHIJIAZHUANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=446&&DrawX>=436&&DrawY<=259&&DrawY>=215)//HEFEI->SHIJIAZHUANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[2]==1)
								begin
								if(DrawX<=476&&DrawX>=446&&DrawY<=219&&DrawY>=214)//SHIJIAZHUANG->DEZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[3]==1)
								begin
								if(DrawX<=442&&DrawX>=423&&DrawY<=213&&DrawY>=213)//SHIJIAZHUANG->TAIYUAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[4]==1)
								begin
								if(DrawX<=463&&DrawX>=405&&DrawY<=185&&DrawY>=165)//BEIJING->HUHEHAOTE
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[5]==1)
								begin
								if(DrawX<=480&&DrawX>=405&&DrawY<=164&&DrawY>=134)//HUHEHAOTE->HAERBIN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=549&&DrawX>=481&&DrawY<=134&&DrawY>=89)//HUHEHAOTE->HAERBIN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=567&&DrawX>=549&&DrawY<=96&&DrawY>=89)//HUHEHAOTE->HAERBIN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[6]==1)
								begin
								if(DrawX<=423&&DrawX>=377&&DrawY<=309&&DrawY>=260)//WUHAN->XIAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=434&&DrawX>=415&&DrawY<=310&&DrawY>=283)//WUHAN->XIAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[7]==1)
								begin
								if(DrawX<=375&&DrawX>=327&&DrawY<=389&&DrawY>=347)//LIUZHOU->GUIYANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[8]==1)
								begin
								if(DrawX<=370&&DrawX>=318&&DrawY<=412&&DrawY>=387)//NANNING->KUNMING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=318&&DrawX>=287&&DrawY<=387&&DrawY>=365)//NANNING->KUNMING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[9]==1)
								begin
								if(DrawX<=323&&DrawX>=288&&DrawY<=364&&DrawY>=347)//KUNMING->GUIYANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[10]==1)
								begin
								if(DrawX<=325&&DrawX>=324&&DrawY<=346&&DrawY>=320)//GUIYANG->CHONGQING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[11]==1)
								begin
								if(DrawX<=299&&DrawX>=286&&DrawY<=351&&DrawY>=299)//KUNMING->CHENGDU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=286&&DrawX>=280&&DrawY<=365&&DrawY>=352)//KUNMING->CHENGDU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=283&&DrawX>=280&&DrawY<=367&&DrawY>=366)//KUNMING->CHENGDU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end									
								end
							if(path2_export[12]==1)
								begin
								if(DrawX<=324&&DrawX>=302&&DrawY<=316&&DrawY>=297)//CHONGQING->CHENGDU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[13]==1)
								begin
								if(DrawX<=375&&DrawX>=334&&DrawY<=296&&DrawY>=261)//CHONGQING->XIAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=334&&DrawX>=326&&DrawY<=317&&DrawY>=297)//CHONGQING->XIAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end									
								end
							if(path2_export[14]==1)
								begin
								if(DrawX<=373&&DrawX>=334&&DrawY<=260&&DrawY>=260)//XIAN->BAOJI
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[15]==1)
								begin
								if(DrawX<=427&&DrawX>=377&&DrawY<=257&&DrawY>=215)//XIAN->TAIYUAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[16]==1)
								begin
								if(DrawX<=421&&DrawX>=345&&DrawY<=211&&DrawY>=182)//TAIYUAN->YINCHUAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=341&&DrawX>=335&&DrawY<=194&&DrawY>=192)//TAIYUAN->YINCHUAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end									
								end
							if(path2_export[17]==1)
								begin
								if(DrawX<=401&&DrawX>=343&&DrawY<=167&&DrawY>=166)//HUHEHAOTE->YINCHUAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=344&&DrawX>=339&&DrawY<=189&&DrawY>=168)//HUHEHAOTE->YINCHUAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=337&&DrawX>=335&&DrawY<=194&&DrawY>=191)//HUHEHAOTE->YINCHUAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[18]==1)
								begin
								if(DrawX<=332&&DrawX>=291&&DrawY<=231&&DrawY>=197)//YINCHUAN->LANZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[19]==1)
								begin
								if(DrawX<=331&&DrawX>=291&&DrawY<=258&&DrawY>=234)//BAOJI->LANZHOU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[20]==1)
								begin
								if(DrawX<=287&&DrawX>=271&&DrawY<=232&&DrawY>=224)//LANZHOU->XINING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[21]==1)
								begin
								if(DrawX<=286&&DrawX>=258&&DrawY<=216&&DrawY>=173)//LANZHOU->JIAYUGUAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=289&&DrawX>=287&&DrawY<=231&&DrawY>=217)//LANZHOU->JIAYUGUAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end									
								end
							if(path2_export[22]==1)
								begin
								if(DrawX<=267&&DrawX>=181&&DrawY<=301&&DrawY>=217)//XINING->LASA
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[23]==1)
								begin
								if(DrawX<=258&&DrawX>=238&&DrawY<=169&&DrawY>=151)//JIAYUGUAN->DUNHUANG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[24]==1)
								begin
								if(DrawX<=235&&DrawX>=226&&DrawY<=147&&DrawY>=140)//DUNHUANG->HAMI
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[25]==1)
								begin
								if(DrawX<=223&&DrawX>=179&&DrawY<=138&&DrawY>=125)//HAMI->TULUFAN
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[26]==1)
								begin
								if(DrawX<=176&&DrawX>=161&&DrawY<=123&&DrawY>=109)//TULUFAN->WULUMUQI
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[27]==1)
								begin
								if(DrawX<=175&&DrawX>=77&&DrawY<=153&&DrawY>=125)//TULUFAN->KASHI
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[28]==1)
								begin
								if(DrawX<=332&&DrawX>=300&&DrawY<=295&&DrawY>=262)//BAOJI->CHENGDU
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[29]==1)
								begin
								if(DrawX<=508&&DrawX>=498&&DrawY<=305&&DrawY>=288)//HANGZHOU->NANJING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								if(DrawX<=517&&DrawX>=508&&DrawY<=308&&DrawY>=306)//HANGZHOU->NANJING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[30]==1)
								begin
								if(DrawX<=465&&DrawX>=445&&DrawY<=211&&DrawY>=188)//SHIJIAZHUANG->BEIJING
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end
							if(path2_export[31]==1)
								begin
								if(DrawX<=535&&DrawX>=528&&DrawY<=412&&DrawY>=392)//TAIPET->GAOXIONG
									begin
									Red=8'd0;
									Green=8'd0;
									Blue=8'd255;
									end
								end								
							end
					2'd3:
						begin
							Red=8'd255;
							Green=8'd195;
							Blue=8'd195;
							if(storedata!=32'd0)
								begin
								if(DrawX<=398&&DrawX>=300 &&DrawY<=20&&DrawY>=0)
									if(cityname ==1 )
										begin
										Red=8'd222;
										Green=8'd12;
										Blue=8'd12;
										end
//									else
//										begin
//										Red=8'd255;
//										Green=8'd255;
//										Blue=8'd255;
//										end
								end
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
