module  detect_mouse (		  input logic  LEFT,
							  input logic [7:0] keycode,
							  input logic [9:0] Ball_X_OUT,Ball_Y_OUT,Ball_X_OUT1,Ball_Y_OUT1,
                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
							  output logic [9:0] pos_x_out,pos_y_out
                     );
	
logic enter;	
logic [8:0] enter_usb;
assign enter=1'b1;
assign enter_usb=8'h2c;							
always_comb
    begin
		pos_x_out=10'd0;
		pos_y_out=10'd0;
		if(Ball_X_OUT<=10'd570&&Ball_X_OUT>=10'd568&&Ball_Y_OUT<=10'd98&&Ball_Y_OUT>=10'd96)//HAERBIN
		begin
			if(LEFT==enter)
			begin
				pos_x_out=10'd571;
				pos_y_out=10'd97;
			end
		end
			
		if(Ball_X_OUT<=10'd564&&Ball_X_OUT>=10'd562&&Ball_Y_OUT<=10'd126&&Ball_Y_OUT>=10'd124)//CHANGCHUN
		begin
			if (LEFT==enter)
			begin
			pos_x_out=10'd563;
			pos_y_out=10'd125;
			end
		end
			
		if(Ball_X_OUT<=10'd548&&Ball_X_OUT>=10'd546&&Ball_Y_OUT<=10'd161&&Ball_Y_OUT>=10'd159)//SHENYANG
		begin
			if (LEFT==enter)
			begin
			pos_x_out=10'd547;
			pos_y_out=10'd160;
			end
		end
			
		if(Ball_X_OUT<=10'd466&&Ball_X_OUT>=10'd464&&Ball_Y_OUT<=10'd187&&Ball_Y_OUT>=10'd185)//BEIJING
		begin
			if (LEFT==enter)
			begin
			pos_x_out=10'd465;
			pos_y_out=10'd186;
			end
		end
		
		if(Ball_X_OUT<=10'd479&&Ball_X_OUT>=10'd477&&Ball_Y_OUT<=10'd200&&Ball_Y_OUT>=10'd198)//TIANJIN
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd478;
			pos_y_out=10'd199;
			end
		end
		
		if(Ball_X_OUT<=10'd490&&Ball_X_OUT>=10'd488&&Ball_Y_OUT<=10'd230&&Ball_Y_OUT>=10'd228)//JINAN
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd489;
			pos_y_out=10'd229;
			end
		end
		
		if(Ball_X_OUT<=10'd528&&Ball_X_OUT>=10'd526&&Ball_Y_OUT<=10'd236&&Ball_Y_OUT>=10'd234)//QINGDAO
		begin
			if (LEFT==enter)
			begin
			pos_x_out=10'd527;
			pos_y_out=10'd235;
			end
		end
			
		if(Ball_X_OUT<=10'd531&&Ball_X_OUT>=10'd529&&Ball_Y_OUT<=10'd302&&Ball_Y_OUT>=10'd300)//SHANGHAI
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd530;
			pos_y_out=10'd301;
			end
		end
		
		if(Ball_X_OUT<=10'd521&&Ball_X_OUT>=10'd519&&Ball_Y_OUT<=10'd312&&Ball_Y_OUT>=10'd310)//HANGZHOU
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd520;
			pos_y_out=10'd311;
			end
		end
		
		if(Ball_X_OUT<=10'd538&&Ball_X_OUT>=10'd536&&Ball_Y_OUT<=10'd318&&Ball_Y_OUT>=10'd316)//NINGBO
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd537;
			pos_y_out=10'd317;
			end
		end
		
		if(Ball_X_OUT<=10'd512&&Ball_X_OUT>=10'd510&&Ball_Y_OUT<=10'd376&&Ball_Y_OUT>=10'd374)//FUZHOU
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd511;
			pos_y_out=10'd375;
			end
		end
		
		if(Ball_X_OUT<=10'd495&&Ball_X_OUT>=10'd493&&Ball_Y_OUT<=10'd389&&Ball_Y_OUT>=10'd387)//XIAMEN
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd494;
			pos_y_out=10'd388;
			end
		end
		
		if(Ball_X_OUT<=10'd499&&Ball_X_OUT>=10'd497&&Ball_Y_OUT<=10'd287&&Ball_Y_OUT>=10'd285)//NANJING
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd498;
			pos_y_out=10'd286;
			end
		end
		
		if(Ball_X_OUT<=10'd479&&Ball_X_OUT>=10'd477&&Ball_Y_OUT<=10'd298&&Ball_Y_OUT>=10'd296)//HEFEI
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd478;
			pos_y_out=10'd297;
			end
		end
		
		if(Ball_X_OUT<=10'd464&&Ball_X_OUT>=10'd462&&Ball_Y_OUT<=10'd335&&Ball_Y_OUT>=10'd333)//NANCHANG
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd463;
			pos_y_out=10'd334;
			end
		end
		
		if(Ball_X_OUT<=10'd427&&Ball_X_OUT>=10'd425&&Ball_Y_OUT<=10'd408&&Ball_Y_OUT>=10'd406)//GUANGZHOU
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd426;
			pos_y_out=10'd407;
			end
		end
		
		if(Ball_X_OUT<=10'd437&&Ball_X_OUT>=10'd435&&Ball_Y_OUT<=10'd417&&Ball_Y_OUT>=10'd415)//SHENZHEN
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd436;
			pos_y_out=10'd416;
			end
		end
		
		if(Ball_X_OUT<=10'd437&&Ball_X_OUT>=10'd435&&Ball_Y_OUT<=10'd424&&Ball_Y_OUT>=10'd422)//HONGKONG
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd436;
			pos_y_out=10'd423;
			end
		end
		
		if(Ball_X_OUT<=10'd393&&Ball_X_OUT>=10'd391&&Ball_Y_OUT<=10'd459&&Ball_Y_OUT>=10'd457)//HAIKOU
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd392;
			pos_y_out=10'd458;
			end
		end
		
		if(Ball_X_OUT<=10'd373&&Ball_X_OUT>=10'd371&&Ball_Y_OUT<=10'd414&&Ball_Y_OUT>=10'd412)//NANNING
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd372;
			pos_y_out=10'd413;
			end
		end
		
		if(Ball_X_OUT<=10'd376&&Ball_X_OUT>=10'd374&&Ball_Y_OUT<=10'd260&&Ball_Y_OUT>=10'd258)//XIAN
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd375;
			pos_y_out=10'd259;
			end
		end
		
		if(Ball_X_OUT<=10'd404&&Ball_X_OUT>=10'd402&&Ball_Y_OUT<=10'd167&&Ball_Y_OUT>=10'd165)//HUHEHAOTE
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd403;
			pos_y_out=10'd166;
			end
		end
		
		if(Ball_X_OUT<=10'd445&&Ball_X_OUT>=10'd443&&Ball_Y_OUT<=10'd214&&Ball_Y_OUT>=10'd212)//SHIJIAZHUANG
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd444;
			pos_y_out=10'd213;
			end
		end	
		if(Ball_X_OUT<=10'd422&&Ball_X_OUT>=10'd420&&Ball_Y_OUT<=10'd214&&Ball_Y_OUT>=10'd212)//TAIYUAN
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd421;
			pos_y_out=10'd213;
			end
		end
		
		if(Ball_X_OUT<=10'd435&&Ball_X_OUT>=10'd433&&Ball_Y_OUT<=10'd312&&Ball_Y_OUT>=10'd310)//WUHAN
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd434;
			pos_y_out=10'd311;
			end
		end
		
		if(Ball_X_OUT<=10'd421&&Ball_X_OUT>=10'd419&&Ball_Y_OUT<=10'd341&&Ball_Y_OUT>=10'd339)//CHANGSHA
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd420;
			pos_y_out=10'd340;
			end
		end
		
		if(Ball_X_OUT<=10'd334&&Ball_X_OUT>=10'd332&&Ball_Y_OUT<=10'd196&&Ball_Y_OUT>=10'd194)//YINCHUAN
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd333;
			pos_y_out=10'd195;
			end
		end
		
		if(Ball_X_OUT<=10'd301&&Ball_X_OUT>=10'd299&&Ball_Y_OUT<=10'd298&&Ball_Y_OUT>=10'd296)//CHENGDU
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd300;
			pos_y_out=10'd297;
			end
		end
		
		if(Ball_X_OUT<=10'd325&&Ball_X_OUT>=10'd323&&Ball_Y_OUT<=10'd319&&Ball_Y_OUT>=10'd317)//CHONGQING
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd324;
			pos_y_out=10'd318;
			end
		end
		
		if(Ball_X_OUT<=10'd326&&Ball_X_OUT>=10'd324&&Ball_Y_OUT<=10'd348&&Ball_Y_OUT>=10'd346)//GUIYANG
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd325;
			pos_y_out=10'd347;
			end
		end
		
		if(Ball_X_OUT<=10'd286&&Ball_X_OUT>=10'd284&&Ball_Y_OUT<=10'd368&&Ball_Y_OUT>=10'd366)//KUNMING
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd285;
			pos_y_out=10'd367;
			end
		end
		
		if(Ball_X_OUT<=10'd270&&Ball_X_OUT>=10'd268&&Ball_Y_OUT<=10'd224&&Ball_Y_OUT>=10'd222)//XINING
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd269;
			pos_y_out=10'd223;
			end
		end
		
		if(Ball_X_OUT<=10'd183&&Ball_X_OUT>=10'd181&&Ball_Y_OUT<=10'd304&&Ball_Y_OUT>=10'd302)//LASA
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd182;
			pos_y_out=10'd303;
			end
		end
		
		if(Ball_X_OUT<=10'd161&&Ball_X_OUT>=10'd159&&Ball_Y_OUT<=10'd108&&Ball_Y_OUT>=10'd106)//WULUMUQI
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd160;
			pos_y_out=10'd107;
			end
		end
		
		if(Ball_X_OUT<=10'd76&&Ball_X_OUT>=10'd74&&Ball_Y_OUT<=10'd154&&Ball_Y_OUT>=10'd152)//KASHI
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd75;
			pos_y_out=10'd153;
			end
		end
		
		if(Ball_X_OUT<=10'd178&&Ball_X_OUT>=10'd176&&Ball_Y_OUT<=10'd126&&Ball_Y_OUT>=10'd124)//TULUFAN
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd177;
			pos_y_out=10'd125;
			end
		end
		
		if(Ball_X_OUT<=10'd226&&Ball_X_OUT>=10'd224&&Ball_Y_OUT<=10'd139&&Ball_Y_OUT>=10'd137)//HAMI
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd225;
			pos_y_out=10'd138;
			end
		end
		
		if(Ball_X_OUT<=10'd237&&Ball_X_OUT>=10'd235&&Ball_Y_OUT<=10'd150&&Ball_Y_OUT>=10'd148)//DUNHUANG
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd236;
			pos_y_out=10'd149;
			end
		end
		
		if(Ball_X_OUT<=10'd259&&Ball_X_OUT>=10'd257&&Ball_Y_OUT<=10'd172&&Ball_Y_OUT>=10'd170)//JIAYUGUAN
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd258;
			pos_y_out=10'd171;
			end
		end
		
		if(Ball_X_OUT<=10'd290&&Ball_X_OUT>=10'd288&&Ball_Y_OUT<=10'd234&&Ball_Y_OUT>=10'd232)//LANZHOU
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd289;
			pos_y_out=10'd233;
			end
		end
		
		if(Ball_X_OUT<=10'd538&&Ball_X_OUT>=10'd536&&Ball_Y_OUT<=10'd390&&Ball_Y_OUT>=10'd388)//TAIPEI
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd537;
			pos_y_out=10'd389;
			end
		end
		
		if(Ball_X_OUT<=10'd529&&Ball_X_OUT>=10'd527&&Ball_Y_OUT<=10'd415&&Ball_Y_OUT>=10'd413)//GAOXIONG
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd528;
			pos_y_out=10'd414;
			end
		end
		
		if(Ball_X_OUT<=10'd333&&Ball_X_OUT>=10'd331&&Ball_Y_OUT<=10'd261&&Ball_Y_OUT>=10'd259)//BAOJI
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd332;
			pos_y_out=10'd260;
			end
		end
		
		if(Ball_X_OUT<=10'd378&&Ball_X_OUT>=10'd376&&Ball_Y_OUT<=10'd391&&Ball_Y_OUT>=10'd389)//LIUZHOU
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd377;
			pos_y_out=10'd390;
			end
		end
		
		if(Ball_X_OUT<=10'd393&&Ball_X_OUT>=10'd391&&Ball_Y_OUT<=10'd421&&Ball_Y_OUT>=10'd419)//ZHANJIANG
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd392;
			pos_y_out=10'd420;
			end
		end
			
		if(Ball_X_OUT<=10'd479&&Ball_X_OUT>=10'd477&&Ball_Y_OUT<=10'd220&&Ball_Y_OUT>=10'd218)//DEZHOU
		begin	
			if (LEFT==enter)
			begin
			pos_x_out=10'd478;
			pos_y_out=10'd219;
			end
		end
		
