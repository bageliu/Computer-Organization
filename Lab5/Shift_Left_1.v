/***************************************************
Student Name: Lin Jun-Xian, Liu Yu-Ren
Student ID: 0711540, 0712511
***************************************************/

`timescale 1ns/1ps

module Shift_Left_1(
    input  		[32-1:0] data_i,
    output wire [32-1:0] data_o
    );
assign data_o = {data_i[30:0], 1'b0};

endmodule
