module  detect (		  input logic [7:0] keycode,
							  input logic [9:0] Ball_X_OUT,Ball_Y_OUT, 
                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
							  output logic [9:0] pos_x_out,pos_y_out
                     );
							
assign enter=8'd40;							
always_comb
    begin
		pos_x_out=10'd0;
		pos_y_out=10'd0;
		if(Ball_X_OUT<=10'd570&&Ball_X_OUT>=10'd568&&Ball_Y_OUT<=10'd98&&Ball_Y_OUT>=10'd96)//HAERBIN
			if(keycode==enter)
			begin
			pos_x_out=10'd571;
			pos_y_out=10'd97;
			end
			
		if(Ball_X_OUT<=10'd564&&Ball_X_OUT>=10'd562&&Ball_Y_OUT<=10'd126&&Ball_Y_OUT>=10'd124)//CHANGCHUN
			if (keycode==enter)
			begin
			pos_x_out=10'd571;
			pos_y_out=10'd125;
			end
			
		if(Ball_X_OUT<=10'd548&&Ball_X_OUT>=10'd546&&Ball_Y_OUT<=10'd161&&Ball_Y_OUT>=10'd159)//SHENYANG
			if (keycode==enter)
			begin
			pos_x_out=10'd547;
			pos_y_out=10'd160;
			end
			
		if(Ball_X_OUT<=10'd466&&Ball_X_OUT>=10'd464&&Ball_Y_OUT<=10'd187&&Ball_Y_OUT>=10'd185)//BEIJING
			if (keycode==enter)
			begin
			pos_x_out=10'd465;
			pos_y_out=10'd186;
			end
			
		if(Ball_X_OUT<=10'd479&&Ball_X_OUT>=10'd477&&Ball_Y_OUT<=10'd200&&Ball_Y_OUT>=10'd198)//TIANJIN
			if (keycode==enter)
			begin
			pos_x_out=10'd478;
			pos_y_out=10'd199;
			end
			
		if(Ball_X_OUT<=10'd490&&Ball_X_OUT>=10'd488&&Ball_Y_OUT<=10'd230&&Ball_Y_OUT>=10'd228)//JINAN
			if (keycode==enter)
			begin
			pos_x_out=10'd489;
			pos_y_out=10'd229;
			end
			
		if(Ball_X_OUT<=10'd528&&Ball_X_OUT>=10'd526&&Ball_Y_OUT<=10'd236&&Ball_Y_OUT>=10'd234)//QINGDAO
			if (keycode==enter)
			begin
			pos_x_out=10'd527;
			pos_y_out=10'd235;
			end
			
		if(Ball_X_OUT<=10'd531&&Ball_X_OUT>=10'd529&&Ball_Y_OUT<=10'd302&&Ball_Y_OUT>=10'd300)//SHANGHAI
			if (keycode==enter)
			begin
			pos_x_out=10'd530;
			pos_y_out=10'd301;
			end
			
		if(Ball_X_OUT<=10'd521&&Ball_X_OUT>=10'd519&&Ball_Y_OUT<=10'd312&&Ball_Y_OUT>=10'd310)//HANGZHOU
			if (keycode==enter)
			begin
			pos_x_out=10'd520;
			pos_y_out=10'd311;
			end
			
		if(Ball_X_OUT<=10'd538&&Ball_X_OUT>=10'd536&&Ball_Y_OUT<=10'd318&&Ball_Y_OUT>=10'd316)//NINGBO
			if (keycode==enter)
			begin
			pos_x_out=10'd537;
			pos_y_out=10'd317;
			end
			
		if(Ball_X_OUT<=10'd512&&Ball_X_OUT>=10'd510&&Ball_Y_OUT<=10'd376&&Ball_Y_OUT>=10'd374)//FUZHOU
			if (keycode==enter)
			begin
			pos_x_out=10'd511;
			pos_y_out=10'd375;
			end
			
		if(Ball_X_OUT<=10'd495&&Ball_X_OUT>=10'd493&&Ball_Y_OUT<=10'd389&&Ball_Y_OUT>=10'd387)//XIAMEN
			if (keycode==enter)
			begin
			pos_x_out=10'd494;
			pos_y_out=10'd388;
			end
			
		if(Ball_X_OUT<=10'd499&&Ball_X_OUT>=10'd497&&Ball_Y_OUT<=10'd287&&Ball_Y_OUT>=10'd285)//NANJING
			if (keycode==enter)
			begin
			pos_x_out=10'd498;
			pos_y_out=10'd286;
			end
			
		if(Ball_X_OUT<=10'd479&&Ball_X_OUT>=10'd477&&Ball_Y_OUT<=10'd298&&Ball_Y_OUT>=10'd296)//HEFEI
			if (keycode==enter)
			begin
			pos_x_out=10'd478;
			pos_y_out=10'd297;
			end
			
		if(Ball_X_OUT<=10'd464&&Ball_X_OUT>=10'd462&&Ball_Y_OUT<=10'd326&&Ball_Y_OUT>=10'd324)//NANCHANG
			if (keycode==enter)
			begin
			pos_x_out=10'd463;
			pos_y_out=10'd325;
			end
			
		if(Ball_X_OUT<=10'd427&&Ball_X_OUT>=10'd425&&Ball_Y_OUT<=10'd408&&Ball_Y_OUT>=10'd406)//GUANGZHOU
			if (keycode==enter)
			begin
			pos_x_out=10'd426;
			pos_y_out=10'd407;
			end
			
		if(Ball_X_OUT<=10'd437&&Ball_X_OUT>=10'd435&&Ball_Y_OUT<=10'd417&&Ball_Y_OUT>=10'd415)//SHENZHEN
			if (keycode==enter)
			begin
			pos_x_out=10'd436;
			pos_y_out=10'd416;
			end
			
		if(Ball_X_OUT<=10'd437&&Ball_X_OUT>=10'd435&&Ball_Y_OUT<=10'd424&&Ball_Y_OUT>=10'd422)//HONGKONG
			if (keycode==enter)
			begin
			pos_x_out=10'd436;
			pos_y_out=10'd423;
			end
			
		if(Ball_X_OUT<=10'd393&&Ball_X_OUT>=10'd391&&Ball_Y_OUT<=10'd459&&Ball_Y_OUT>=10'd457)//HAIKOU
			if (keycode==enter)
			begin
			pos_x_out=10'd392;
			pos_y_out=10'd458;
			end
			
		if(Ball_X_OUT<=10'd373&&Ball_X_OUT>=10'd371&&Ball_Y_OUT<=10'd414&&Ball_Y_OUT>=10'd412)//NANNING
			if (keycode==enter)
			begin
			pos_x_out=10'd372;
			pos_y_out=10'd413;
			end
			
		if(Ball_X_OUT<=10'd376&&Ball_X_OUT>=10'd374&&Ball_Y_OUT<=10'd260&&Ball_Y_OUT>=10'd258)//XIAN
			if (keycode==enter)
			begin
			pos_x_out=10'd375;
			pos_y_out=10'd259;
			end
			
		if(Ball_X_OUT<=10'd404&&Ball_X_OUT>=10'd402&&Ball_Y_OUT<=10'd167&&Ball_Y_OUT>=10'd165)//HUHEHAOTE
			if (keycode==enter)
			begin
			pos_x_out=10'd403;
			pos_y_out=10'd166;
			end
			
		if(Ball_X_OUT<=10'd445&&Ball_X_OUT>=10'd443&&Ball_Y_OUT<=10'd214&&Ball_Y_OUT>=10'd212)//SHIJIAZHUANG
			if (keycode==enter)
			begin
			pos_x_out=10'd444;
			pos_y_out=10'd213;
			end
			
		if(Ball_X_OUT<=10'd422&&Ball_X_OUT>=10'd420&&Ball_Y_OUT<=10'd214&&Ball_Y_OUT>=10'd212)//TAIYUAN
			if (keycode==enter)
			begin
			pos_x_out=10'd421;
			pos_y_out=10'd213;
			end
			
		if(Ball_X_OUT<=10'd435&&Ball_X_OUT>=10'd433&&Ball_Y_OUT<=10'd312&&Ball_Y_OUT>=10'd310)//WUHAN
			if (keycode==enter)
			begin
			pos_x_out=10'd434;
			pos_y_out=10'd311;
			end
			
		if(Ball_X_OUT<=10'd421&&Ball_X_OUT>=10'd419&&Ball_Y_OUT<=10'd341&&Ball_Y_OUT>=10'd339)//CHANGSHA
			if (keycode==enter)
			begin
			pos_x_out=10'd420;
			pos_y_out=10'd340;
			end
			
		if(Ball_X_OUT<=10'd334&&Ball_X_OUT>=10'd332&&Ball_Y_OUT<=10'd196&&Ball_Y_OUT>=10'd194)//YINCHUAN
			if (keycode==enter)
			begin
			pos_x_out=10'd333;
			pos_y_out=10'd195;
			end
			
		if(Ball_X_OUT<=10'd301&&Ball_X_OUT>=10'd299&&Ball_Y_OUT<=10'd298&&Ball_Y_OUT>=10'd296)//CHENGDU
			if (keycode==enter)
			begin
			pos_x_out=10'd300;
			pos_y_out=10'd297;
			end
			
		if(Ball_X_OUT<=10'd325&&Ball_X_OUT>=10'd323&&Ball_Y_OUT<=10'd319&&Ball_Y_OUT>=10'd317)//CHONGQING
			if (keycode==enter)
			begin
			pos_x_out=10'd324;
			pos_y_out=10'd318;
			end
			
		if(Ball_X_OUT<=10'd326&&Ball_X_OUT>=10'd324&&Ball_Y_OUT<=10'd348&&Ball_Y_OUT>=10'd346)//GUIYANG
			if (keycode==enter)
			begin
			pos_x_out=10'd325;
			pos_y_out=10'd347;
			end
			
		if(Ball_X_OUT<=10'd286&&Ball_X_OUT>=10'd284&&Ball_Y_OUT<=10'd368&&Ball_Y_OUT>=10'd366)//KUNMING
			if (keycode==enter)
			begin
			pos_x_out=10'd285;
			pos_y_out=10'd367;
			end
			
		if(Ball_X_OUT<=10'd270&&Ball_X_OUT>=10'd268&&Ball_Y_OUT<=10'd224&&Ball_Y_OUT>=10'd222)//XINING
			if (keycode==enter)
			begin
			pos_x_out=10'd269;
			pos_y_out=10'd223;
			end
			
		if(Ball_X_OUT<=10'd183&&Ball_X_OUT>=10'd181&&Ball_Y_OUT<=10'd304&&Ball_Y_OUT>=10'd302)//LASA
			if (keycode==enter)
			begin
			pos_x_out=10'd182;
			pos_y_out=10'd303;
			end
			
		if(Ball_X_OUT<=10'd161&&Ball_X_OUT>=10'd159&&Ball_Y_OUT<=10'd108&&Ball_Y_OUT>=10'd106)//WULUMUQI
			if (keycode==enter)
			begin
			pos_x_out=10'd160;
			pos_y_out=10'd107;
			end
			
		if(Ball_X_OUT<=10'd76&&Ball_X_OUT>=10'd74&&Ball_Y_OUT<=10'd154&&Ball_Y_OUT>=10'd152)//KASHI
			if (keycode==enter)
			begin
			pos_x_out=10'd75;
			pos_y_out=10'd153;
			end
			
		if(Ball_X_OUT<=10'd178&&Ball_X_OUT>=10'd176&&Ball_Y_OUT<=10'd126&&Ball_Y_OUT>=10'd124)//TULUFAN
			if (keycode==enter)
			begin
			pos_x_out=10'd177;
			pos_y_out=10'd125;
			end
			
		if(Ball_X_OUT<=10'd226&&Ball_X_OUT>=10'd224&&Ball_Y_OUT<=10'd139&&Ball_Y_OUT>=10'd137)//HAMI
			if (keycode==enter)
			begin
			pos_x_out=10'd225;
			pos_y_out=10'd138;
			end
			
		if(Ball_X_OUT<=10'd237&&Ball_X_OUT>=10'd235&&Ball_Y_OUT<=10'd150&&Ball_Y_OUT>=10'd148)//DUNHUANG
			if (keycode==enter)
			begin
			pos_x_out=10'd236;
			pos_y_out=10'd149;
			end
			
		if(Ball_X_OUT<=10'd259&&Ball_X_OUT>=10'd257&&Ball_Y_OUT<=10'd172&&Ball_Y_OUT>=10'd170)//JIAYUGUAN
			if (keycode==enter)
			begin
			pos_x_out=10'd258;
			pos_y_out=10'd171;
			end
			
		if(Ball_X_OUT<=10'd290&&Ball_X_OUT>=10'd288&&Ball_Y_OUT<=10'd234&&Ball_Y_OUT>=10'd232)//LANZHOU
			if (keycode==enter)
			begin
			pos_x_out=10'd289;
			pos_y_out=10'd233;
			end
			
		if(Ball_X_OUT<=10'd538&&Ball_X_OUT>=10'd536&&Ball_Y_OUT<=10'd390&&Ball_Y_OUT>=10'd388)//TAIPEI
			if (keycode==enter)
			begin
			pos_x_out=10'd537;
			pos_y_out=10'd389;
			end
			
		if(Ball_X_OUT<=10'd529&&Ball_X_OUT>=10'd527&&Ball_Y_OUT<=10'd415&&Ball_Y_OUT>=10'd413)//GAOXIONG
			if (keycode==enter)
			begin
			pos_x_out=10'd528;
			pos_y_out=10'd414;
			end
			
		if(Ball_X_OUT<=10'd333&&Ball_X_OUT>=10'd331&&Ball_Y_OUT<=10'd261&&Ball_Y_OUT>=10'd259)//BAOJI
			if (keycode==enter)
			begin
			pos_x_out=10'd332;
			pos_y_out=10'd260;
			end
			
		if(Ball_X_OUT<=10'd378&&Ball_X_OUT>=10'd376&&Ball_Y_OUT<=10'd391&&Ball_Y_OUT>=10'd389)//LIUZHOU
			if (keycode==enter)
			begin
			pos_x_out=10'd377;
			pos_y_out=10'd390;
			end
			
		if(Ball_X_OUT<=10'd393&&Ball_X_OUT>=10'd391&&Ball_Y_OUT<=10'd421&&Ball_Y_OUT>=10'd419)//ZHANJIANG
			if (keycode==enter)
			begin
			pos_x_out=10'd392;
			pos_y_out=10'd420;
			end
			
		if(Ball_X_OUT<=10'd479&&Ball_X_OUT>=10'd477&&Ball_Y_OUT<=10'd220&&Ball_Y_OUT>=10'd218)//DEZHOU
			if (keycode==enter)
			begin
			pos_x_out=10'd478;
			pos_y_out=10'd219;
			end						
	end
endmodule