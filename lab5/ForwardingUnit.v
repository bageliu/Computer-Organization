/***************************************************
Student Name: Lin Jun-Xian, Liu Yu-Ren
Student ID: 0711540, 0712511
***************************************************/
module ForwardingUnit (EXE_instr19_15, EXE_instr24_20, MEM_instr11_7, MEM_WBControl, WB_instr11_7, WB_Control, src1_sel_o, src2_sel_o);

	input [5-1:0] EXE_instr19_15, EXE_instr24_20, MEM_instr11_7, WB_instr11_7;
	input  MEM_WBControl, WB_Control;
	output reg [2-1:0] src1_sel_o, src2_sel_o;

// always @(*) begin
// 	if (MEM_WBControl && MEM_instr11_7 != 0 && MEM_instr11_7 == EXE_instr19_15) src1_sel_o = 2'b10;
// 	else if (WB_Control && WB_instr11_7 != 0 && WB_instr11_7 == EXE_instr19_15 &&
// 		~(MEM_WBControl && MEM_instr11_7 != 0) && MEM_instr11_7 != EXE_instr19_15) src1_sel_o = 2'b01;
// 	else src1_sel_o = 2'b00;

// 	if (MEM_WBControl && MEM_instr11_7 != 0 && MEM_instr11_7 == EXE_instr24_20) src2_sel_o = 2'b10;
// 	else if (WB_Control && WB_instr11_7 != 0 && WB_instr11_7 == EXE_instr24_20 &&
// 		!(MEM_WBControl && MEM_instr11_7 != 0) && MEM_instr11_7 != EXE_instr24_20) src2_sel_o = 2'b01;
// 	else src2_sel_o = 2'b00;
// end

always @(*) begin
	if (MEM_WBControl && MEM_instr11_7 != 0 && MEM_instr11_7 == EXE_instr19_15) src1_sel_o = 2'b10;
	else if (WB_Control && WB_instr11_7 != 0 && WB_instr11_7 == EXE_instr19_15) src1_sel_o = 2'b01;
	else src1_sel_o = 2'b00;

	if (MEM_WBControl && MEM_instr11_7 != 0 && MEM_instr11_7 == EXE_instr24_20) src2_sel_o = 2'b10;
	else if (WB_Control && WB_instr11_7 != 0 && WB_instr11_7 == EXE_instr24_20) src2_sel_o = 2'b01;
	else src2_sel_o = 2'b00;
end

endmodule
