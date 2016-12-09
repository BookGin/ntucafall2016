module ID_EX
  (
   clk_i,
   inst_i,
   pc_i,
   RDData0_i,
   RDData1_i,
   SignExtended_i,
   RDData0_o,
   RDData1_o,
   SignExtended_o,
   inst_o,
   pc_o,
   //control
   RegDst_o,
   ALUOp_o,
   ALUSrc_o,
   RegWrite_o,
   MemToReg_o,
   MemWrite_o,
   RegDst_i,
   ALUOp_i,
   ALUSrc_i,
   RegWrite_i,
   MemToReg_i,
   MemWrite_i
   );

   input clk_i;
   input [31:0] inst_i, pc_i, RDData0_i, RDData1_i, SignExtended_i;
   output [31:0] inst_o, pc_o, RDData0_o, RDData1_o, SignExtended_o;
   reg [31:0] 	 inst_or= 32'd0, pc_or=32'd0, RDData0_or=32'd0, RDData1_or=32'd0, SignExtended_or=32'd0;

   assign inst_o =inst_or;
   assign pc_o = pc_or;
   assign RDData0_o = RDData0_or;
   assign RDData1_o = RDData1_or;
   assign SignExtended_o = SignExtended_or;


   // Control
   input 	 RegDst_i;
   input [1:0] 	 ALUOp_i;
   input 	 ALUSrc_i;
   input 	 RegWrite_i;
   input 	 MemToReg_i;
   input 	 MemWrite_i;
   input 	 IsBranch_i;
   input 	 IsJump_i;

   output 	 RegDst_o;
   reg 		 RegDst_or =0;
   output [1:0]  ALUOp_o;
   reg [1:0] 	 ALUOp_or=2'd0;

   output 	 ALUSrc_o;
   reg 		 ALUSrc_or=0;
   output 	 RegWrite_o;
   reg 		 RegWrite_or=0;
   output 	 MemToReg_o;
   reg 		 MemToReg_or=0;
   output 	 MemWrite_o;
   reg 		 MemWrite_or=0;


   assign RegDst_o = RegDst_or;
   assign ALUOp_o = ALUOp_or;
   assign ALUSrc_o = ALUSrc_or;
   assign RegWrite_o = RegWrite_or;
   assign MemToReg_o = MemToReg_or;
   assign MemWrite_o = MemWrite_or;


   always@(posedge clk_i) begin
      RDData0_or <= RDData0_i;
      RDData1_or <= RDData1_i;
      SignExtended_or <= SignExtended_i;
      pc_or <= pc_i;
      inst_or <= inst_i;
      //control
      RegDst_or <= RegDst_i;
      ALUOp_or <= ALUOp_i;
      ALUSrc_or <= ALUSrc_i;
      RegWrite_or <= RegWrite_i;
      MemToReg_or <= MemToReg_i;
      MemWrite_or <= MemWrite_i;
   end

endmodule
