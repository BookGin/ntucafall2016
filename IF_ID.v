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
    output [31:0] inst_o, pc_o;
    reg [31:0] inst_or = 32'd0, pc_or =32'd0;
    assign inst_o = inst_or;
    assign pc_o = pc_or;

    always@(posedge clk_i) begin
    inst_or <= inst_i;
    pc_or <= pc_i;

    end
    endmodule
