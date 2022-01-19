
	
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
