FLAGS = -Wall

.PHONY: default run remake clean diff

default:
	iverilog $(FLAGS) -o testbench Test_Bench.v

run:
	./testbench

diff:
	diff --strip-trailing-cr ./cache.txt ./test/cache/cache.txt
	diff --strip-trailing-cr ./output.txt ./test/cache/correct_output.txt

remake: clean default

clean:
	rm -f testbench output.txt cache.txt output.vcd
