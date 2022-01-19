
`timescale 1ns / 1ps

`define ARRAY_SIZE 8



(* use_dsp = "no" *) module Systolic_array(clk,reset_n,weight_i,input_i,result_o);
	//*************************************************************************************//
	
    input 										clk; 
	input 										reset_n;
	input   	signed [16*`ARRAY_SIZE-1:0] 			weight_i;
	input  		signed [16*`ARRAY_SIZE-1:0]   			input_i;
	output 		signed [35*`ARRAY_SIZE*`ARRAY_SIZE-1:0]result_o;

	wire 		signed [15:0]							input_next_w[0:63];
	wire 		signed [15:0]							weight_next_w[0:63];

    //*************************************************************************************//
	
PE PE_0(.clk(clk),.reset_n(reset_n),.acc_r(result_o[34:0]),.weight_w(weight_i[15:0]),.weight_r(weight_next_w[0]),.input_w(input_i[15:0]),.input_r(input_next_w[0]));
PE PE_1(.clk(clk),.reset_n(reset_n),.acc_r(result_o[69:35]),.weight_w(weight_i[31:16]),.weight_r(weight_next_w[1]),.input_w(input_next_w[0]),.input_r(input_next_w[1]));
PE PE_2(.clk(clk),.reset_n(reset_n),.acc_r(result_o[104:70]),.weight_w(weight_i[47:32]),.weight_r(weight_next_w[2]),.input_w(input_next_w[1]),.input_r(input_next_w[2]));
PE PE_3(.clk(clk),.reset_n(reset_n),.acc_r(result_o[139:105]),.weight_w(weight_i[63:48]),.weight_r(weight_next_w[3]),.input_w(input_next_w[2]),.input_r(input_next_w[3]));
PE PE_4(.clk(clk),.reset_n(reset_n),.acc_r(result_o[174:140]),.weight_w(weight_i[79:64]),.weight_r(weight_next_w[4]),.input_w(input_next_w[3]),.input_r(input_next_w[4]));
PE PE_5(.clk(clk),.reset_n(reset_n),.acc_r(result_o[209:175]),.weight_w(weight_i[95:80]),.weight_r(weight_next_w[5]),.input_w(input_next_w[4]),.input_r(input_next_w[5]));
PE PE_6(.clk(clk),.reset_n(reset_n),.acc_r(result_o[244:210]),.weight_w(weight_i[111:96]),.weight_r(weight_next_w[6]),.input_w(input_next_w[5]),.input_r(input_next_w[6]));
PE PE_7(.clk(clk),.reset_n(reset_n),.acc_r(result_o[279:245]),.weight_w(weight_i[127:112]),.weight_r(weight_next_w[7]),.input_w(input_next_w[6]),.input_r(input_next_w[7]));
PE PE_8(.clk(clk),.reset_n(reset_n),.acc_r(result_o[314:280]),.weight_w(weight_next_w[0]),.weight_r(weight_next_w[8]),.input_w(input_i[31:16]),.input_r(input_next_w[8]));
PE PE_9(.clk(clk),.reset_n(reset_n),.acc_r(result_o[349:315]),.weight_w(weight_next_w[1]),.weight_r(weight_next_w[9]),.input_w(input_next_w[8]),.input_r(input_next_w[9]));
PE PE_10(.clk(clk),.reset_n(reset_n),.acc_r(result_o[384:350]),.weight_w(weight_next_w[2]),.weight_r(weight_next_w[10]),.input_w(input_next_w[9]),.input_r(input_next_w[10]));
PE PE_11(.clk(clk),.reset_n(reset_n),.acc_r(result_o[419:385]),.weight_w(weight_next_w[3]),.weight_r(weight_next_w[11]),.input_w(input_next_w[10]),.input_r(input_next_w[11]));
PE PE_12(.clk(clk),.reset_n(reset_n),.acc_r(result_o[454:420]),.weight_w(weight_next_w[4]),.weight_r(weight_next_w[12]),.input_w(input_next_w[11]),.input_r(input_next_w[12]));
PE PE_13(.clk(clk),.reset_n(reset_n),.acc_r(result_o[489:455]),.weight_w(weight_next_w[5]),.weight_r(weight_next_w[13]),.input_w(input_next_w[12]),.input_r(input_next_w[13]));
PE PE_14(.clk(clk),.reset_n(reset_n),.acc_r(result_o[524:490]),.weight_w(weight_next_w[6]),.weight_r(weight_next_w[14]),.input_w(input_next_w[13]),.input_r(input_next_w[14]));
PE PE_15(.clk(clk),.reset_n(reset_n),.acc_r(result_o[559:525]),.weight_w(weight_next_w[7]),.weight_r(weight_next_w[15]),.input_w(input_next_w[14]),.input_r(input_next_w[15]));
PE PE_16(.clk(clk),.reset_n(reset_n),.acc_r(result_o[594:560]),.weight_w(weight_next_w[8]),.weight_r(weight_next_w[16]),.input_w(input_i[47:32]),.input_r(input_next_w[16]));
PE PE_17(.clk(clk),.reset_n(reset_n),.acc_r(result_o[629:595]),.weight_w(weight_next_w[9]),.weight_r(weight_next_w[17]),.input_w(input_next_w[16]),.input_r(input_next_w[17]));
PE PE_18(.clk(clk),.reset_n(reset_n),.acc_r(result_o[664:630]),.weight_w(weight_next_w[10]),.weight_r(weight_next_w[18]),.input_w(input_next_w[17]),.input_r(input_next_w[18]));
PE PE_19(.clk(clk),.reset_n(reset_n),.acc_r(result_o[699:665]),.weight_w(weight_next_w[11]),.weight_r(weight_next_w[19]),.input_w(input_next_w[18]),.input_r(input_next_w[19]));
PE PE_20(.clk(clk),.reset_n(reset_n),.acc_r(result_o[734:700]),.weight_w(weight_next_w[12]),.weight_r(weight_next_w[20]),.input_w(input_next_w[19]),.input_r(input_next_w[20]));
PE PE_21(.clk(clk),.reset_n(reset_n),.acc_r(result_o[769:735]),.weight_w(weight_next_w[13]),.weight_r(weight_next_w[21]),.input_w(input_next_w[20]),.input_r(input_next_w[21]));
PE PE_22(.clk(clk),.reset_n(reset_n),.acc_r(result_o[804:770]),.weight_w(weight_next_w[14]),.weight_r(weight_next_w[22]),.input_w(input_next_w[21]),.input_r(input_next_w[22]));
PE PE_23(.clk(clk),.reset_n(reset_n),.acc_r(result_o[839:805]),.weight_w(weight_next_w[15]),.weight_r(weight_next_w[23]),.input_w(input_next_w[22]),.input_r(input_next_w[23]));
PE PE_24(.clk(clk),.reset_n(reset_n),.acc_r(result_o[874:840]),.weight_w(weight_next_w[16]),.weight_r(weight_next_w[24]),.input_w(input_i[63:48]),.input_r(input_next_w[24]));
PE PE_25(.clk(clk),.reset_n(reset_n),.acc_r(result_o[909:875]),.weight_w(weight_next_w[17]),.weight_r(weight_next_w[25]),.input_w(input_next_w[24]),.input_r(input_next_w[25]));
PE PE_26(.clk(clk),.reset_n(reset_n),.acc_r(result_o[944:910]),.weight_w(weight_next_w[18]),.weight_r(weight_next_w[26]),.input_w(input_next_w[25]),.input_r(input_next_w[26]));
PE PE_27(.clk(clk),.reset_n(reset_n),.acc_r(result_o[979:945]),.weight_w(weight_next_w[19]),.weight_r(weight_next_w[27]),.input_w(input_next_w[26]),.input_r(input_next_w[27]));
PE PE_28(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1014:980]),.weight_w(weight_next_w[20]),.weight_r(weight_next_w[28]),.input_w(input_next_w[27]),.input_r(input_next_w[28]));
PE PE_29(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1049:1015]),.weight_w(weight_next_w[21]),.weight_r(weight_next_w[29]),.input_w(input_next_w[28]),.input_r(input_next_w[29]));
PE PE_30(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1084:1050]),.weight_w(weight_next_w[22]),.weight_r(weight_next_w[30]),.input_w(input_next_w[29]),.input_r(input_next_w[30]));
PE PE_31(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1119:1085]),.weight_w(weight_next_w[23]),.weight_r(weight_next_w[31]),.input_w(input_next_w[30]),.input_r(input_next_w[31]));
PE PE_32(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1154:1120]),.weight_w(weight_next_w[24]),.weight_r(weight_next_w[32]),.input_w(input_i[79:64]),.input_r(input_next_w[32]));
PE PE_33(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1189:1155]),.weight_w(weight_next_w[25]),.weight_r(weight_next_w[33]),.input_w(input_next_w[32]),.input_r(input_next_w[33]));
PE PE_34(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1224:1190]),.weight_w(weight_next_w[26]),.weight_r(weight_next_w[34]),.input_w(input_next_w[33]),.input_r(input_next_w[34]));
PE PE_35(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1259:1225]),.weight_w(weight_next_w[27]),.weight_r(weight_next_w[35]),.input_w(input_next_w[34]),.input_r(input_next_w[35]));
PE PE_36(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1294:1260]),.weight_w(weight_next_w[28]),.weight_r(weight_next_w[36]),.input_w(input_next_w[35]),.input_r(input_next_w[36]));
PE PE_37(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1329:1295]),.weight_w(weight_next_w[29]),.weight_r(weight_next_w[37]),.input_w(input_next_w[36]),.input_r(input_next_w[37]));
PE PE_38(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1364:1330]),.weight_w(weight_next_w[30]),.weight_r(weight_next_w[38]),.input_w(input_next_w[37]),.input_r(input_next_w[38]));
PE PE_39(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1399:1365]),.weight_w(weight_next_w[31]),.weight_r(weight_next_w[39]),.input_w(input_next_w[38]),.input_r(input_next_w[39]));
PE PE_40(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1434:1400]),.weight_w(weight_next_w[32]),.weight_r(weight_next_w[40]),.input_w(input_i[95:80]),.input_r(input_next_w[40]));
PE PE_41(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1469:1435]),.weight_w(weight_next_w[33]),.weight_r(weight_next_w[41]),.input_w(input_next_w[40]),.input_r(input_next_w[41]));
PE PE_42(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1504:1470]),.weight_w(weight_next_w[34]),.weight_r(weight_next_w[42]),.input_w(input_next_w[41]),.input_r(input_next_w[42]));
PE PE_43(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1539:1505]),.weight_w(weight_next_w[35]),.weight_r(weight_next_w[43]),.input_w(input_next_w[42]),.input_r(input_next_w[43]));
PE PE_44(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1574:1540]),.weight_w(weight_next_w[36]),.weight_r(weight_next_w[44]),.input_w(input_next_w[43]),.input_r(input_next_w[44]));
PE PE_45(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1609:1575]),.weight_w(weight_next_w[37]),.weight_r(weight_next_w[45]),.input_w(input_next_w[44]),.input_r(input_next_w[45]));
PE PE_46(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1644:1610]),.weight_w(weight_next_w[38]),.weight_r(weight_next_w[46]),.input_w(input_next_w[45]),.input_r(input_next_w[46]));
PE PE_47(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1679:1645]),.weight_w(weight_next_w[39]),.weight_r(weight_next_w[47]),.input_w(input_next_w[46]),.input_r(input_next_w[47]));
PE PE_48(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1714:1680]),.weight_w(weight_next_w[40]),.weight_r(weight_next_w[48]),.input_w(input_i[111:96]),.input_r(input_next_w[48]));
PE PE_49(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1749:1715]),.weight_w(weight_next_w[41]),.weight_r(weight_next_w[49]),.input_w(input_next_w[48]),.input_r(input_next_w[49]));
PE PE_50(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1784:1750]),.weight_w(weight_next_w[42]),.weight_r(weight_next_w[50]),.input_w(input_next_w[49]),.input_r(input_next_w[50]));
PE PE_51(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1819:1785]),.weight_w(weight_next_w[43]),.weight_r(weight_next_w[51]),.input_w(input_next_w[50]),.input_r(input_next_w[51]));
PE PE_52(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1854:1820]),.weight_w(weight_next_w[44]),.weight_r(weight_next_w[52]),.input_w(input_next_w[51]),.input_r(input_next_w[52]));
PE PE_53(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1889:1855]),.weight_w(weight_next_w[45]),.weight_r(weight_next_w[53]),.input_w(input_next_w[52]),.input_r(input_next_w[53]));
PE PE_54(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1924:1890]),.weight_w(weight_next_w[46]),.weight_r(weight_next_w[54]),.input_w(input_next_w[53]),.input_r(input_next_w[54]));
PE PE_55(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1959:1925]),.weight_w(weight_next_w[47]),.weight_r(weight_next_w[55]),.input_w(input_next_w[54]),.input_r(input_next_w[55]));
PE PE_56(.clk(clk),.reset_n(reset_n),.acc_r(result_o[1994:1960]),.weight_w(weight_next_w[48]),.weight_r(weight_next_w[56]),.input_w(input_i[127:112]),.input_r(input_next_w[56]));
PE PE_57(.clk(clk),.reset_n(reset_n),.acc_r(result_o[2029:1995]),.weight_w(weight_next_w[49]),.weight_r(weight_next_w[57]),.input_w(input_next_w[56]),.input_r(input_next_w[57]));
PE PE_58(.clk(clk),.reset_n(reset_n),.acc_r(result_o[2064:2030]),.weight_w(weight_next_w[50]),.weight_r(weight_next_w[58]),.input_w(input_next_w[57]),.input_r(input_next_w[58]));
PE PE_59(.clk(clk),.reset_n(reset_n),.acc_r(result_o[2099:2065]),.weight_w(weight_next_w[51]),.weight_r(weight_next_w[59]),.input_w(input_next_w[58]),.input_r(input_next_w[59]));
PE PE_60(.clk(clk),.reset_n(reset_n),.acc_r(result_o[2134:2100]),.weight_w(weight_next_w[52]),.weight_r(weight_next_w[60]),.input_w(input_next_w[59]),.input_r(input_next_w[60]));
PE PE_61(.clk(clk),.reset_n(reset_n),.acc_r(result_o[2169:2135]),.weight_w(weight_next_w[53]),.weight_r(weight_next_w[61]),.input_w(input_next_w[60]),.input_r(input_next_w[61]));
PE PE_62(.clk(clk),.reset_n(reset_n),.acc_r(result_o[2204:2170]),.weight_w(weight_next_w[54]),.weight_r(weight_next_w[62]),.input_w(input_next_w[61]),.input_r(input_next_w[62]));
PE PE_63(.clk(clk),.reset_n(reset_n),.acc_r(result_o[2239:2205]),.weight_w(weight_next_w[55]),.weight_r(weight_next_w[63]),.input_w(input_next_w[62]),.input_r(input_next_w[63]));
endmodule
