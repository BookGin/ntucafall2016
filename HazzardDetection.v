module HazzardDetection (
    input ID_EX_MemRead,
    input [4:0] IF_ID_RegisterRs,
    input [4:0] IF_ID_RegisterRt,
    input [4:0] ID_EX_RegisterRt,
    ouput PC_Write,
    ouput IF_ID_Write,
    ouput reg data_o
);

always @(*) begin
  data_o      = 1'b0;
  PC_Write    = 1'b0;
  IF_ID_Write = 1'b0;
  if (ID_EX_MemRead &&
     (ID_EX_RegisterRt == IF_ID_RegisterRs || 
      ID_EX_RegisterRt == IF_ID_RegisterRt))
    begin 
      data_o      = 1'b1;
      PC_Write    = 1'b1;
      IF_ID_Write = 1'b1;
    end
end

endmodule