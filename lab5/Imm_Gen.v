/***************************************************
Student Name: Lin Jun-Xian, Liu Yu-Ren
Student ID: 0711540, 0712511
***************************************************/

`timescale 1ns/1ps

module Imm_Gen(
	input  [31:0] instr_i,
	output reg [31:0] Imm_Gen_o
	);

/* Write your code HERE */
always @(*) begin
    case(instr_i[7-1:0])
		7'b0000000: Imm_Gen_o = 0;
		// R ：

		// I type：LW, JALR, ADDI, SLTI, XORI, ORI, ANDI
		7'b0000011: Imm_Gen_o = {{21{instr_i[31]}}, instr_i[30:25], instr_i[24:21], instr_i[20]};
		7'b1100111: Imm_Gen_o = {{21{instr_i[31]}}, instr_i[30:25], instr_i[24:21], instr_i[20]};
		7'b0010011: Imm_Gen_o = {{21{instr_i[31]}}, instr_i[30:25], instr_i[24:21], instr_i[20]};

		// S type：SW
		7'b0100011: Imm_Gen_o = {{21{instr_i[31]}}, instr_i[30:25],  instr_i[11:7]};

		// B type：Branch
		7'b1100011: Imm_Gen_o = {{20{instr_i[31]}}, instr_i[7], instr_i[30:25], instr_i[11:8], 1'b0};

		// J ：JAL
		7'b1101111: Imm_Gen_o = {{12{instr_i[31]}}, instr_i[19:12], instr_i[20], instr_i[30:25], instr_i[24:21], 1'b0};
    endcase
end
endmodule
