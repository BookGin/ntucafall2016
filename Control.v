module Control (
  input [5:0] Op_i, 
  output RegDst_o, 
  output [1:0] ALUOp_o,
  output ALUSrc_o,
  output RegWrite_o
);

assign is_itype = Op_i[3];
assign ALUSrc_o = is_itype;
assign RegDst_o = ~ is_itype;
assign ALUOp_o = is_itype ? ALU_Control.ADDI : 0;
assign RegWrite_o = 1;

endmodule
