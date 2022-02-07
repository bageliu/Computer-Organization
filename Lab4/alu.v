/***************************************************
Student Name:Lin Jun-Xian, Liu Yu-Ren
Student ID: group29_0711540_0712511
***************************************************/

`timescale 1ns/1ps

module alu(
    input                   rst_n,         // negative reset            (input)
    input        [32-1:0]   src1,          // 32 bits source 1          (input)
    input        [32-1:0]   src2,          // 32 bits source 2          (input)
    input        [ 4-1:0]   ALU_control,   // 4 bits ALU control input  (input)
    output reg   [32-1:0]   result,        // 32 bits result            (output)
    output reg              Zero           // 1 bit when the output is 0, zero must be set (output)
);

/* Write your code HERE */
always @(*) begin
    if(rst_n) begin
    	Zero <= !(result);
        case(ALU_control)
            // add, lw, sw, addi
            4'b0010: result <= src1 + src2;
            // sub, beq
            4'b0110: result <= src1 - src2;
            // slt
            4'b0111: result <= ($signed(src1) < $signed(src2))?1:0;
            default: result <= 0;
        endcase
    end
end

endmodule
