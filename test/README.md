You can compare output with `./correct_output.txt` by `diff` or `vimdiff`.
If there is `no compare.txt`, please check correctness manually.

## Single Cycle CPU Test

### `basic_ins`
Test for those instructions:
- and 
- or 
- add 
- sub 
- mul 
- addi

### `advanced_ins`
Test for those instructions for single-cycle CPU:
- sw
- lw
- beq
- j

## Pipeline CPU Test
### `pipeline_ins_no_hazard`
The instructions don't contain any hazard. It's used to test pipeline without considering hazrads.