//usb part
if(Ball_X_OUT1<=10'd570&&Ball_X_OUT1>=10'd568&&Ball_Y_OUT1<=10'd98&&Ball_Y_OUT1>=10'd96)//HAERBIN
		begin
			if(keycode==enter_usb)
			begin
				pos_x_out=10'd571;
				pos_y_out=10'd97;
			end
		end
			
		if(Ball_X_OUT1<=10'd564&&Ball_X_OUT1>=10'd562&&Ball_Y_OUT1<=10'd126&&Ball_Y_OUT1>=10'd124)//CHANGCHUN
		begin
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd563;
			pos_y_out=10'd125;
			end
		end
			
		if(Ball_X_OUT1<=10'd548&&Ball_X_OUT1>=10'd546&&Ball_Y_OUT1<=10'd161&&Ball_Y_OUT1>=10'd159)//SHENYANG
		begin
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd547;
			pos_y_out=10'd160;
			end
		end
			
		if(Ball_X_OUT1<=10'd466&&Ball_X_OUT1>=10'd464&&Ball_Y_OUT1<=10'd187&&Ball_Y_OUT1>=10'd185)//BEIJING
		begin
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd465;
			pos_y_out=10'd186;
			end
		end
		
		if(Ball_X_OUT1<=10'd479&&Ball_X_OUT1>=10'd477&&Ball_Y_OUT1<=10'd200&&Ball_Y_OUT1>=10'd198)//TIANJIN
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd478;
			pos_y_out=10'd199;
			end
		end
		
		if(Ball_X_OUT1<=10'd490&&Ball_X_OUT1>=10'd488&&Ball_Y_OUT1<=10'd230&&Ball_Y_OUT1>=10'd228)//JINAN
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd489;
			pos_y_out=10'd229;
			end
		end
		
		if(Ball_X_OUT1<=10'd528&&Ball_X_OUT1>=10'd526&&Ball_Y_OUT1<=10'd236&&Ball_Y_OUT1>=10'd234)//QINGDAO
		begin
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd527;
			pos_y_out=10'd235;
			end
		end
			
		if(Ball_X_OUT1<=10'd531&&Ball_X_OUT1>=10'd529&&Ball_Y_OUT1<=10'd302&&Ball_Y_OUT1>=10'd300)//SHANGHAI
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd530;
			pos_y_out=10'd301;
			end
		end
		
		if(Ball_X_OUT1<=10'd521&&Ball_X_OUT1>=10'd519&&Ball_Y_OUT1<=10'd312&&Ball_Y_OUT1>=10'd310)//HANGZHOU
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd520;
			pos_y_out=10'd311;
			end
		end
		
		if(Ball_X_OUT1<=10'd538&&Ball_X_OUT1>=10'd536&&Ball_Y_OUT1<=10'd318&&Ball_Y_OUT1>=10'd316)//NINGBO
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd537;
			pos_y_out=10'd317;
			end
		end
		
		if(Ball_X_OUT1<=10'd512&&Ball_X_OUT1>=10'd510&&Ball_Y_OUT1<=10'd376&&Ball_Y_OUT1>=10'd374)//FUZHOU
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd511;
			pos_y_out=10'd375;
			end
		end
		
		if(Ball_X_OUT1<=10'd495&&Ball_X_OUT1>=10'd493&&Ball_Y_OUT1<=10'd389&&Ball_Y_OUT1>=10'd387)//XIAMEN
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd494;
			pos_y_out=10'd388;
			end
		end
		
		if(Ball_X_OUT1<=10'd499&&Ball_X_OUT1>=10'd497&&Ball_Y_OUT1<=10'd287&&Ball_Y_OUT1>=10'd285)//NANJING
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd498;
			pos_y_out=10'd286;
			end
		end
		
		if(Ball_X_OUT1<=10'd479&&Ball_X_OUT1>=10'd477&&Ball_Y_OUT1<=10'd298&&Ball_Y_OUT1>=10'd296)//HEFEI
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd478;
			pos_y_out=10'd297;
			end
		end
		
		if(Ball_X_OUT1<=10'd464&&Ball_X_OUT1>=10'd462&&Ball_Y_OUT1<=10'd335&&Ball_Y_OUT1>=10'd333)//NANCHANG
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd463;
			pos_y_out=10'd334;
			end
		end
		
		if(Ball_X_OUT1<=10'd427&&Ball_X_OUT1>=10'd425&&Ball_Y_OUT1<=10'd408&&Ball_Y_OUT1>=10'd406)//GUANGZHOU
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd426;
			pos_y_out=10'd407;
			end
		end
		
		if(Ball_X_OUT1<=10'd437&&Ball_X_OUT1>=10'd435&&Ball_Y_OUT1<=10'd417&&Ball_Y_OUT1>=10'd415)//SHENZHEN
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd436;
			pos_y_out=10'd416;
			end
		end
		
		if(Ball_X_OUT1<=10'd437&&Ball_X_OUT1>=10'd435&&Ball_Y_OUT1<=10'd424&&Ball_Y_OUT1>=10'd422)//HONGKONG
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd436;
			pos_y_out=10'd423;
			end
		end
		
		if(Ball_X_OUT1<=10'd393&&Ball_X_OUT1>=10'd391&&Ball_Y_OUT1<=10'd459&&Ball_Y_OUT1>=10'd457)//HAIKOU
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd392;
			pos_y_out=10'd458;
			end
		end
		
		if(Ball_X_OUT1<=10'd373&&Ball_X_OUT1>=10'd371&&Ball_Y_OUT1<=10'd414&&Ball_Y_OUT1>=10'd412)//NANNING
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd372;
			pos_y_out=10'd413;
			end
		end
		
		if(Ball_X_OUT1<=10'd376&&Ball_X_OUT1>=10'd374&&Ball_Y_OUT1<=10'd260&&Ball_Y_OUT1>=10'd258)//XIAN
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd375;
			pos_y_out=10'd259;
			end
		end
		
		if(Ball_X_OUT1<=10'd404&&Ball_X_OUT1>=10'd402&&Ball_Y_OUT1<=10'd167&&Ball_Y_OUT1>=10'd165)//HUHEHAOTE
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd403;
			pos_y_out=10'd166;
			end
		end
		
		if(Ball_X_OUT1<=10'd445&&Ball_X_OUT1>=10'd443&&Ball_Y_OUT1<=10'd214&&Ball_Y_OUT1>=10'd212)//SHIJIAZHUANG
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd444;
			pos_y_out=10'd213;
			end
		end	
		if(Ball_X_OUT1<=10'd422&&Ball_X_OUT1>=10'd420&&Ball_Y_OUT1<=10'd214&&Ball_Y_OUT1>=10'd212)//TAIYUAN
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd421;
			pos_y_out=10'd213;
			end
		end
		
		if(Ball_X_OUT1<=10'd435&&Ball_X_OUT1>=10'd433&&Ball_Y_OUT1<=10'd312&&Ball_Y_OUT1>=10'd310)//WUHAN
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd434;
			pos_y_out=10'd311;
			end
		end
		
		if(Ball_X_OUT1<=10'd421&&Ball_X_OUT1>=10'd419&&Ball_Y_OUT1<=10'd341&&Ball_Y_OUT1>=10'd339)//CHANGSHA
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd420;
			pos_y_out=10'd340;
			end
		end
		
		if(Ball_X_OUT1<=10'd334&&Ball_X_OUT1>=10'd332&&Ball_Y_OUT1<=10'd196&&Ball_Y_OUT1>=10'd194)//YINCHUAN
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd333;
			pos_y_out=10'd195;
			end
		end
		
		if(Ball_X_OUT1<=10'd301&&Ball_X_OUT1>=10'd299&&Ball_Y_OUT1<=10'd298&&Ball_Y_OUT1>=10'd296)//CHENGDU
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd300;
			pos_y_out=10'd297;
			end
		end
		
		if(Ball_X_OUT1<=10'd325&&Ball_X_OUT1>=10'd323&&Ball_Y_OUT1<=10'd319&&Ball_Y_OUT1>=10'd317)//CHONGQING
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd324;
			pos_y_out=10'd318;
			end
		end
		
		if(Ball_X_OUT1<=10'd326&&Ball_X_OUT1>=10'd324&&Ball_Y_OUT1<=10'd348&&Ball_Y_OUT1>=10'd346)//GUIYANG
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd325;
			pos_y_out=10'd347;
			end
		end
		
		if(Ball_X_OUT1<=10'd286&&Ball_X_OUT1>=10'd284&&Ball_Y_OUT1<=10'd368&&Ball_Y_OUT1>=10'd366)//KUNMING
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd285;
			pos_y_out=10'd367;
			end
		end
		
		if(Ball_X_OUT1<=10'd270&&Ball_X_OUT1>=10'd268&&Ball_Y_OUT1<=10'd224&&Ball_Y_OUT1>=10'd222)//XINING
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd269;
			pos_y_out=10'd223;
			end
		end
		
		if(Ball_X_OUT1<=10'd183&&Ball_X_OUT1>=10'd181&&Ball_Y_OUT1<=10'd304&&Ball_Y_OUT1>=10'd302)//LASA
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd182;
			pos_y_out=10'd303;
			end
		end
		
		if(Ball_X_OUT1<=10'd161&&Ball_X_OUT1>=10'd159&&Ball_Y_OUT1<=10'd108&&Ball_Y_OUT1>=10'd106)//WULUMUQI
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd160;
			pos_y_out=10'd107;
			end
		end
		
		if(Ball_X_OUT1<=10'd76&&Ball_X_OUT1>=10'd74&&Ball_Y_OUT1<=10'd154&&Ball_Y_OUT1>=10'd152)//KASHI
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd75;
			pos_y_out=10'd153;
			end
		end
		
		if(Ball_X_OUT1<=10'd178&&Ball_X_OUT1>=10'd176&&Ball_Y_OUT1<=10'd126&&Ball_Y_OUT1>=10'd124)//TULUFAN
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd177;
			pos_y_out=10'd125;
			end
		end
		
		if(Ball_X_OUT1<=10'd226&&Ball_X_OUT1>=10'd224&&Ball_Y_OUT1<=10'd139&&Ball_Y_OUT1>=10'd137)//HAMI
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd225;
			pos_y_out=10'd138;
			end
		end
		
		if(Ball_X_OUT1<=10'd237&&Ball_X_OUT1>=10'd235&&Ball_Y_OUT1<=10'd150&&Ball_Y_OUT1>=10'd148)//DUNHUANG
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd236;
			pos_y_out=10'd149;
			end
		end
		
		if(Ball_X_OUT1<=10'd259&&Ball_X_OUT1>=10'd257&&Ball_Y_OUT1<=10'd172&&Ball_Y_OUT1>=10'd170)//JIAYUGUAN
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd258;
			pos_y_out=10'd171;
			end
		end
		
		if(Ball_X_OUT1<=10'd290&&Ball_X_OUT1>=10'd288&&Ball_Y_OUT1<=10'd234&&Ball_Y_OUT1>=10'd232)//LANZHOU
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd289;
			pos_y_out=10'd233;
			end
		end
		
		if(Ball_X_OUT1<=10'd538&&Ball_X_OUT1>=10'd536&&Ball_Y_OUT1<=10'd390&&Ball_Y_OUT1>=10'd388)//TAIPEI
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd537;
			pos_y_out=10'd389;
			end
		end
		
		if(Ball_X_OUT1<=10'd529&&Ball_X_OUT1>=10'd527&&Ball_Y_OUT1<=10'd415&&Ball_Y_OUT1>=10'd413)//GAOXIONG
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd528;
			pos_y_out=10'd414;
			end
		end
		
		if(Ball_X_OUT1<=10'd333&&Ball_X_OUT1>=10'd331&&Ball_Y_OUT1<=10'd261&&Ball_Y_OUT1>=10'd259)//BAOJI
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd332;
			pos_y_out=10'd260;
			end
		end
		
		if(Ball_X_OUT1<=10'd378&&Ball_X_OUT1>=10'd376&&Ball_Y_OUT1<=10'd391&&Ball_Y_OUT1>=10'd389)//LIUZHOU
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd377;
			pos_y_out=10'd390;
			end
		end
		
		if(Ball_X_OUT1<=10'd393&&Ball_X_OUT1>=10'd391&&Ball_Y_OUT1<=10'd421&&Ball_Y_OUT1>=10'd419)//ZHANJIANG
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd392;
			pos_y_out=10'd420;
			end
		end
			
		if(Ball_X_OUT1<=10'd479&&Ball_X_OUT1>=10'd477&&Ball_Y_OUT1<=10'd220&&Ball_Y_OUT1>=10'd218)//DEZHOU
		begin	
			if (keycode==enter_usb)
			begin
			pos_x_out=10'd478;
			pos_y_out=10'd219;
			end
		end
		
	end
endmodule