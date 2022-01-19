	//********************************	 DEFINE	**************************************************
	
	`define INPUT_SIZE  			16
	
	//********************************************************************************
	
	module MUL_APP(
				 N1_w,
				 N2_w,
				 Dout_w
				 //Dout_real_w
				 );

	//********************************************************************************	
	input 		 	[`INPUT_SIZE-1:0] N1_w;
	input 		 	[`INPUT_SIZE-1:0] N2_w;
	
	output  		[`INPUT_SIZE*2-1:0] Dout_w;
	//output  reg		[`INPUT_SIZE*2-1:0] Dout_real_w;

	//********************************************************************************
						   
	wire  			[`INPUT_SIZE-1:0]  N1_LOD_w;
	wire  			[`INPUT_SIZE-1:0]  N2_LOD_w;
						   
						   
	wire  			[3:0]  N1_PRI_w;
	wire  			[3:0]  N2_PRI_w;
	reg  			[4:0]  BAR_w;

	reg  			[5:0]  M1_w;
	reg  			[5:0]  M2_w;

	reg  			[11:0]  M1_mul_M2_w;

	integer 	i;

	//****************************************************
	LOD LOD1
	(
	.din_w(N1_w),
	.dout_w(N1_LOD_w)
	);
	//****************************************************
	LOD LOD2
	(
	.din_w(N2_w),
	.dout_w(N2_LOD_w)
	);
	//***********************************
	PRIORITY_ENCODER PRIORITY_ENCODER1
	(
	.din_w(N1_LOD_w),
	.dout_w(N1_PRI_w)
	);
	//***********************************
	PRIORITY_ENCODER PRIORITY_ENCODER2
	(
	.din_w(N2_LOD_w),
	.dout_w(N2_PRI_w)
	);
	//***********************************
	//往後面抓 5bit 再加上1bit => k=6
	always @(*)
		 begin
			//***********************************
			case (N1_PRI_w)
				4'd10: M1_w={N1_w[15:11],1'b1};
				4'd9 : M1_w={N1_w[14:10],1'b1};
				4'd8 : M1_w={N1_w[13:9],1'b1};
				4'd7 : M1_w={N1_w[12:8],1'b1};
				4'd6 : M1_w={N1_w[11:7],1'b1};
				4'd5 : M1_w={N1_w[10:6],1'b1};
				4'd4 : M1_w={N1_w[9:5],1'b1};
				4'd3 : M1_w={N1_w[8:4],1'b1};
				4'd2 : M1_w={N1_w[7:3],1'b1};
				4'd1 : M1_w={N1_w[6:2],1'b1};//只有6~15輸出
				default: M1_w=N1_w[5:0];
			endcase
			//***********************************
			case (N2_PRI_w)
				4'd10: M2_w={N2_w[15:11],1'b1};
				4'd9 : M2_w={N2_w[14:10],1'b1};
				4'd8 : M2_w={N2_w[13:9],1'b1};
				4'd7 : M2_w={N2_w[12:8],1'b1};
				4'd6 : M2_w={N2_w[11:7],1'b1};
				4'd5 : M2_w={N2_w[10:6],1'b1};
				4'd4 : M2_w={N2_w[9:5],1'b1};
				4'd3 : M2_w={N2_w[8:4],1'b1};
				4'd2 : M2_w={N2_w[7:3],1'b1};
				4'd1 : M2_w={N2_w[6:2],1'b1};//小於6就直接取6bit
				default: M2_w=N2_w[5:0];
			endcase
			//***********************************
			BAR_w = N2_PRI_w + N1_PRI_w;
			M1_mul_M2_w=M1_w*M2_w;
			//Dout_real_w=32'd0;//M1_w*M2_w;
		 end
	
	//***********************************
	BARREL_SHIFTER BARREL_SHIFTER
	(
	.sel_w(BAR_w),
	.din_w(M1_mul_M2_w),
	.dout_w(Dout_w)
	);
	//***********************************
	
	
