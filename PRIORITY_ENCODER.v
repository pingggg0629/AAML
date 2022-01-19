
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
