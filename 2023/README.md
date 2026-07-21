# Advent of Code 2023

[Advent of Code 2023](https://adventofcode.com/2023).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2023/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2023/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | first/last digit per line; p2 min/max substring-search position over the 18 digit/word tokens |
| 2 | per-color maxima per game; p1 fits-12/13/14 test, p2 sum of power products |
| 3 | digit-run ids on the flat grid, symbol dilation by 8 shifts; p2 distinct run-ids around each `*` |
| 4 | match counts → 2^(n-1) points; p2 cascading copy counts in one forward pass |
| 5 | interval splitting through each mapping stage, vectorized over the interval list |
| 6 | p1 brute count matrix; p2 quadratic roots with exact long boundary fix-up |
| 7 | hand → one sortable long key (type from group-counts, jokers join the biggest group); grade once |
| 8 | whole-instruction-pass macro-step map over all nodes; p2 lcm of verified ghost periods |
| 9 | extrapolation is linear → sum all rows into one vector, one delta-scan; p2 same on reversed rows |
| 10 | heading-table loop walk; p1 length/2, p2 shoelace area + Pick's theorem |
| 11 | per-axis sorted-coordinate gap weighting with expanded gaps — no pair loop |
| 12 | arrangements DP vectorized over positions, seeded fold over groups (reset-segmented cumsums), long counts |
| 13 | one mismatch-count function over row/col splits of `m` and `+m`; p1 target 0, p2 target 1 |
| 14 | tilt = per-row segment-stable grade; 4 tilts via flips/transposes; state cycle detection indexes 10⁹ |
| 15 | HASH via closed form 17^k ≡ 1+16k (mod 256); p2 stateful box fold over (labels;focals) |
| 16 | flat (cell,dir) jump tables, straight runs path-compressed by pointer doubling; frontier BFS per entry |
| 17 | two-plane (last-move-H/V) min-plus relaxation, run costs from shifted prefix sums, iterated to fixpoint — no priority queue |
| 18 | shoelace + perimeter/2 + 1 on longs; p2 hex decoded via `16 sv` |
| 19 | workflows as parallel (var;op;val;dest) tables; p1 while-walk per part, p2 [lo;hi] box-splitting worklist |
| 20 | typed-module FIFO pulse simulation; p2 lcm of the four rx-feeder conjunction periods (each verified) |
| 21 | boolean frontier shifts on a 5×5 tiling; p2 quadratic fit at 65/196/327, verified at f(458), evaluated at t=202300 |
| 22 | z-sorted settle on a heightmap collecting support sets; p1 sole-support test, p2 cascade in one z-ordered pass |
| 23 | junction-graph contraction; longest path by whole-frontier vector DFS with long bitmasks + perimeter prune |
| 24 | p1 all-pairs XY crossings in floats; p2 per-axis velocity pinning via duplicate-velocity divisibility, exact long solve |
| 25 | unit-capacity max-flow (Edmonds–Karp) → the 3-cut; component sizes from residual reachability |
