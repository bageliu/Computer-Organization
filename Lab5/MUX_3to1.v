/***************************************************
Student Name: Lin Jun-Xian, Liu Yu-Ren
Student ID: 0711540, 0712511
***************************************************/

`timescale 1ns/1ps

module MUX_3to1(
	input   	[32-1:0] data0_i,       
	input   	[32-1:0] data1_i,
	input   	[32-1:0] data2_i,
	input       [ 2-1:0] select_i,
	output wire [32-1:0] data_o
               );			   

assign data_o = select_i[0]==0 ? (select_i[1]==0 ? data0_i : data2_i) : data1_i;

endmodule      
          
