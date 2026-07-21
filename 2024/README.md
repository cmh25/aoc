# Advent of Code 2024

[Advent of Code 2024](https://adventofcode.com/2024).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2024/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2024/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | sort both columns / abs-diff; p2 similarity via group-counts |
| 2 | per-report sign/step checks; p2 dampener = drop-each index |
| 3 | `mul(` sites via substring search + char-class validation; p2 do/don't timeline mask |
| 4 | padded grid, 8 direction-shifted submatrix conjunctions; p2 diagonal MAS/SAM masks |
| 5 | 100×100 rule matrix; ordered iff predecessor-count ≡ position; p2 places pages by predecessor count (no sort) |
| 6 | p2 vectorized across all candidate obstructions at once: per-cell jump tables, Brent cycle detection |
| 7 | fold carrying the vector of reachable values, pruned at target; concat = shift by 10^digits |
| 8 | antenna pairs by frequency; antinodes `2a-b` / `a+k·d`, encode-and-unique |
| 9 | p1 loop-free two-pointer fill; p2 first-fit scan over gap vectors by descending file id |
| 10 | p1 per-trailhead height-level flood; p2 path-count DP folded from the 9s down |
| 11 | (values;counts) pairs, group-sum per blink — 75 blinks over ~4k distinct stones |
| 12 | converge min-label flood fill; sides = vectorized corner counting (8 shifted masks) |
| 13 | Cramer 2×2 with exact long divisibility checks; p2 = +10^13 offsets |
| 14 | p2: min-variance phase per axis + CRT via `modinv` (tree confirmed by rendering) |
| 15 | sokoban simulation; p2 pushes a level-by-level frontier of wide boxes |
| 16 | turn-layer Dijkstra: layer k = "exactly k turns", min-plus seeded scans; p2 forward+backward cost planes |
| 17 | 3-bit VM; p2 array-BFS over candidate A values, 3 bits at a time, filtered by output-suffix match |
| 18 | boolean flood-fill BFS; p2 binary search over byte count |
| 19 | seeded DP over positions, patterns grouped by length, long way-counts |
| 20 | dist grid + 836 manhattan-≤20 offsets, each a shifted-submatrix compare — no pair loop |
| 21 | level-DP with 5×5 dirpad cost matrices iterated 25 times; paths precompiled to gather-index vectors |
| 22 | PRNG vectorized across buyers; p2 first-occurrence dedup per buyer + scatter-add into a 19⁴ accumulator |
| 23 | boolean adjacency; triangles from edge rows; max clique by peel-min-degree from each neighborhood seed |
| 24 | p1 converge evaluation; p2 structural adder rules — verified: exactly one of the 105 pairings of the 8 flagged wires restores x+y |
| 25 | column counts per block; lock×key fit as an each-left outer product |
