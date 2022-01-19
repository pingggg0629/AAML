	`include "LOD.v"
	`include "PRIORITY_ENCODER.v"
	`include "BARREL_SHIFTER.v"

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

