/***************************************************
Student Name: Lin Jun-Xian
Student ID: 0711540
***************************************************/

`timescale 1ns/1ps

module ALU_Ctrl(
	input	[4-1:0]	instr,
	input	[2-1:0]	ALUOp,
	output	reg [4-1:0] ALU_Ctrl_o
	);
	
/* Write your code HERE */
// instr is composed of instruction[30, 14-12] or {funct7[5], funct3}
wire [6-1:0] condition;
assign condition = {ALUOp, instr};

always @(*) begin
	case(condition)
		// lw
		6'b00xxxx: ALU_Ctrl_o = 4'b0010;
		// sw
		6'bx1xxxx: ALU_Ctrl_o = 4'b0110;
		// add
		6'b1x0000: ALU_Ctrl_o = 4'b0010;
		// sub
		6'b1x1000: ALU_Ctrl_o = 4'b0110;
		// and
		6'b1x0111: ALU_Ctrl_o = 4'b0000;
		// or
		6'b1x0110: ALU_Ctrl_o = 4'b0001;
		// slt
		6'b1x0010: ALU_Ctrl_o = 4'b0111;
		// xor
		6'b1x0100: ALU_Ctrl_o = 4'b0011;
		// sll
		6'b1x0001: ALU_Ctrl_o = 4'b0100;
		// sra
		6'b1x1101: ALU_Ctrl_o = 4'b1000;
	endcase
end

endmodule