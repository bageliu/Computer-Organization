/***************************************************
Student Name: Lin Jun-Xian, Liu Yu-Ren
Student ID: 0711540, 0712511
***************************************************/

`timescale 1ns/1ps

module ALU_Ctrl(
	input		[4-1:0]	instr,
	input		[2-1:0]	ALUOp,
	output reg	[4-1:0] ALU_Ctrl_o
	);

/* Write your code HERE */
wire [3-1:0] func3;
assign func3 = instr[3-1:0];

always @(*) begin
    case(ALUOp)
		// JALR, LW, SW
        2'b00: ALU_Ctrl_o = 4'b0010;
		// BEQ
        2'b01: ALU_Ctrl_o = 4'b0110;
		// R type
        2'b10: begin
			case(func3)
				// AND
				3'b111: ALU_Ctrl_o = 4'b0000;
				// OR
				3'b110: ALU_Ctrl_o = 4'b0001;
				3'b000: begin
					// ADD
					if (instr[3] == 0) ALU_Ctrl_o = 4'b0010;
					// SUB
					else ALU_Ctrl_o = 4'b0110;
				end
				// SLT
				3'b010: ALU_Ctrl_o = 4'b0111;
				// XOR
				3'b100: ALU_Ctrl_o = 4'b1101;
			endcase
		end

		2'b11: begin
			case(func3)
				// ADDI
				3'b000: ALU_Ctrl_o = 4'b0010;
				// SLTI
				3'b010: ALU_Ctrl_o = 4'b0111;
				// XORI: not found
				3'b100: ALU_Ctrl_o = 4'b1101;
				// ORI: not found
				3'b110: ALU_Ctrl_o = 4'b0001;
				// ANDI: not found
				3'b111: ALU_Ctrl_o = 4'b0000;
				// SLLI
				3'b001: ALU_Ctrl_o = 4'b0011;

			endcase
		end
        default: ALU_Ctrl_o = 0;
    endcase
end

endmodule
