module ALU_Control (
  input [5:0] funct_i,
  input [1:0] ALUOp_i,
  output [2:0] ALUCtrl_o
);

parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter MUL = 6'b011000;
parameter AND = 6'b100100;
parameter OR  = 6'b100101;

wire [2:0] alu_rtype_op;
wire [2:0] alu_itype_op;

assign alu_rtype_op = (
  (funct_i == ADD) ? ALU.ADD :
  (funct_i == SUB) ? ALU.SUB :
  (funct_i == MUL) ? ALU.MUL :
  (funct_i == AND) ? ALU.AND :
  (funct_i == OR) ? ALU.OR :
  0
);

parameter ADDI = 2'b01;
parameter SUBI = 2'b10; //not yet implement
assign alu_itype_op = (ALUOp_i == ADDI) ? ALU.ADD : 0;

assign ALUCtrl_o = alu_itype_op ? alu_itype_op : alu_rtype_op;

endmodule
