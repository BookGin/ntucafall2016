module EX_MEM
  (
   clk_i,
   pc_i,
   zero_i,
   ALUResult_i,
   pc_o,
   zero_o,
   ALUResult_o,

//control
   RegWrite_o,
   MemToReg_o,
   MemWrite_o,
   IsBranch_o,
   IsJump_o,
   RegWrite_i,
   MemToReg_i,
   MemWrite_i,
   IsBranch_i,
   IsJump_o
   );

   input clk_i, zero_i;
   input [31:0] 	       pc_i, ALUResult_i, SignExtended_i;
   output reg [31:0] 	       pc_o, ALUResult_o, SignExtended_o;
   output zero_o;
   reg zero_or=0;
   assign zero_o = zero_or;

// Control
input 		       RegWrite_i;
input 		       MemToReg_i;
input 		       MemWrite_i;
input 		       IsBranch_i;
input 		       IsJump_i;

output RegWrite_o;
reg RegWrite_or=0;
output MemToReg_o;
reg MemToReg_or=0;
output MemWrite_o;
reg MemWrite_or=0;
output IsBranch_o;
reg IsBranch_or=0;
output  IsJump_o;
reg IsJump_or=0;

assign RegWrite_o = RegWrite_or;
assign MemToReg_o = MemToReg_or;
assign MemWrite_o = MemWrite_or;
assign IsBranch_o = IsBranch_or;
assign IsJump_o = IsJump_or;

always@(posedge clk_i) begin
   ALUResult_o <= ALUResult_i;
   SignExtended_o <= SignExtended_i;
   pc_o <= pc_i;
   zero_or <= zero_i;

//control
  RegWrite_or <= RegWrite_i;
  MemToReg_or <= MemToReg_i;
  MemWrite_or <= MemWrite_i;
  IsBranch_or <= IsBranch_i;
  IsJump_or <= IsJump_i;
end

endmodule
