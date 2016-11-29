module Control (
  input [5:0] Op_i,
  output RegDst_o,
  output [1:0] ALUOp_o,
  output ALUSrc_o,
  output RegWrite_o,
  output MemToReg_o,
  output MemWrite_o
);


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

endmodule
