/***************************************************
Student Name:
Student ID: 0712511
***************************************************/
`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input	signed    [32-1:0]	src1,          // 32 bits source 1          (input)
	input	signed     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */

always @(*)begin
	if(rst_n == 1'b1) begin
		cout <= 0;
		overflow <= 0;
		zero <= !(result);
		case(ALU_control)
			4'b0000: begin	
				result <= src1 & src2;
			end
			4'b0001: begin	
				result <= src1 | src2;
			end
			4'b0010: begin	
				result <= src1 + src2;
			end
			4'b0110: begin	
				result <= src1 - src2;
			end 
			4'b0011: begin	
				result <= src1 ^ src2;				
			end 
			4'b0111: begin	
				result <= (src1 < src2)?1:0;
			end 
			4'b0100: begin	
				result <= src1<<src2;
			end 
			4'b1000: begin	
				result <= src1>>>src2;
			end 
			default: result<= 0;
		endcase

	end
end

endmodule
