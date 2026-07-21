# Advent of Code 2019

[Advent of Code 2019](https://adventofcode.com/2019).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2019/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2019/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | fuel = `_m%3`-2 summed (p1); fuel-of-fuel via a while-scan, keep the positives (p2) |
| 2 | Intcode: p1 runs with noun/verb 12,2; p2 brute-forces 100x100 for the target output |
| 3 | crossed wires: each visited point encoded as one long key; p1 min Manhattan, p2 min combined steps (`?/` is per-element find, `a?v` looks up the whole vector) |
| 4 | password rules over a digit range: p1 non-decreasing + some adjacent pair, p2 a digit-run of exactly two (`{#x}'=x` group sizes) |
| 5 | Intcode TEST: parameter modes, jumps, compares; the diagnostic code is the last output |
| 6 | orbit map as a parent array over interned ids (names may start with a digit, so dict keys are out); p1 sum of depths, p2 first common ancestor of the YOU/SAN chains |
| 7 | amplifiers: p1 chains a signal over permutations of 0..4; p2 is a feedback loop of five resumable machines until E halts |
| 8 | space image: layers via `(n,sz)#`; p1 the fewest-zero layer, p2 first non-transparent pixel per position, rendered by deep-indexing `" #"@` |
| 9 | Intcode BOOST: relative base, unbounded memory, 64-bit values throughout |
| 10 | asteroids: distinct `gcd`-reduced directions = visible count (p1); p2 vaporizes in `atan2` angle order, round-robin by distance |
| 11 | hull-painting robot: resumable Intcode plus a heading; p1 distinct panels painted, p2 renders the registration letters |
| 12 | n-body with sign gravity, 1000 steps (p1); axes are independent, so per-axis period then `lcm` in longs (p2) |
| 13 | arcade: p1 counts block tiles in the output triples; p2 plays it — joystick = sign(ball-paddle) — and reads the final score |
| 14 | stoichiometry in topological (Kahn) order so a chemical's need is final before it is produced; p1 ore for one fuel, p2 binary-searches fuel for 1e12 ore |
| 15 | repair droid: DFS with physical backtracking to map the maze, then BFS for the distance (p1) and the fill time (p2) |
| 16 | FFT: p1 is a pattern matrix over 100 phases; p2's offset lies in the second half, where each output is just a suffix cumsum mod 10 |
| 17 | scaffold: p1 finds intersections with shifted-row masks; p2 derives the traversal path and compresses it into three A/B/C routines |
| 18 | keys and doors: BFS from each key yields a (distance, doors-needed) edge graph, then Dijkstra over (position, keyset) — with an O(1) integer hash-set for `visited`, since gk dict lookup is a linear scan |
| 19 | tractor beam: p1 samples 50x50; p2 walks the beam's left edge and tests the square's top-right corner |
| 20 | donut maze: portal labels read off the border; p1 plain BFS, p2 recursive levels (inner +1, outer -1) with a depth cap — and an array queue, because a list queue is O(n^2) |
| 21 | springdroid: p1 jumps when `(~A\|~B\|~C)&D`; p2 also demands `E\|H` so it can keep moving after landing |
| 22 | slam shuffle: the whole shuffle is one linear map `F(p)=A*p+B mod n`; p2 raises it to the shuffle count and inverts it, over a binary mulmod (the products overflow 64 bits) |
| 23 | network of 50 resumable machines, fed -1 when a queue is empty; p1 the first Y sent to 255, p2 the first Y the NAT delivers twice running |
| 24 | bug life: p1 the biodiversity of the first repeated layout; p2 recursive grids over +/- levels, neighbour counts as a matrix product, 200 minutes |
| 25 | text adventure, solved automatically: DFS the ship, skip the items that kill you, then brute-force item subsets against the pressure plate |
