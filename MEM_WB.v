module MEM_WB
  (
   clk_i,
   RDData_i,
   ALUResult_i,
   RDData_o,
   ALUResult_o,

//control
   RegWrite_o,
   MemToReg_o,
   MemWrite_o,
   IsBranch_o,
   IsJump_o,
   RegWrite_i,
   MemToReg_i,
   );
   
   input clk_i, zero_i;
   input [31:0]            ALUResult_i, RDData_i;
   output reg [31:0] 	   ALUResult_o, RDData_o;
   output reg 		   zero_o;
   
// Control
   input 		       RegWrite_i;
   input 		       MemToReg_i;
   input 		       MemWrite_i;
   input 		       IsBranch_i;
   input 		       IsJump_i;

   
   output reg 		       RegWrite_o;
   output reg 		       MemToReg_o;
   
always@(posedge clk_i) begin
   RDData_o <= RDData_i;
   ALUResult_o <= ALUResult_i;

//control
   RegWrite_o <= RegWrite_i;
   MemToReg_o <= MemToReg_i;
end

endmodule
