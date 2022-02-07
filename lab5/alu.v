/***************************************************
Student Name: Lin Jun-Xian, Liu Yu-Ren
Student ID: 0711540, 0712511
***************************************************/
`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */
always @(*)begin
	if(~rst_n) begin
		result = 0;
		zero = 1'b0;
		cout = 1'b0;
		overflow = 1'b0;
	end
	else begin
		case(ALU_control)

			4'b0000: result = src1 & src2;

			4'b0001: result = src1 | src2;

			4'b0010: result = src1 + src2;

			4'b0110: result = src1 - src2;

			4'b1101: result = src1 ^ src2;				

			4'b0111: result = ($signed(src1) < $signed(src2)) ? 1 : 0;

			4'b0011: result = src1 << src2;
			
			default: result = 0;
		endcase
		zero = ~(|result);
		cout = 1'b0;
		overflow = 1'b0;
	end
end

endmodule
