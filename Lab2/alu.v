/***************************************************
Student Name:劉育任
Student ID:0712511
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

wire	a1;
wire	b1;
wire	[31:0] c;
wire	[1:0] op;
wire	[31:0] c2;
wire	c1;
assign	{a1, b1} = {ALU_control[3], ALU_control[2]};
assign	op = {ALU_control[1], ALU_control[0]};

ALU_1bit alu0(.src1(src1[0]), .src2(src2[0]), .Ainvert(a1), .Binvert(b1), .Cin(b1), .operation(op), .result(c[0]), .cout(c2[0]));
ALU_1bit alu1(.src1(src1[1]), .src2(src2[1]), .Ainvert(a1), .Binvert(b1), .Cin(c2[0]), .operation(op), .result(c[1]), .cout(c2[1]));
ALU_1bit alu2(.src1(src1[2]), .src2(src2[2]), .Ainvert(a1), .Binvert(b1), .Cin(c2[1]), .operation(op), .result(c[2]), .cout(c2[2]));
ALU_1bit alu3(.src1(src1[3]), .src2(src2[3]), .Ainvert(a1), .Binvert(b1), .Cin(c2[2]), .operation(op), .result(c[3]), .cout(c2[3]));
ALU_1bit alu4(.src1(src1[4]), .src2(src2[4]), .Ainvert(a1), .Binvert(b1), .Cin(c2[3]), .operation(op), .result(c[4]), .cout(c2[4]));
ALU_1bit alu5(.src1(src1[5]), .src2(src2[5]), .Ainvert(a1), .Binvert(b1), .Cin(c2[4]), .operation(op), .result(c[5]), .cout(c2[5]));
ALU_1bit alu6(.src1(src1[6]), .src2(src2[6]), .Ainvert(a1), .Binvert(b1), .Cin(c2[5]), .operation(op), .result(c[6]), .cout(c2[6]));
ALU_1bit alu7(.src1(src1[7]), .src2(src2[7]), .Ainvert(a1), .Binvert(b1), .Cin(c2[6]), .operation(op), .result(c[7]), .cout(c2[7]));
ALU_1bit alu8(.src1(src1[8]), .src2(src2[8]), .Ainvert(a1), .Binvert(b1), .Cin(c2[7]), .operation(op), .result(c[8]), .cout(c2[8]));
ALU_1bit alu9(.src1(src1[9]), .src2(src2[9]), .Ainvert(a1), .Binvert(b1), .Cin(c2[8]), .operation(op), .result(c[9]), .cout(c2[9]));
ALU_1bit alu10(.src1(src1[10]), .src2(src2[10]), .Ainvert(a1), .Binvert(b1), .Cin(c2[9]), .operation(op), .result(c[10]), .cout(c2[10]));
ALU_1bit alu11(.src1(src1[11]), .src2(src2[11]), .Ainvert(a1), .Binvert(b1), .Cin(c2[10]), .operation(op), .result(c[11]), .cout(c2[11]));
ALU_1bit alu12(.src1(src1[12]), .src2(src2[12]), .Ainvert(a1), .Binvert(b1), .Cin(c2[11]), .operation(op), .result(c[12]), .cout(c2[12]));
ALU_1bit alu13(.src1(src1[13]), .src2(src2[13]), .Ainvert(a1), .Binvert(b1), .Cin(c2[12]), .operation(op), .result(c[13]), .cout(c2[13]));
ALU_1bit alu14(.src1(src1[14]), .src2(src2[14]), .Ainvert(a1), .Binvert(b1), .Cin(c2[13]), .operation(op), .result(c[14]), .cout(c2[14]));
ALU_1bit alu15(.src1(src1[15]), .src2(src2[15]), .Ainvert(a1), .Binvert(b1), .Cin(c2[14]), .operation(op), .result(c[15]), .cout(c2[15]));
ALU_1bit alu16(.src1(src1[16]), .src2(src2[16]), .Ainvert(a1), .Binvert(b1), .Cin(c2[15]), .operation(op), .result(c[16]), .cout(c2[16]));
ALU_1bit alu17(.src1(src1[17]), .src2(src2[17]), .Ainvert(a1), .Binvert(b1), .Cin(c2[16]), .operation(op), .result(c[17]), .cout(c2[17]));
ALU_1bit alu18(.src1(src1[18]), .src2(src2[18]), .Ainvert(a1), .Binvert(b1), .Cin(c2[17]), .operation(op), .result(c[18]), .cout(c2[18]));
ALU_1bit alu19(.src1(src1[19]), .src2(src2[19]), .Ainvert(a1), .Binvert(b1), .Cin(c2[18]), .operation(op), .result(c[19]), .cout(c2[19]));
ALU_1bit alu20(.src1(src1[20]), .src2(src2[20]), .Ainvert(a1), .Binvert(b1), .Cin(c2[19]), .operation(op), .result(c[20]), .cout(c2[20]));
ALU_1bit alu21(.src1(src1[21]), .src2(src2[21]), .Ainvert(a1), .Binvert(b1), .Cin(c2[20]), .operation(op), .result(c[21]), .cout(c2[21]));
ALU_1bit alu22(.src1(src1[22]), .src2(src2[22]), .Ainvert(a1), .Binvert(b1), .Cin(c2[21]), .operation(op), .result(c[22]), .cout(c2[22]));
ALU_1bit alu23(.src1(src1[23]), .src2(src2[23]), .Ainvert(a1), .Binvert(b1), .Cin(c2[22]), .operation(op), .result(c[23]), .cout(c2[23]));
ALU_1bit alu24(.src1(src1[24]), .src2(src2[24]), .Ainvert(a1), .Binvert(b1), .Cin(c2[23]), .operation(op), .result(c[24]), .cout(c2[24]));
ALU_1bit alu25(.src1(src1[25]), .src2(src2[25]), .Ainvert(a1), .Binvert(b1), .Cin(c2[24]), .operation(op), .result(c[25]), .cout(c2[25]));
ALU_1bit alu26(.src1(src1[26]), .src2(src2[26]), .Ainvert(a1), .Binvert(b1), .Cin(c2[25]), .operation(op), .result(c[26]), .cout(c2[26]));
ALU_1bit alu27(.src1(src1[27]), .src2(src2[27]), .Ainvert(a1), .Binvert(b1), .Cin(c2[26]), .operation(op), .result(c[27]), .cout(c2[27]));
ALU_1bit alu28(.src1(src1[28]), .src2(src2[28]), .Ainvert(a1), .Binvert(b1), .Cin(c2[27]), .operation(op), .result(c[28]), .cout(c2[28]));
ALU_1bit alu29(.src1(src1[29]), .src2(src2[29]), .Ainvert(a1), .Binvert(b1), .Cin(c2[28]), .operation(op), .result(c[29]), .cout(c2[29]));
ALU_1bit alu30(.src1(src1[30]), .src2(src2[30]), .Ainvert(a1), .Binvert(b1), .Cin(c2[29]), .operation(op), .result(c[30]), .cout(c2[30]));
ALU_1bit alu31(.src1(src1[31]), .src2(src2[31]), .Ainvert(a1), .Binvert(b1), .Cin(c2[30]), .operation(op), .result(c[31]), .cout(c2[31]));

always@(*)
begin
	if(rst_n == 1'b1) begin
		overflow <= c2[31] ^ c2[30];
		 
		if(op == 3) begin
			result <= c[31] ? 1:0;
			zero <= !(result);
			cout <= 0;
		end
		else begin
			result <= c;
			zero <= !(result);
			cout <= c2[31];
		end
	end
end



endmodule
