module MUX_Forward (
	input [31:0] data0_i,
	input [31:0] data1_i,
	input [31:0] data2_i,
	input [1:0] IsForward_i,
	output [31:0] data_o,
);

reg [31:0] data_o;

always @(*) begin
	case (IsForward_i)
		2'b00: data_o = data0_i;
		2'b01: data_o = data1_i;
		2'b10: data_o = data2_i;
		default: data_o = data0_i;
	endcase
end

endmodule