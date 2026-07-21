# Advent of Code 2020

[Advent of Code 2020](https://adventofcode.com/2020).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2020/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2020/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | pair/triple summing to 2020 via complement membership (`lin`, not `in`) |
| 2 | policy check: p1 letter count in range, p2 exactly-one-of-two-positions (sum=1) |
| 3 | slope tree count with modular column wrap; p2 = product over five slopes |
| 4 | passport fields via blank-line groups; p2 per-field range/format validation |
| 5 | boarding pass = 10-bit binary decode (`2 sv`); p1 max id, p2 the gap in the sorted run |
| 6 | customs groups: p1 union of yes-answers, p2 intersection (char-in-every-line) |
| 7 | bag rules: p1 reverse-reachability fixpoint to shiny gold, p2 recursive contained-bag count |
| 8 | handheld VM: p1 acc at first repeat, p2 patch one jmp/nop so it halts |
| 9 | XMAS: p1 first number not a pair-sum of the prior 25, p2 contiguous run summing to it |
| 10 | adapter diffs product (p1); DP arrangement count, longs (p2) |
| 11 | seating life: p1 8-adjacent (padding sum), p2 line-of-sight (precomputed visibles); converge |
| 12 | ship nav with heading rotation (p1); waypoint-relative movement (p2) |
| 13 | earliest bus (p1); CRT sieve alignment, longs (p2) |
| 14 | bitmask over bit-vectors (`&`/`\|` are min/max, not bitwise): p1 value force, p2 floating addresses |
| 15 | Van Eck memory game; 30M turns need in-place `@[`LAST;i;:;v]` (indexed assign copies the vector) |
| 16 | ticket field ranges: p1 error rate, p2 constraint-solve field order, product of departure fields |
| 17 | Conway cubes 3D (p1) / 4D (p2) as a coordinate set with mixed-radix integer keys |
| 18 | expression eval via shunting-yard with the precedence rule passed in as a function |
| 19 | CFG matcher over position-sets; p2 recursive rules 8/11 (empty-set guard stops the loop) |
| 20 | jigsaw: p1 corner product via unique-edge counting; p2 full assemble + sea-monster hunt over 8 orientations |
| 21 | allergen constraint-solve: p1 safe-ingredient occurrences, p2 canonical dangerous list |
| 22 | Combat (p1); Recursive Combat with per-game seen-set (p2) |
| 23 | crab cups as a `next[]` linked list; p1 100 moves, p2 10M moves on 1M cups (in-place amend) |
| 24 | hex tiles in doubled coordinates: p1 black count, p2 100 days of hex life |
| 25 | combo breaker: discrete log by trial multiply, then transform (p1; p2 is the free star) |
