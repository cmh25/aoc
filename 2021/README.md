# Advent of Code 2021

[Advent of Code 2021](https://adventofcode.com/2021).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2021/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2021/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | increases via each-prior compare; p2 window sums cancel to v[i+3]>v[i] |
| 2 | course as char-code arithmetic, no branching; p2 aim = cumsum of up/down |
| 3 | column majority bits; p2 iterative most/least-common bit filter |
| 4 | one batched find maps every cell to its draw time; win = min over row/col maxes |
| 5 | segments rasterized into a flat overlap counter with amend-+ |
| 6 | lanternfish timer histogram: rotate ages, respawn parents at 6; longs |
| 7 | brute force every alignment position, linear then triangular cost |
| 8 | patterns deduced by length + subset tests (`lin`); outputs decoded by whole-value find |
| 9 | low points against 4 shifted grids; basins = min-label flood to a converge fixpoint |
| 10 | bracket matching as a seeded fold threading (stack;bad); p2 middle completion score |
| 11 | flash cascade with padded-shift neighbor counts; p2 first all-flash step |
| 12 | recursive path count over an adjacency list, small-cave visited mask, p2 one repeat budget |
| 13 | folds are coordinate reflections in a seeded fold; p2 renders the code letters |
| 14 | polymer as pair counts: two amend-+ per step, 40 steps in longs |
| 15 | shortest path by value iteration (min of 4 shifted dists + cost) to fixpoint; p2 5×5 tiling |
| 16 | BITS decoder: hex→bit vector, recursive descent with a global cursor, long values |
| 17 | apex closed-form from y-bounds; p2 simulates all launch velocities as one vector batch |
| 18 | snailfish numbers as flat (value;depth) vectors; explode/split are splices, magnitude reduces deepest pairs |
| 19 | 24 rotations; the right offset is the mode of pairwise differences (hashed group); BFS over scanners |
| 20 | 9 weighted shifted grids form the enhancement index; infinite background flips each step |
| 21 | p1 simulated; p2 forward DP over the (pos,score)² state vector with 7 weighted roll outcomes |
| 22 | p1 cross-product amend paints ±50³; p2 signed intersection cuboids, vectorized per step |
| 23 | amphipod burrow: memoized min-cost DFS, states as strings interned to dict keys; safe home-moves taken greedily |
| 24 | MONAD never simulated: per-block constants pair up in a stack, giving digit constraints solved greedily |
| 25 | both herds move as vectorized flat-grid steps until nothing moves |
