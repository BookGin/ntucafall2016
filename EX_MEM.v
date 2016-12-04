module EX_MEM
  (
   clk_i,
   pc_i,
   zero_i,
   AddResult_i,
   ALUResult_i,
   pc_o,
   zero_o,
   AddResult_o,

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
   input [31:0] 	       pc_i, AddResult_i, ALUResult_i, SignExtended_i;
   output reg [31:0] 	       pc_o, AddResult_o, ALUResult_o, SignExtended_o;
   output reg zero_o;

// Control
   input 		       RegWrite_i;
   input 		       MemToReg_i;
   input 		       MemWrite_i;
   input 		       IsBranch_i;
   input 		       IsJump_i;

   
   output reg 		       RegWrite_o;
   output reg 		       MemToReg_o;
   output reg 		       MemWrite_o;
   output reg 		       IsBranch_o;
   output reg 		       IsJump_o;

always@(posedge clk_i) begin
   AddResult_o <= AddResult_i;
   ALUResult_o <= ALUResult_i;
   SignExtended_o <= SignExtended_i;
   pc_o <= pc_i;
   zero_o <= zero_i;
   
//control
   RegWrite_o <= RegWrite_i;
   MemToReg_o <= MemToReg_i;
   MemWrite_o <= MemWrite_i;
   IsBranch_o <= IsBranch_i;
   IsJump_o <= IsJump_i;
end

endmodule
