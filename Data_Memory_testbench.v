`define CYCLE_TIME 50
`include "Data_Memory.v"
module TestBench;

reg                Clk;
reg     [31:0]      addr_input;
reg     [31:0]     data_input;
wire   [31:0] data_output;
reg                mw_input;
reg                mr_input;
integer            i, outfile, counter;

always #(`CYCLE_TIME/2) Clk = ~Clk;

Memory Data_Memory(
    .clk_i  (Clk),
    .RDaddr_i(addr_input),
    .RDdata_i(data_input),
    .MemWrite_i(mw_input),
    .MemRead_i(mr_input),
    .RDdata_o(data_output)
);
initial begin
  Clk = 0;
  for(i=0; i<32; i=i+1) begin
      Data_Memory.memory[i] = 8'b0;
  end
  $dumpfile("memory.vcd");
  $dumpvars;
   outfile = $fopen("output.txt") | 1;
    addr_input = 5'd0;
    data_input = 31'd10;
    mw_input  = 1;
    mr_input = 1;
    $fdisplay(outfile, "Registers");
    $fdisplay(outfile, "Data Memory: 0x00 = %d", {Data_Memory.memory[3] , Data_Memory.memory[2] , Data_Memory.memory[1] , Data_Memory.memory[0] });
   $fdisplay(outfile, "Data Memory: 0x04 = %d", {Data_Memory.memory[7] , Data_Memory.memory[6] , Data_Memory.memory[5] , Data_Memory.memory[4] });
   $fdisplay(outfile, "Data Memory: 0x08 = %d", {Data_Memory.memory[11], Data_Memory.memory[10], Data_Memory.memory[9] , Data_Memory.memory[8] });
   $fdisplay(outfile, "Data Memory: 0x0c = %d", {Data_Memory.memory[15], Data_Memory.memory[14], Data_Memory.memory[13], Data_Memory.memory[12]});
   $fdisplay(outfile, "Data Memory: 0x10 = %d", {Data_Memory.memory[19], Data_Memory.memory[18], Data_Memory.memory[17], Data_Memory.memory[16]});
   $fdisplay(outfile, "Data Memory: 0x14 = %d", {Data_Memory.memory[23], Data_Memory.memory[22], Data_Memory.memory[21], Data_Memory.memory[20]});
   $fdisplay(outfile, "Data Memory: 0x18 = %d", {Data_Memory.memory[27], Data_Memory.memory[26], Data_Memory.memory[25], Data_Memory.memory[24]});
   $fdisplay(outfile, "Data Memory: 0x1c = %d", {Data_Memory.memory[31], Data_Memory.memory[30], Data_Memory.memory[29], Data_Memory.memory[28]});

    #`CYCLE_TIME
    addr_input = 31'd4;
    data_input = 31'd10;
    mw_input  = 1;
    mr_input = 1;

  $fdisplay(outfile, "Registers");
  $fdisplay(outfile, "Data Memory: 0x00 = %d", {Data_Memory.memory[3] , Data_Memory.memory[2] , Data_Memory.memory[1] , Data_Memory.memory[0] });
   $fdisplay(outfile, "Data Memory: 0x04 = %d", {Data_Memory.memory[7] , Data_Memory.memory[6] , Data_Memory.memory[5] , Data_Memory.memory[4] });
   $fdisplay(outfile, "Data Memory: 0x08 = %d", {Data_Memory.memory[11], Data_Memory.memory[10], Data_Memory.memory[9] , Data_Memory.memory[8] });
   $fdisplay(outfile, "Data Memory: 0x0c = %d", {Data_Memory.memory[15], Data_Memory.memory[14], Data_Memory.memory[13], Data_Memory.memory[12]});
   $fdisplay(outfile, "Data Memory: 0x10 = %d", {Data_Memory.memory[19], Data_Memory.memory[18], Data_Memory.memory[17], Data_Memory.memory[16]});
   $fdisplay(outfile, "Data Memory: 0x14 = %d", {Data_Memory.memory[23], Data_Memory.memory[22], Data_Memory.memory[21], Data_Memory.memory[20]});
   $fdisplay(outfile, "Data Memory: 0x18 = %d", {Data_Memory.memory[27], Data_Memory.memory[26], Data_Memory.memory[25], Data_Memory.memory[24]});
   $fdisplay(outfile, "Data Memory: 0x1c = %d", {Data_Memory.memory[31], Data_Memory.memory[30], Data_Memory.memory[29], Data_Memory.memory[28]});


    #`CYCLE_TIME

    addr_input = 31'd8;
    data_input = 31'd10;
    mw_input  = 1;
    mr_input = 1;
    $fdisplay(outfile, "Registers");
    $fdisplay(outfile, "Data Memory: 0x00 = %d", {Data_Memory.memory[3] , Data_Memory.memory[2] , Data_Memory.memory[1] , Data_Memory.memory[0] });
   $fdisplay(outfile, "Data Memory: 0x04 = %d", {Data_Memory.memory[7] , Data_Memory.memory[6] , Data_Memory.memory[5] , Data_Memory.memory[4] });
   $fdisplay(outfile, "Data Memory: 0x08 = %d", {Data_Memory.memory[11], Data_Memory.memory[10], Data_Memory.memory[9] , Data_Memory.memory[8] });
   $fdisplay(outfile, "Data Memory: 0x0c = %d", {Data_Memory.memory[15], Data_Memory.memory[14], Data_Memory.memory[13], Data_Memory.memory[12]});
   $fdisplay(outfile, "Data Memory: 0x10 = %d", {Data_Memory.memory[19], Data_Memory.memory[18], Data_Memory.memory[17], Data_Memory.memory[16]});
   $fdisplay(outfile, "Data Memory: 0x14 = %d", {Data_Memory.memory[23], Data_Memory.memory[22], Data_Memory.memory[21], Data_Memory.memory[20]});
   $fdisplay(outfile, "Data Memory: 0x18 = %d", {Data_Memory.memory[27], Data_Memory.memory[26], Data_Memory.memory[25], Data_Memory.memory[24]});
   $fdisplay(outfile, "Data Memory: 0x1c = %d", {Data_Memory.memory[31], Data_Memory.memory[30], Data_Memory.memory[29], Data_Memory.memory[28]});


    #`CYCLE_TIME

    addr_input = 31'd12;
    data_input = 31'd10;
    mw_input  = 0;
    mr_input = 1;
    $fdisplay(outfile, "Registers");
    $fdisplay(outfile, "Data Memory: 0x00 = %d", {Data_Memory.memory[3] , Data_Memory.memory[2] , Data_Memory.memory[1] , Data_Memory.memory[0] });
   $fdisplay(outfile, "Data Memory: 0x04 = %d", {Data_Memory.memory[7] , Data_Memory.memory[6] , Data_Memory.memory[5] , Data_Memory.memory[4] });
   $fdisplay(outfile, "Data Memory: 0x08 = %d", {Data_Memory.memory[11], Data_Memory.memory[10], Data_Memory.memory[9] , Data_Memory.memory[8] });
   $fdisplay(outfile, "Data Memory: 0x0c = %d", {Data_Memory.memory[15], Data_Memory.memory[14], Data_Memory.memory[13], Data_Memory.memory[12]});
   $fdisplay(outfile, "Data Memory: 0x10 = %d", {Data_Memory.memory[19], Data_Memory.memory[18], Data_Memory.memory[17], Data_Memory.memory[16]});
   $fdisplay(outfile, "Data Memory: 0x14 = %d", {Data_Memory.memory[23], Data_Memory.memory[22], Data_Memory.memory[21], Data_Memory.memory[20]});
   $fdisplay(outfile, "Data Memory: 0x18 = %d", {Data_Memory.memory[27], Data_Memory.memory[26], Data_Memory.memory[25], Data_Memory.memory[24]});
   $fdisplay(outfile, "Data Memory: 0x1c = %d", {Data_Memory.memory[31], Data_Memory.memory[30], Data_Memory.memory[29], Data_Memory.memory[28]});


    #`CYCLE_TIME

    $finish;
  end


endmodule
