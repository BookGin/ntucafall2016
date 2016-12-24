FLAGS = -Wall

.PHONY: default run remake clean

default:
	iverilog $(FLAGS) -o testbench Test_Bench.v

run:
	./testbench

remake: clean default

clean:
	rm -f testbench output.txt cache.txt output.vcd
