module HazzardDetection(
	input[15:0],
	input[2:0] ex_rd,
	input mem_rd,
	input wb_rd,
	input ex_wb_en,
	input mem_wb_en,
	input wb_wb_en,
	output pc_en,
	output if_id_en,
	output id_ex_regs_sel
);

parameter R_TYPE = 6'b000000; // add, sub, mul, and, or
parameter ADDI= 6'b001000;
parameter LW  = 6'b100011;
parameter SW  = 6'b101011;
parameter BEQ = 6'b000100;
parameter JMP = 6'b000010;

wire need_stall;

wire[3:0] opcode;
wire[2:0] rs1, rs2;

assign opcode = inst[15:12];

assign rs1 = (
	(opcode <= 'b1001)? (inst[8:6]) : 
	(opcode == 'b1011)? (inst[11:9]) : 
	(opcode == 'b1100)? (inst[8:6]) :
	0
);

assign rs2 = (
	(opcode <= 'b1000)? (inst[5:3]) :
	(opcode == 'b1001)? (0) :
	(opcode == 'b1011 || opcode == 'b1010) ? (inst[8:6]) :
	0;
)

assign need_stall = (
	(rs1 != 0) && (((rs1 == ex_rd) && ex_wb_en) || ((rs1 == mem_rd) && mem_wb_en) || ((rs1 == wb_rd) && wb_wb_en))) || ((rs2 != 0) && (((rs2 == ex_rd) && ex_wb_en) || ((rs2 == mem_rd) && mem_wb_en) || ((rs2 == wb_rd) && wb_wb_en)));

assign pc_en = ~need_stall;
assign if_id_en = ~need_stall;
assign id_ex_regs_rel = need_stall;

endmodule;