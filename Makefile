FLAGS = -Wall

.PHONY: default run remake clean

default:
	iverilog $(FLAGS) testbench.v -o testbench

run:
	timeout 1 ./testbench | tee result
	@echo
	@echo '** Write output to "./result"'

remake: clean default

clean:
	rm -f testbench output.txt test.vcd result
