module Forwarding 
(
  input EX_MEM_RegWrite,
  input MEM_WB_RegWrite,
  input [4:0] EX_MEM_RegisterRd,
  input [4:0] MEM_WB_RegisterRd,
  input [4:0] ID_EX_RegisterRs,
  input [4:0] ID_Ex_RegisterRt,
  output reg [1:0] ForwardA,
  output reg [1:0] ForwardB
);

always @(*) begin
  ForwardA = 2'b00;
  ForwardB = 2'b00;
  /*  EX Hazard */
  if (EX_MEM_RegWrite && 
      EX_MEM_RegisterRd != 5'b0 &&
      EX_MEM_RegisterRd == ID_EX_RegisterRs)
      ForwardA = 2'b10;
  if (EX_MEM_RegWrite &&
      EX_MEM_RegisterRd != 5'b0 &&
      EX_MEM_RegisterRd == ID_Ex_RegisterRt)
      ForwardB = 2'b10;
  /*  Mem Hazard */
  if (MEM_WB_RegWrite &&
      MEM_WB_RegisterRd != 5'b0 &&
      MEM_WB_RegisterRd == ID_EX_RegisterRs)
      ForwardA = 2'b01;
  if (MEM_WB_RegWrite &&
      MEM_WB_RegisterRd != 5'b0 &&
      MEM_WB_RegisterRd == ID_Ex_RegisterRt)
      ForwardB = 2'b01;
end

endmodule