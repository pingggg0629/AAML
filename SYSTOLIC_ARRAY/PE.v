

(* use_dsp = "no" *)  module PE
		(
		clk, 
		reset_n,
		weight_w,
		input_w,
		
		weight_r,
		input_r,
		acc_r
		);
	//*************************************************************************************//

    input 						clk; 
	input 						reset_n;
	input signed        [15:0] 	weight_w;
	input signed 		[15:0]	input_w;
	//*********************************************
	output reg  signed  [15:0]	weight_r;
	output reg 	signed  [15:0]	input_r;
	            
	output reg 	signed  [34:0]	acc_r;
	//32bit adder by 8 times -> 32bit*8 -> 32bit + 3bit

	//*************************************************************************************//
	reg signed  		[34:0]	acc_w;
	wire signed			[31:0]	mul_w;
	
	MUL_APP MUL_APP(weight_w,input_w,mul_w);

    //*************************************************************************************//
	always @(*)
		begin
			 //******************************
			//mul_w=weight_w*input_w;
			acc_w=acc_r+mul_w;
			//******************************
		end
	//*************************************************************************************//
	always @(posedge clk)
		begin
			if (reset_n==1'b0)
				begin
					input_r<=16'd0;
					weight_r<=16'd0;
					acc_r<=35'd0;
				end
			else
				begin
					input_r<=input_w;
					weight_r<=weight_w;
					acc_r<=acc_w;
				end
		end	
	//*************************************************************************************//
	
endmodule