endmodule

	module LOD
	(
	din_w,
	dout_w
	);
	
	//******************************** input & output *******************************************************

	input 		[`INPUT_SIZE-1:0]						din_w;	
	output reg	[`INPUT_SIZE-1:0]  						dout_w;
	
	//********************************************************************************
	
	reg 		[`INPUT_SIZE-1:1]						not_w;
	reg 		[`INPUT_SIZE-3:0]						and_1_w;
	reg 		[`INPUT_SIZE-2:0]						and_2_w;
	integer 	i;

	//********************************************************************************
	always @(*)
		begin
			//***************************************************************************
			not_w=~din_w[`INPUT_SIZE-1:1];
			and_1_w[`INPUT_SIZE-3]=not_w[`INPUT_SIZE-1]&not_w[`INPUT_SIZE-2];
			//***************************************************************************
			for (i=`INPUT_SIZE-2;i>=2;i=i-1)
				begin
					and_1_w[i-2]=and_1_w[i-1]&not_w[i-1];
				end			
			//***************************************************************************
			dout_w[`INPUT_SIZE-1]=din_w[`INPUT_SIZE-1];
			dout_w[`INPUT_SIZE-2]=not_w[`INPUT_SIZE-1]&din_w[`INPUT_SIZE-2];
			//***************************************************************************
			for (i=`INPUT_SIZE-3;i>=0;i=i-1)
				begin
					dout_w[i]=and_1_w[i]&din_w[i];
				end	
			//***************************************************************************
		end
	
endmodule







	
	//*******************************************************************************************
	
	module BARREL_SHIFTER
	(
	sel_w,
	din_w,
	dout_w
	);
	
	//******************************** input & output *******************************************************

	input 		[4:0]						sel_w;//15+15
	input 		[11:0]						din_w;

	output reg	[31:0] 						dout_w;
	
	//********************************************************************************
	
	always @(*)
		begin
			case (sel_w)
				5'd20: dout_w={din_w,20'b0};//12bit 
				5'd19: dout_w={1'b0,din_w,19'b0};
				5'd18: dout_w={2'b0,din_w,18'b0};
				5'd17: dout_w={3'b0,din_w,17'b0};
				5'd16: dout_w={4'b0,din_w,16'b0};
				5'd15: dout_w={5'b0,din_w,15'b0};
				5'd14: dout_w={6'b0,din_w,14'b0};
				5'd13: dout_w={7'b0,din_w,13'b0};
				5'd12: dout_w={8'b0,din_w,12'b0};
				5'd11: dout_w={9'b0,din_w,11'b0};
				5'd10: dout_w={10'b0,din_w,10'b0};
				5'd9: dout_w={11'b0,din_w,9'b0};
				5'd8: dout_w={12'b0,din_w,8'b0};
				5'd7: dout_w={13'b0,din_w,7'b0};
				5'd6: dout_w={14'd0,din_w,6'd0};			
				5'd5: dout_w={15'd0,din_w,5'd0};
				5'd4: dout_w={16'd0,din_w,4'd0};
				5'd3:  dout_w={17'd0,din_w,3'd0};
				5'd2:  dout_w={18'd0,din_w,2'd0};
				5'd1:  dout_w={19'd0,din_w,1'd0};
				5'd0:  dout_w={20'd0,din_w};
				default: dout_w=32'b0;
			endcase
		end
				
	//********************************************************************************
endmodule




	//*******************************************************************************************
	//Notice!! this priority encoder is only for one-hot encoding
	module PRIORITY_ENCODER 
	(
	din_w,
	dout_w
	);
	
	//******************************** input & output *******************************************************

	input 		[15:0]					din_w;
	wire		[3:0]                   temp_w;
	output 		[3:0]  					dout_w; //只有1~10i

	//********************************************************************************

	assign 		dout_w[0]=din_w[6]|din_w[8]|din_w[10]|din_w[12]|din_w[14];
	assign 		dout_w[1]=din_w[7]|din_w[8]|din_w[11]|din_w[12]|din_w[15];
	assign 		dout_w[2]=din_w[9]|din_w[10]|din_w[11]|din_w[12];
	assign 		dout_w[3]=din_w[13]|din_w[14]|din_w[15];

	//********************************************************************************
endmodule
