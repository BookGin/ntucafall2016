`include "Data_Memory.v"
`include "Control.v"
`include "Adder.v"
`include "MUX5.v"
`include "MUX32.v"
`include "PC.v"
`include "Registers.v"
`include "Instruction_Memory.v"
`include "ALU.v"
`include "ALU_Control.v"
`include "Sign_Extend.v"
`include "Shift_Left2.v"

//pipeline registers
`include "IF_ID.v"
`include "ID_EX.v"
`include "EX_MEM.v"
`include "MEM_WB.v"

module CPU (
  input clk_i,
  input rst_i,
  input start_i
);

parameter PC_ADVANCE_NUM = 32'd4;
wire registers_equal = (Registers.RSdata_o == Registers.RTdata_o);
wire pc_src_branch_select = Control.IsBranch_o & registers_equal;

Control Control(
    .Op_i       (IF_ID.inst_o[31:26]),
    .RegDst_o   (),
    .ALUOp_o    (),
    .ALUSrc_o   (),
    .RegWrite_o (),
    .IsBranch_o (),
    .IsJump_o ()
);

Adder Add_PCAdvance(
    .data0_i    (PC.pc_o),
    .data1_i    (PC_ADVANCE_NUM),
    .data_o     ()
);

Shift_Left2 Shift_Left2_Branch(
    .data_i     (Sign_Extend.data_o),
    .data_o     ()
);

Adder Add_PCBranch(
    .data0_i    (IF_ID.pc_o),
    .data1_i    (Shift_Left2_Branch.data_o),
    .data_o     ()
);

MUX32 MUX_PCSrc_Branch(
    .data0_i    (Add_PCAdvance.data_o),
    .data1_i    (Add_PCBranch.data_o),
    .select_i   (pc_src_branch_select),
    .data_o     ()
);

Shift_Left2 Shift_Left2_Jump(
    .data_i     (IF_ID.inst_o),
    .data_o     ()
);

MUX32 MUX_PCSrc_Jump(
    .data0_i    (MUX_PCSrc_Branch.data_o),
    .data1_i    ({Add_PCAdvance.data_o[31:28], Shift_Left2_Jump.data_o[27:0]}),
    .select_i   (Control.IsJump_o),
    .data_o     ()
);

PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (MUX_PCSrc_Jump.data_o),
    .pc_o       ()
);

Instruction_Memory Instruction_Memory(
    .addr_i     (PC.pc_o),
    .instr_o    ()
);

IF_ID IF_ID(
    .clk_i      (clk_i),
    .inst_i     (Instruction_Memory.instr_o),
    .pc_i       (Add_PCAdvance.data_o),
    .inst_o     (),
    .pc_o       ()
);

ID_EX ID_EX(
  .clk_i(clk_i),
  .pc_i(IF_ID.pc_o),
  .inst_i(IF_ID.inst_o),
  .RDData0_i(Registers.RSdata_o),
  .RDData1_i(Registers.RTdata_o),
  .SignExtended_i(Sign_Extend.data_o),
  .RDData0_o(),
  .RDData1_o(),
  .SignExtended_o(),

  //control
  .RegDst_i(Control.RegDst_o),
  .ALUOp_i(Control.ALUOp_o),
  .ALUSrc_i(Control.ALUSrc_o),
  .RegWrite_i(Control.RegWrite_o),
  .MemToReg_i(Control.MemToReg_o),
  .MemWrite_i(Control.MemWrite_o),
  .RegDst_o(),
  .ALUOp_o(),
  .ALUSrc_o(),
  .RegWrite_o(),
  .MemToReg_o(),
  .MemWrite_o()
);

EX_MEM EX_MEM(
  .clk_i(clk_i),
  .pc_i(ID_EX.pc_o),
  .zero_i(ALU.zero_o),
  .ALUResult_i(ALU.data_o),
  .RDData_i(ID_EX.RDData1_o),
  .pc_o(),
  .zero_o(),
  .ALUResult_o(),
  .RDData_o(),
  //control
  .RegWrite_o(),
  .MemToReg_o(),
  .MemWrite_o(),
  .RegWrite_i(ID_EX.RegWrite_o),
  .MemToReg_i(ID_EX.MemToReg_o),
  .MemWrite_i(ID_EX.MemWrite_o)
);

MEM_WB MEM_WB(
  .clk_i(clk_i),
  .RDData_i(Data_Memory.RDdata_o),
  .ALUResult_i(EX_MEM.ALUResult_o),
  .RDData_o(),
  .ALUResult_o(),

//control
  .RegWrite_o(),
  .MemToReg_o(),
  .RegWrite_i(EX_MEM.RegWrite_o),
  .MemToReg_i(EX_MEM.MemToReg_o)

);

Registers Registers(
    .clk_i      (clk_i),
    .RSaddr_i   (IF_ID.inst_o[25:21]),
    .RTaddr_i   (IF_ID.inst_o[20:16]),
    .RDaddr_i   (MUX_RegDst.data_o),
    .RDdata_i   (MUX_MemDst.data_o),
    .RegWrite_i (MEM_WB.RegWrite_o),
    .RSdata_o   (),
    .RTdata_o   ()
);

MUX5 MUX_RegDst(
    .data0_i    (ID_EX.inst_o[20:16]),
    .data1_i    (ID_EX.inst_o[15:11]),
    .select_i   (ID_EX.RegDst_o),
    .data_o     ()
);

MUX32 MUX_ALUSrc(
    .data0_i    (ID_EX.RDData1_o),
    .data1_i    (ID_EX.SignExtended_o),
    .select_i   (ID_EX.ALUSrc_o),
    .data_o     ()
);

Sign_Extend Sign_Extend(
    .data_i     (IF_ID.inst_o[15:0]),
    .data_o     ()
);

ALU ALU(
    .data0_i    (ID_EX.RDData0_o),
    .data1_i    (MUX_ALUSrc.data_o),
    .ALUCtrl_i  (ALU_Control.ALUCtrl_o),
    .data_o     (),
    .zero_o     ()
);

ALU_Control ALU_Control(
    .funct_i    (ID_EX.inst_o[5:0]),
    .ALUOp_i    (ID_EX.ALUOp_o),
    .ALUCtrl_o  ()
);

MUX32 MUX_MemDst(
    .data0_i    (MEM_WB.ALUResult_o),
    .data1_i    (MEM_WB.RDData_o),
    .select_i   (MEM_WB.MemToReg_o),
    .data_o     ()
);

Memory Data_Memory(
  .clk_i(clk_i),
  .RDaddr_i(EX_MEM.ALUResult_o),
  .RDdata_i(EX_MEM.RDData_o),
  .MemWrite_i(EX_MEM.MemWrite_o),
  .MemRead_i(),
  .RDdata_o()
);

endmodule
