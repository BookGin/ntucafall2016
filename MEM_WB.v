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
   RegWrite_i,
   MemToReg_i
   );

   input clk_i;
   input [31:0]            ALUResult_i, RDData_i;
   output [31:0] 	   ALUResult_o, RDData_o;
   reg [31:0] 	   ALUResult_or, RDData_or;
   assign ALUResult_o = ALUResult_or;
   assign RDData_o =RDData_or;
// Control
   input 		       RegWrite_i;
   input 		       MemToReg_i;

   output RegWrite_o;
   reg RegWrite_or=0;
   output MemToReg_o;
   reg MemToReg_or=0;

   assign RegWrite_o = RegWrite_or;
   assign MemToReg_o = MemToReg_or;

always@(posedge clk_i) begin
   RDData_or <= RDData_i;
   ALUResult_or <= ALUResult_i;

//control
   RegWrite_or <= RegWrite_i;
   MemToReg_or <= MemToReg_i;
end

endmodule
