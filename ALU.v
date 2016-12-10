module ALU (
  input [31:0] data0_i,
  input [31:0] data1_i,
  input [2:0] ALUCtrl_i,
  output [31:0] data_o,
  output zero_o
);

parameter ADD = 3'b000;
parameter SUB = 3'b001;
parameter MUL = 3'b010;
parameter AND = 3'b011;
parameter OR  = 3'b100;

parameter INVALID_OP = ADD;
// In MIPS structure, NOOP (0x00000000) represents SLL $0, $0, 0, but in this project,
// since we don't implement SLL, we have to guarantee NOOP has no side effects. Thus,
// we are absuing the fact that the invalid opperations will cause ALU output zero.

assign data_o = (
  (ALUCtrl_i == ADD) ? data0_i + data1_i :
  (ALUCtrl_i == SUB) ? data0_i - data1_i :
  (ALUCtrl_i == MUL) ? data0_i * data1_i :
  (ALUCtrl_i == AND) ? data0_i & data1_i :
  (ALUCtrl_i == OR) ? data0_i | data1_i :
  32'd0
);
assign zero_o = (data_o == 0) ? 1 : 0;

always @* begin
  $display("ALU: a=%d, b=%d, aluctl=%b, result=%d", data0_i, data1_i, ALUCtrl_i, data_o);
end

endmodule
