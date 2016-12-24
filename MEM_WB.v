module MEM_WB
  (
   input 	     clk_i,
   input [31:0]      RDData_i,
   input [31:0]      ALUResult_i,
   input [4:0]      RDaddr_i,
   input         stall_i,
   output reg [4:0] RDaddr_o=5'd0,
   output reg [31:0] RDData_o=32'd0,
   output reg [31:0] ALUResult_o=32'd0,

		     //control
   output 	     RegWrite_o,
   output 	     MemToReg_o,
   input 	     RegWrite_i,
   input 	     MemToReg_i
   );


   // Control
   reg 		    RegWrite_or=0;
   reg 		    MemToReg_or=0;

   assign RegWrite_o = RegWrite_or;
   assign MemToReg_o = MemToReg_or;

   always@(posedge clk_i) begin
      if (stall_i) begin
      end
      else begin
         RDData_o <= RDData_i;
         ALUResult_o <= ALUResult_i;
         RDaddr_o <= RDaddr_i;

         //control
         RegWrite_or <= RegWrite_i;
         MemToReg_or <= MemToReg_i;
      end   
   end

endmodule
