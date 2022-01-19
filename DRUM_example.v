
`include "MUL_APP.v"


module DRUM_example(
	// output
	In_IFM_1,
	In_IFM_2,
	In_IFM_3,
	In_IFM_4,
	In_IFM_5,
	In_IFM_6,
	In_IFM_7,
	In_IFM_8,	
	In_Weight_1,
	In_Weight_2,
	In_Weight_3,
	In_Weight_4,
	In_Weight_5,
	In_Weight_6,
	In_Weight_7,
	In_Weight_8,
	//input
	Out_OFM	
    );

//---------------------------------------------------------------------
//   PORT DECLARATION
//---------------------------------------------------------------------
input [15:0]In_IFM_1;
input [15:0]In_IFM_2;
input [15:0]In_IFM_3;
input [15:0]In_IFM_4;	
input [15:0]In_IFM_5;
input [15:0]In_IFM_6;
input [15:0]In_IFM_7;
input [15:0]In_IFM_8;
input [15:0]In_Weight_1;
input [15:0]In_Weight_2;
input [15:0]In_Weight_3;
input [15:0]In_Weight_4;
input [15:0]In_Weight_5;
input [15:0]In_Weight_6;
input [15:0]In_Weight_7;
input [15:0]In_Weight_8;
output reg [34:0]Out_OFM;

wire [31:0] r[0:7];
//-----------------------------
MUL_APP DRUMk_M_N_s_1 (In_IFM_1, In_Weight_1, r[0]);
MUL_APP DRUMk_M_N_s_2 (In_IFM_2, In_Weight_2, r[1]);
MUL_APP DRUMk_M_N_s_3 (In_IFM_3, In_Weight_3, r[2]);
MUL_APP DRUMk_M_N_s_4 (In_IFM_4, In_Weight_4, r[3]);
MUL_APP DRUMk_M_N_s_5 (In_IFM_5, In_Weight_5, r[4]);
MUL_APP DRUMk_M_N_s_6 (In_IFM_6, In_Weight_6, r[5]);
MUL_APP DRUMk_M_N_s_7 (In_IFM_7, In_Weight_7, r[6]);
MUL_APP DRUMk_M_N_s_8 (In_IFM_8, In_Weight_8, r[7]);
//-----------------------------                      


always@(*)  // receive IFM
	begin
		Out_OFM=r[0]+r[1]+r[2]+r[3]+r[4]+r[5]+r[6]+r[7];
	end


endmodule