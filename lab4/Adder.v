/***************************************************
Student Name:Lin Jun-Xian, Liu Yu-Ren
Student ID: group29_0711540_0712511
***************************************************/

   `timescale 1ns/1ps

   module Adder(
       input  [31:0] src1_i,
       input  [31:0] src2_i,
       output [31:0] sum_o
   );

   assign sum_o = src1_i + src2_i;


   endmodule
