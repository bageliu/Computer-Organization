/***************************************************
Student Name:Lin Jun-Xian, Liu Yu-Ren
Student ID: group29_0711540_0712511
***************************************************/

`timescale 1ns/1ps

module Decoder(
   input   [7-1:0]     instr_i,
   output	reg 	RegWrite,
   output 	reg 	Branch,
   output 	reg 	Jump,
   output 	reg 	WriteBack1,
   output 	reg 	WriteBack0,
   output 	reg 	MemRead,
   output 	reg 	MemWrite,
   output 	reg 	ALUSrcA,
   output 	reg 	ALUSrcB,
   output 	reg 	[2-1:0]ALUOp
);

/* Write your code HERE */

always @(*) begin
	case(instr_i)
		7'b0000000: {RegWrite, Branch, Jump, WriteBack0, WriteBack1, MemRead, MemWrite, ALUSrcA, ALUSrcB, ALUOp} = 11'b00000000000;
		// R type
		7'b0110011: {RegWrite, Branch, Jump, WriteBack0, WriteBack1, MemRead, MemWrite, ALUSrcA, ALUSrcB, ALUOp} = 11'b1000000x01x;
		// addi
		7'b0010011: {RegWrite, Branch, Jump, WriteBack0, WriteBack1, MemRead, MemWrite, ALUSrcA, ALUSrcB, ALUOp} = 11'b1000000x100;
		// load
		7'b0000011: {RegWrite, Branch, Jump, WriteBack0, WriteBack1, MemRead, MemWrite, ALUSrcA, ALUSrcB, ALUOp} = 11'b1001010x100;
		// S type
		7'b0100011: {RegWrite, Branch, Jump, WriteBack0, WriteBack1, MemRead, MemWrite, ALUSrcA, ALUSrcB, ALUOp} = 11'b000xx01x100;
		// B type
		7'b1100011: {RegWrite, Branch, Jump, WriteBack0, WriteBack1, MemRead, MemWrite, ALUSrcA, ALUSrcB, ALUOp} = 11'b010xx000001;
		// jal
		7'b1101111: {RegWrite, Branch, Jump, WriteBack0, WriteBack1, MemRead, MemWrite, ALUSrcA, ALUSrcB, ALUOp} = 11'b101x1000xxx;
		// jalr
		7'b1100111: {RegWrite, Branch, Jump, WriteBack0, WriteBack1, MemRead, MemWrite, ALUSrcA, ALUSrcB, ALUOp} = 11'b101x1001xxx;
	endcase
end

endmodule

