# Advent of Code 2025

[Advent of Code 2025](https://adventofcode.com/2025).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2025/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2025/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | signed deltas, prefix scan; part 2 counts zero-crossings by floor-division difference |
| 2 | closed-form arithmetic series over (range, block-size); part 2 enumerates the sparse repeated-block IDs and dedups |
| 3 | max 2-digit joltage via reverse max-scan; part 2 greedy largest-12-digit subsequence as a 12-step fold |
| 4 | zero-padded grid, 8 shifted submatrices for neighbor counts; part 2 converges removal to a fixpoint |
| 5 | interval membership outer product; part 2 union-of-intervals sweep (sort, running max of ends) |
| 6 | worksheet parsed as character-column blocks; part 1 reads block rows, part 2 block columns |
| 7 | beam fold down the rows carrying a boolean mask; part 2 carries timeline counts instead |
| 8 | full pairwise distance matrix + union-find over sorted edges (find = converge-to-fixpoint) |
| 9 | part 2: coordinate compression (v and v+1 breakpoints), even-odd fill, 2D prefix sums of outside cells, O(1) per vertex pair |
| 10 | part 1: subset-parity match via doubling; part 2 (ILP): parity halving n = s + 2m with memoized recursion |
| 11 | DAG path counts as fixpoint c = ind + A·c; part 2 inclusion–exclusion over avoid-sets |
| 12 | packing feasibility bracketed by a 3×3-block lower bound and a cell-area upper bound; prints the bracket if they ever disagree |
