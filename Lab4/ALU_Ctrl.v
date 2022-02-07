/***************************************************
Student Name:Lin Jun-Xian, Liu Yu-Ren
Student ID: group29_0711540_0712511
***************************************************/

`timescale 1ns/1ps
/*instr[30,14:12]*/
module ALU_Ctrl(
    input       [4-1:0] instr,
    input       [2-1:0] ALUOp,
    output  reg [4-1:0] ALU_Ctrl_o
);
wire [3-1:0] func3;
assign func3 = instr[3-1:0];

/* Write your code HERE */
always @(*) begin
    case(ALUOp)
        2'b00: ALU_Ctrl_o = 4'b0010; // load, store, addi
        2'b01: ALU_Ctrl_o = 4'b0110; //beq
        2'b1x: begin 
        		case(func3)
        			3'b000: ALU_Ctrl_o = 4'b0010; //add
        			3'b010: ALU_Ctrl_o = 4'b0111; //slt
        		endcase
               end
        default: ALU_Ctrl_o = 0;
    endcase
end

endmodule
