/***************************************************
Student Name: Lin Jun-Xian
Student ID: 0711540
***************************************************/

`timescale 1ns/1ps

module Decoder(
	input 		[32-1:0] 	instr_i,
	output wire				ALUSrc,
	output wire				RegWrite,
	output wire				Branch,
	output wire [2-1:0]		ALUOp
	);
	
//Internal Signals
wire [7-1:0] opcode;
reg tempALUSrc;
reg tempRegWrite;
reg tempBranch;
reg [2-1:0] tempALUOp;

assign opcode = instr_i[7-1:0]; 
assign ALUSrc = tempALUSrc;
assign RegWrite = tempRegWrite;
assign Branch = tempBranch;
assign ALUOp = tempALUOp;

always @(*) begin
	case(opcode)
		// R-type
		7'b0110011: {tempALUSrc, tempRegWrite, tempBranch, tempALUOp} = {1'b0, 1'b1, 1'b0, 2'b1x};
		// L-type
		7'b0000011: {tempALUSrc, tempRegWrite, tempBranch, tempALUOp} = {1'b1, 1'b1, 1'b0, 2'b00};
		// S-type
		7'b0100011: {tempALUSrc, tempRegWrite, tempBranch, tempALUOp} = {1'b1, 1'b0, 1'b0, 2'b00};
		// B-type
		7'b1100011: {tempALUSrc, tempRegWrite, tempBranch, tempALUOp} = {1'b0, 1'b0, 1'b1, 2'b01};
	endcase
end

endmodule





                    
                    