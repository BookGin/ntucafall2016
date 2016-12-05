module IF_ID
(
  clk_i,
  inst_i,
  pc_i,
  inst_o,
  pc_o
  );

  input clk_i;
  input [31:0]  inst_i, pc_i;
  output reg [31:0] inst_o = 32'd0, pc_o =32'd0;

  always@(posedge clk_i) begin
  inst_o = inst_i;
  pc_o = pc_i;


  end
  endmodule
