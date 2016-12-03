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
module CPU
(
    clk_i,
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;

wire [31:0] ins;
wire [31:0] pc;

parameter PC_ADVANCE_NUM = 32'd4;
wire [31:0] pc_advanced;
wire [31:0] sign_extended_immed;
wire pc_src_branch_select = Control.IsBranch_o & ALU.zero_o;

Control Control(
    .Op_i       (ins[31:26]),
    .RegDst_o   (MUX_RegDst.select_i),
    .ALUOp_o    (ALU_Control.ALUOp_i),
    .ALUSrc_o   (MUX_ALUSrc.select_i),
    .RegWrite_o (Registers.RegWrite_i),
    .IsBranch_o (),
    .IsJump_o ()
);

Adder Add_PCAdvance(
    .data0_i    (pc),
    .data1_i    (PC_ADVANCE_NUM),
    .data_o     (pc_advanced)
);

Shift_Left2 Shift_Left2_Branch(
    .data_i     (sign_extended_immed),
    .data_o     ()
);

Adder Add_PCBranch(
    .data0_i    (pc_advanced),
    .data1_i    (Shift_Left2_Branch.data_o),
    .data_o     ()
);

MUX32 MUX_PCSrc_Branch(
    .data0_i    (pc_advanced),
    .data1_i    (Add_PCBranch.data_o),
    .select_i   (pc_src_branch_select),
    .data_o     ()
);

Shift_Left2 Shift_Left2_Jump(
    .data_i     (ins),
    .data_o     ()
);

MUX32 MUX_PCSrc_Jump(
    .data0_i    (MUX_PCSrc_Branch.data_o),
    .data1_i    ({pc_advanced[31:28], Shift_Left2_Jump.data_o[27:0]}),
    .select_i   (Control.IsJump_o),
    .data_o     ()
);

PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (MUX_PCSrc_Jump.data_o),
    .pc_o       (pc)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (pc),
    .instr_o    (ins)
);

Registers Registers(
    .clk_i      (clk_i),
    .RSaddr_i   (ins[25:21]),
    .RTaddr_i   (ins[20:16]),
    .RDaddr_i   (MUX_RegDst.data_o),
    .RDdata_i   (MUX_MemDst.data_o),
    .RegWrite_i (),
    .RSdata_o   (ALU.data0_i),
    .RTdata_o   (MUX_ALUSrc.data0_i)
);

MUX5 MUX_RegDst(
    .data0_i    (ins[20:16]),
    .data1_i    (ins[15:11]),
    .select_i   (),
    .data_o     ()
);

MUX32 MUX_ALUSrc(
    .data0_i    (),
    .data1_i    (sign_extended_immed),
    .select_i   (),
    .data_o     (ALU.data1_i)
);

Sign_Extend Sign_ExtendALU(
    .data_i     (ins[15:0]),
    .data_o     (sign_extended_immed)
);

ALU ALU(
    .data0_i    (),
    .data1_i    (),
    .ALUCtrl_i  (),
    .data_o     (),
    .zero_o     ()
);

ALU_Control ALU_Control(
    .funct_i    (ins[5:0]),
    .ALUOp_i    (),
    .ALUCtrl_o  (ALU.ALUCtrl_i)
);

MUX32 MUX_MemDst(
    .data0_i    (ALU.data_o),
    .data1_i    (Data_Memory.RDdata_o),
    .select_i   (Control.MemToReg_o),
    .data_o     ()
  );

Memory Data_Memory(
  .clk_i(clk_i),
  .RDaddr_i(ALU.data_o),
  .RDdata_i(Registers.RTdata_o),
  .MemWrite_i(Control.MemWrite_o),
  .MemRead_i(),
  .RDdata_o()
  );

endmodule
