/***************************************************
Student Name: Lin Jun-Xian, Liu Yu-Ren
Student ID: 0711540, 0712511
***************************************************/
`timescale 1ns/1ps

module MUX_2to1(
	input   	[32-1:0] data0_i,       
	input   	[32-1:0] data1_i,
	input       	     select_i,
	output wire [32-1:0] data_o
               );			   

assign data_o = select_i==0 ? data0_i : data1_i;

endmodule      
          
