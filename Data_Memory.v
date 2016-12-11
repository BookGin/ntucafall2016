module Memory
(
    clk_i,
    RDaddr_i,
    RDdata_i,
    MemRead_i,
    MemWrite_i,
    RDdata_o
);

// Ports
input               clk_i;
input   [31:0]       RDaddr_i;
input   [31:0]      RDdata_i;
input               MemRead_i;
input               MemWrite_i;
output   [31:0]      RDdata_o;

// Register File
reg     [7:0]      memory        [0:31];

// Read Data
assign RDdata_o = {memory[RDaddr_i+3], memory[RDaddr_i+2], memory[RDaddr_i+1], memory[RDaddr_i]};
// Write Data
always@(posedge clk_i) begin
    if(MemWrite_i) begin
        memory[RDaddr_i+3] <= RDdata_i[31:24];
        memory[RDaddr_i+2] <= RDdata_i[23:16];
        memory[RDaddr_i+1] <= RDdata_i[15:8];
        memory[RDaddr_i] <= RDdata_i[7:0];
    end
end

endmodule
