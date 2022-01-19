clc
clear
close all
%------------------------------------------------------------%
w1=[];
w2=[0];

o1=[];
o2=[0];

num_sa=64;
bit_width=16;
for i=1:num_sa
    w1=[w1;string(i*bit_width-1)];%7 15 23 ..
    w2=[w2;string(i*bit_width)];%0 8

    o1=[o1;string(i*35-1)];%7 15 23 ..
    o2=[o2;string(i*35)];%0 8
end
%------------------ WEIGHT ---------------------%
w3=[];
temp_3=[];
temp_4=[];
cnt_1=1;
cnt_2=0;

for i=1:num_sa
    temp_1="PE PE_"+string(i-1)+"(.clk(clk),.reset_n(reset_n),"+".acc_r(result_o["+o1(i)+":"+o2(i)+"]),";
    %------------------ Weight ---------------------
    if i<=sqrt(num_sa)
        temp_2=".weight_w(weight_i["+w1(i)+":"+w2(i)+"]),.weight_r(weight_next_w["+string(i-1)+"]),";
    else
        temp_2=".weight_w(weight_next_w["+string(i-2-7)+"]),.weight_r(weight_next_w["+string(i-1)+"]),";
    end
    %------------------ INPUT ---------------------
    if mod(i,sqrt(num_sa))==1 %第一列PE
        temp_3=".input_w(input_i["+w1(cnt_1)+":"+w2(cnt_1)+"]),.input_r(input_next_w["+string(i-1)+"])";

        cnt_1=cnt_1+1;
    else
        temp_3=".input_w(input_next_w["+string(i-2)+"]),.input_r(input_next_w["+string(i-1)+"])";
    end
    %------------------ OUTPUT ---------------------
    %{
    if i<17
        temp_4=".psum_last_w(16'd0),.psum_r(psum_next_w["+string(i-1)+"])";
    elseif i>240
        temp_4=".psum_last_w(psum_next_w["+string(i-1-16)+"]),.psum_r(result_o["+string(cnt_2*16-1)+":"+string((cnt_2-1)*16)+"])";
        cnt_2=cnt_2+1;
    else
        temp_4=".psum_last_w(psum_next_w["+string(i-1-16)+"]),.psum_r(psum_next_w["+string(i-1)+"])";
    end
    %}
    w3=[w3;temp_1+temp_2+temp_3+");"];
   
end
w3=[w3;"endmodule"];

%------------------------------------------------------------%
fid=fopen('b.txt','wt');
fprintf(fid,'%s\n',w3);
fclose(fid)