FLAGS = -Wall

.PHONY: default run remake clean

default: testbench

testbench: testbench.v
	iverilog $(FLAGS) $< -o $@

run:
	./testbench

remake: clean default

clean:
	rm -f testbench output.txt test.vcd
