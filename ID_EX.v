module ID_EX
  (
   input 	     clk_i,
   input [31:0]      inst_i,
   input [31:0]      pc_i,
   input [31:0]      RDData0_i,
   input [31:0]      RDData1_i,
   input [31:0]      SignExtended_i,
   input         stall_i,
   output reg [31:0] RDData0_o = 32'd0,
   output reg [31:0] RDData1_o = 32'd0,
   output reg [31:0] SignExtended_o = 32'd0,
   output reg [31:0] inst_o = 32'd0,
   output reg [31:0] pc_o = 32'd0,
		 //control
   input 	     RegDst_i,
   input [1:0] 	     ALUOp_i,
   input 	     ALUSrc_i,
   input 	     RegWrite_i,
   input 	     MemToReg_i,
   input 	     MemRead_i,
   input 	     MemWrite_i,
   output 	     RegDst_o,
   output [1:0]      ALUOp_o,
   output 	     ALUSrc_o,
   output 	     RegWrite_o,
   output 	     MemToReg_o,
   output 	     MemRead_o,
   output 	     MemWrite_o
   );

   // Control
   reg 		 RegDst_or =0;
   reg [1:0] 	 ALUOp_or=2'd0;
   reg 		 ALUSrc_or=0;
   reg 		 RegWrite_or=0;
   reg 		 MemToReg_or=0;
   reg 		 MemRead_or=0;
   reg 		 MemWrite_or=0;

   assign RegDst_o = RegDst_or;
   assign ALUOp_o = ALUOp_or;
   assign ALUSrc_o = ALUSrc_or;
   assign RegWrite_o = RegWrite_or;
   assign MemToReg_o = MemToReg_or;
   assign MemRead_o = MemRead_or;
   assign MemWrite_o = MemWrite_or;



   always@(posedge clk_i) begin
      if (stall_i) begin
      end
      else begin
         RDData0_o <= RDData0_i;
         RDData1_o <= RDData1_i;
         SignExtended_o <= SignExtended_i;
         pc_o <= pc_i;
         inst_o <= inst_i;
         //control
         RegDst_or <= RegDst_i;
         ALUOp_or <= ALUOp_i;
         ALUSrc_or <= ALUSrc_i;
         RegWrite_or <= RegWrite_i;
         MemToReg_or <= MemToReg_i;
         MemRead_or <= MemRead_i;
         MemWrite_or <= MemWrite_i;
      end
      
   end

endmodule
