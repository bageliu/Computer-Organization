/***************************************************
Student Name: 劉育任
Student ID: 0712511
***************************************************/
`timescale 1ns/1ps

module ALU_1bit(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				Cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg	    result,     //1 bit result    (output)
	output reg          cout        //1 bit carry out (output)
	);

/* Write your code HERE */
wire	s1;
wire	s2;

assign	s1 = src1 ^ Ainvert;
assign	s2 = src2 ^ Binvert;

always@(*) begin
	case(operation)
		2'b00: begin
			result = s1 & s2;
			cout = 0;
			end
		2'b01: begin
			result = s1 | s2;
			cout = 0;
			end
		2'b10: begin
			result = s1 ^ s2 ^ Cin;
			cout = (s1 & s2) | (s1 & Cin) | (s2 & Cin);
			end
		2'b11: begin
			result = s1 ^ s2 ^ Cin;
			cout = (s1 & s2) | (s1 & Cin) | (s2 & Cin);
			end
	endcase
end
endmodule
