module Control (
  input [5:0] Op_i,
  output RegDst_o,
  output [1:0] ALUOp_o,
  output ALUSrc_o,
  output RegWrite_o,
  output MemToReg_o,
  output MemWrite_o,
  output IsBranch_o,
  output IsJump_o 
);

parameter AND = 6'b000000;
parameter OR  = 6'b000000;
parameter ADD = 6'b000000;
parameter SUB = 6'b000000;
parameter MUL = 6'b000000;
parameter ADDI= 6'b001000;
parameter LW  = 6'b100011;
parameter SW  = 6'b101011;
parameter BEQ = 6'b000100;
parameter JMP = 6'b000010;

assign is_itype = Op_i[3];
assign ALUSrc_o = is_itype;
assign RegDst_o = ~ is_itype;
//we need add if it is i type or lw or sw
assign ALUOp_o = ((Op_i == 6'b000000) ? 0 :
                 (Op_i == 6'b001000) ? ALU_Control.SUB : ALU_Control.ADD);
assign RegWrite_o = (Op_i == 6'b101011) ? 0 : 1;
// if it's sw
assign MemWrite_o = (Op_i == 6'b101011) ? 1 : 0;
// if it's lw
assign MemToReg_o = (Op_i == 6'b100011) ? 1 : 0;

// if it's a branch instrution
assign IsBranch_o = (Op_i == BEQ);
assign IsJump_o = (Op_i == JMP);

endmodule
