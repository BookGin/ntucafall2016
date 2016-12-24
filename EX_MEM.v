module EX_MEM
  (
   input 	     clk_i,
   input [31:0]      pc_i,
   input 	     zero_i,
   input [31:0]      ALUResult_i,
   input [31:0]      RDData_i,
   input [4:0] 	     RDaddr_i,
   input         stall_i,
   output reg [31:0] pc_o = 32'd0,
   output reg        zero_o = 1'b0,
   output reg [31:0] ALUResult_o = 32'd0,
   output reg [31:0] RDData_o = 32'd0,
   output reg [4:0]  RDaddr_o = 5'd0,
   
   //control
   input 	     RegWrite_i,
   input 	     MemToReg_i,
   input 	     MemRead_i,
   input 	     MemWrite_i,
   output 	     RegWrite_o,
   output 	     MemToReg_o,
   output 	     MemRead_o,
   output 	     MemWrite_o
   );

   reg 		     RegWrite_or=0;
   reg 		     MemToReg_or=0;
   reg 		     MemRead_or=0;
   reg 		     MemWrite_or=0;

   assign RegWrite_o = RegWrite_or;
   assign MemToReg_o = MemToReg_or;
   assign MemRead_o = MemRead_or;
   assign MemWrite_o = MemWrite_or;

   always@(posedge clk_i) begin
      if (stall_i) begin
      end
      else begin
         pc_o <= pc_i;
         zero_o <= zero_i;
         RDaddr_o <= RDaddr_i;
         ALUResult_o <= ALUResult_i;
         RDData_o <= RDData_i;
         //control
         RegWrite_or <= RegWrite_i;
         MemToReg_or <= MemToReg_i;
         MemRead_or <= MemRead_i;
         MemWrite_or <= MemWrite_i;
      end
      
   end

endmodule
