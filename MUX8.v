module MUX8 (
	input [7:0] data_i,
	input IsHazzard_i,
	output [7:0] data_o
);

assign data_o = (IsHazzard_i)? 7'b0 : data_i;

endmodule
