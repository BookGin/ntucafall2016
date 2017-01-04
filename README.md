#  Pipelined MIPS CPU + L1 Cache in Verilog

This the project of Computer Architecture 2016 Fall, NTU.

- Tag Project 1: Pipelined MIPS CPU in Verilog
- Tag Project 2: L1 Cache

For more details, please refer to `report` directory.

## Support MIPS Instructions
- and, or
- add, sub, mul,
- addi
- lw, sw
- beq, j

## Features
#### Hazard handling
Handle data hazard and control hazard with stalls or forwarding

#### Cache
L1 data cache

## Environment
|      Type      |         Value          |        Version        |
| :------------: | :--------------------: | :-------------------: |
|    Compiler    |     Icarus Verilog     | 10.1 (stable) (v10_1) |
| Runtime Engine | Icarus Verilog Runtime | 10.1 (stable) (v10_1) |
