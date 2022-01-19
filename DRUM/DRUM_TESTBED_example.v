
`timescale 1ns/1ps
`include "DRUM_PATTERN_example.v"


`ifdef RTL
  `include "DRUM_example.v"

`endif

`ifdef GATE
  `include "DRUM_example_SYN.v"
`endif


module TESTBED;
   //input
	wire	[15:0]In_IFM_1;
	wire	[15:0]In_IFM_2;
	wire	[15:0]In_IFM_3;
	wire	[15:0]In_IFM_4;	
	wire	[15:0]In_IFM_5;
	wire	[15:0]In_IFM_6;
	wire	[15:0]In_IFM_7;
	wire	[15:0]In_IFM_8;
	wire	[15:0]In_Weight_1;
	wire	[15:0]In_Weight_2;
	wire	[15:0]In_Weight_3;
	wire	[15:0]In_Weight_4;
	wire	[15:0]In_Weight_5;
	wire	[15:0]In_Weight_6;
	wire	[15:0]In_Weight_7;
	wire	[15:0]In_Weight_8;
 
	
	//output
	wire [34:0] Out_OFM;

	
	
initial begin
  `ifdef RTL
    $fsdbDumpfile("DRUM_example.fsdb");
    $fsdbDumpvars();
  `endif
  `ifdef GATE
    $sdf_annotate("DRUM_example_SYN.sdf",hw4_Convolution_example_SYN);
    $fsdbDumpfile("DRUM_example_SYN.fsdb");
    $fsdbDumpvars();    
  `endif
end

`ifdef RTL	
DRUM_example	DRUM_example	(

		.In_IFM_1(In_IFM_1),
		.In_IFM_2(In_IFM_2),
		.In_IFM_3(In_IFM_3),
		.In_IFM_4(In_IFM_4),
		.In_IFM_5(In_IFM_5),
		.In_IFM_6(In_IFM_6),
		.In_IFM_7(In_IFM_7),
		.In_IFM_8(In_IFM_8),
		.In_Weight_1(In_Weight_1),
		.In_Weight_2(In_Weight_2),		
		.In_Weight_3(In_Weight_3),		
		.In_Weight_4(In_Weight_4),
		.In_Weight_5(In_Weight_5),
		.In_Weight_6(In_Weight_6),		
		.In_Weight_7(In_Weight_7),		
		.In_Weight_8(In_Weight_8),
		.Out_OFM(Out_OFM)
		);
`endif

`ifdef GATE
DRUM_example_SYN	 DRUM_example_SYN	(

		.In_IFM_1(In_IFM_1),
		.In_IFM_2(In_IFM_2),
		.In_IFM_3(In_IFM_3),
		.In_IFM_4(In_IFM_4),
		.In_Weight_1(In_Weight_1),
		.In_Weight_2(In_Weight_2),		
		.In_Weight_3(In_Weight_3),		
		.In_Weight_4(In_Weight_4),
		.Out_OFM(Out_OFM)
		
		);
`endif

DRUM_PATTERN_example DRUM_PATTERN_example(

		.In_IFM_1(In_IFM_1),
		.In_IFM_2(In_IFM_2),
		.In_IFM_3(In_IFM_3),
		.In_IFM_4(In_IFM_4),
		.In_IFM_5(In_IFM_5),
		.In_IFM_6(In_IFM_6),
		.In_IFM_7(In_IFM_7),
		.In_IFM_8(In_IFM_8),
		.In_Weight_1(In_Weight_1),
		.In_Weight_2(In_Weight_2),		
		.In_Weight_3(In_Weight_3),		
		.In_Weight_4(In_Weight_4),
		.In_Weight_5(In_Weight_5),
		.In_Weight_6(In_Weight_6),		
		.In_Weight_7(In_Weight_7),		
		.In_Weight_8(In_Weight_8),
		.Out_OFM(Out_OFM)
		
		);
		
endmodule