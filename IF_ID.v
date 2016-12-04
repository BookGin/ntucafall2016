module IF_ID
  (
   clk_i,
   inst_i,
   pc_i,
   inst_o,
   pc_o,
   //control
   RegDst_o,
   ALUOp_o,
   ALUSrc_o,
   RegWrite_o,
   MemToReg_o,
   MemWrite_o,
   IsBranch_o,
   IsJump_o,
   RegDst_i,
   ALUOp_i,
   ALUSrc_i,
   RegWrite_i,
   MemToReg_i,
   MemWrite_i,
   IsBranch_i,
   IsJump_o  
   );
   
   input clk_i;
   input [31:0] 	       inst_i, pc_i;
   output reg [31:0] 	       inst_o = 32'd0, pc_o =32'd0;
 
   // Control 
   input 		       RegDst_i;
   input [1:0] 		       ALUOp_i;
   input 		       ALUSrc_i;
   input 		       RegWrite_i;
   input 		       MemToReg_i;
   input 		       MemWrite_i;
   input 		       IsBranch_i;
   input 		       IsJump_i;

   output reg 		       RegDst_o;
   output reg [1:0] 	       ALUOp_o;
   output reg 		       ALUSrc_o;
   output reg 		       RegWrite_o;
   output reg 		       MemToReg_o;
   output reg 		       MemWrite_o;
   output reg 		       IsBranch_o;
   output reg 		       IsJump_o;
   
always@(posedge clk_i) begin
   inst_o = inst_i;
   pc_o = pc_i;

   //control
   RegDst_o <= RegDst_i;
   ALUOp_o <= ALUOp_i;
   ALUSrc_o <= ALUSrc_i;
   RegWrite_o <= RegWrite_i;
   MemToReg_o <= MemToReg_i;
   MemWrite_o <= MemWrite_i;
   IsBranch_o <= IsBranch_i;
   IsJump_o <= IsJump_i;

end
endmodule
