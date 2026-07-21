# Advent of Code 2022

[Advent of Code 2022](https://adventofcode.com/2022).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2022/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2022/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | blank-line groups from a cumsum of empties; p2 top-3 by grade |
| 2 | rock-paper-scissors as pure mod-3 arithmetic on char codes, no branching |
| 3 | half/trio intersection via `lin`; priorities straight off char codes |
| 4 | ranges as a 4-column matrix; containment/overlap as vector comparisons |
| 5 | pictorial header transposed into stacks; each move a take/drop splice (p1 reversed, p2 block) |
| 6 | first all-distinct sliding window, p1 width 4 / p2 width 14 |
| 7 | terminal log replayed against a pop-and-propagate directory-size stack, one pass |
| 8 | visibility = running row maxima in 4 orientations; p2 scenic brute force per cell |
| 9 | head path as prefix sums; every knot is a seeded scan chasing its leader |
| 10 | per-cycle deltas, X = shifted prefix sum; CRT pixels = boolean abs(X-col)<2 reshaped 6×40 |
| 11 | items processed per monkey as one vector; p2 worry mod product-of-divisors on longs |
| 12 | BFS backwards from E as boolean matrix shifts; p2 min over all `a` cells falls out free |
| 13 | recursive-descent packet parser + recursive comparator; p2 just counts packets below each divider |
| 14 | p1 falling grains with the path kept as a stack (next grain resumes); p2 row-by-row reachability |
| 15 | merged interval sweep on the target row; p2 intersects the just-outside diagonal boundary lines |
| 16 | Floyd-Warshall valve distances; DFS over next-valve with a triangular bound; p2 subset-max over disjoint mask pairs |
| 17 | bit-row tetris; cycle detection on (shape, jet, top-8-rows) extrapolates to 10¹² |
| 18 | flat 3D grid; p1 shift adjacency, p2 flood fill of exterior air from a corner |
| 19 | DFS over next-robot-to-build with ceil-division waits and a triangular geode bound |
| 20 | mixing as find/remove/insert at (pos+value) mod n-1 on the permutation; longs for p2 |
| 21 | expression-tree eval; p2 walks the humn side inverting each op against the other side's value |
| 22 | p1 flat wrap via per-row/col extents; p2 generic cube folding in doubled 3D coords (no hardcoded net — passes the sample's layout too) |
| 23 | sparse elves as encoded ints; neighbor occupancy in one bulk `lin`; conflicts cancel by group size |
| 24 | blizzard masks are just the initial rows/cols rotated by t; frontier BFS with doorway injection, 3 trips for p2 |
| 25 | SNAFU decode as a seeded fold; encode by digit-carry division |
