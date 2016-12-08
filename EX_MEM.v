module EX_MEM
  (
   clk_i,
   pc_i,
   zero_i,
   ALUResult_i,
   RDData_i,
   RDaddr_i,
   RDaddr_o,
   pc_o,
   zero_o,
   ALUResult_o,
   RDData_o,
//control
   RegWrite_o,
   MemToReg_o,
   MemWrite_o,
   RegWrite_i,
   MemToReg_i,
   MemWrite_i
   );

   input [4:0] RDaddr_i;
   output reg [4:0] RDaddr_o = 0;

   input clk_i, zero_i;
   input [31:0] 	       pc_i, ALUResult_i, SignExtended_i, RDData_i;
   output [31:0] 	       pc_o, ALUResult_o, SignExtended_o, RDData_o;
   output reg [31:0] 	       pc_or=0, ALUResult_or=0, SignExtended_or=0, RDData_or=0;
   output zero_o;
   reg zero_or=0;
   assign zero_o = zero_or;
   assign pc_o = pc_or;
   assign ALUResult_o = ALUResult_or;
   assign SignExtended_o =SignExtended_or;
   assign RDData_o = RDData_or;
// Control
input 		       RegWrite_i;
input 		       MemToReg_i;
input 		       MemWrite_i;

output RegWrite_o;
reg RegWrite_or=0;
output MemToReg_o;
reg MemToReg_or=0;
output MemWrite_o;
reg MemWrite_or=0;

assign RegWrite_o = RegWrite_or;
assign MemToReg_o = MemToReg_or;
assign MemWrite_o = MemWrite_or;

always@(posedge clk_i) begin
   ALUResult_or <= ALUResult_i;
   SignExtended_or <= SignExtended_i;
   pc_or <= pc_i;
   zero_or <= zero_i;
   RDData_or <= RDData_i;

   RDaddr_o <= RDaddr_i;
//control
  RegWrite_or <= RegWrite_i;
  MemToReg_or <= MemToReg_i;
  MemWrite_or <= MemWrite_i;
end

endmodule
