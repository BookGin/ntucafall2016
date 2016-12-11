module HazzardDetection (
    input ID_EX_MemRead_i,
    input [4:0] IF_ID_RegisterRs,
    input [4:0] IF_ID_RegisterRt,
    input [4:0] ID_EX_RegisterRt,
    ouput PC_Write,
    ouput IF_ID_Write,
    ouput data_o
);

assign data_o = (
  (ID_EX_MemRead &&
    (ID_EX_RegisterRt == IF_ID_RegisterRs ||
     ID_EX_RegisterRt == IF_ID_RegisterRt))? 1'b1 :
  1'b0
);

assign PC_Write = data_o;
assign IF_ID_Write = data_o;

endmodule