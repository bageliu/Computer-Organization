/***************************************************
Student Name:Lin Jun-Xian, Liu Yu-Ren
Student ID: group29_0711540_0712511
***************************************************/

`timescale 1ns/1ps

module Imm_Gen(
   input  [31:0] instr_i,
   output reg[31:0] Imm_Gen_o
);

//Internal Signals
wire    [7-1:0] opcode;
wire    [2:0]   func3;
wire    [3-1:0] Instr_field;

assign opcode = instr_i[6:0];
assign func3  = instr_i[14:12];

/* Write your code HERE */
always @(*) begin
    case(opcode)
        // add, slt -----------------
        7'b0110011: Imm_Gen_o = instr_i; 
        // I type
        7'b0010011: Imm_Gen_o = {{21{instr_i[31]}}, instr_i[30:25], instr_i[24:21], instr_i[20]};
        // load
        7'b0000011: Imm_Gen_o = {{21{instr_i[31]}}, instr_i[30:25], instr_i[24:21], instr_i[20]};
        // s type  store
        7'b0100011: Imm_Gen_o = {{21{instr_i[31]}}, instr_i[30:25],  instr_i[11:7]};
        // branch
        7'b1100011: Imm_Gen_o = {{20{instr_i[31]}}, instr_i[7], instr_i[30:25], instr_i[11:8], 1'b0};
        // jal
        7'b1101111: Imm_Gen_o = {{12{instr_i[31]}},instr_i[19:12],instr_i[20], instr_i[30:25], instr_i[24:21],1'b0};
        // jalr
        7'b1100111: Imm_Gen_o = {{21{instr_i[31]}}, instr_i[30:25],instr_i[24:21],instr_i[20]};
    endcase
end
endmodule
