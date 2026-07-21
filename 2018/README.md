# Advent of Code 2018

[Advent of Code 2018](https://adventofcode.com/2018).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2018/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2018/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | prefix sums; p2 finds the first repeated running total one cycle at a time — `lin` against the growing seen-set, plus the fixed first-repeat index inside a single cycle |
| 2 | `{#x}'=id` letter counts for the checksum; a pairwise mismatch matrix `{+/'~x=/L}'L` locates the differ-by-one pair |
| 3 | claims expanded to flat cell indices; `#'=all` group sizes give both the overlap count and the one claim whose cells all have count 1 |
| 4 | records sort chronologically as plain strings; a scan builds (guard, minute) pairs, then group-and-count keyed two ways |
| 5 | polymer reduction as a stack machine over an in-place `@[`stk;i;:;c]` array; p2 reruns it for each removed letter |
| 6 | Manhattan Voronoi over the bounding box; owners of border cells are the infinite ones; p2 is just `+/10000>+/D` |
| 7 | topological order with alphabetical ties; p2 simulates 5 workers as a per-second event loop |
| 8 | recursive tree walk over a flat int vector with a global cursor |
| 9 | marble circle as `nxt`/`prv` arrays amended in place; the 22 non-scoring marbles of each group land in the 22 gaps ahead of the current one, so a whole group is two vectorized amends (4× faster than one marble at a time) |
| 10 | the message appears when the vertical extent is minimal; render with `@[…;X+W*Y;:;"#"]` |
| 11 | 300×300 power grid, 2-D prefix sums (`+\'+\P`), then every square size in one pass each |
| 12 | plant automaton: 5-cell windows indexed into a 32-entry rule table; p2 detects the fixpoint that only shifts |
| 13 | carts on a track. The `!` trap: `4!v` is `4 mod v`, not `v mod 4` — the intersection turn counter needs `v!4` |
| 14 | recipe scoreboard grown into a preallocated 30 M int array; the pattern search is six shifted compares. Keeping the loop's state in *locals* (not `::` globals) is 30 % of the runtime |
| 15 | Beverage Bandits: two vectorized BFS per unit turn (one from the unit, one from the chosen square); reading-order ties are just min flat index. p2 raises elf power until no elf dies |
| 16 | the 16 opcodes as one `$[…]` chain; sample matching, then constraint elimination for the opcode map |
| 17 | water flow with an explicit spill stack and a rise-and-spread loop. This is where the `A[closed] dyad` parser bug surfaced — `G[ix[a;b]] in "#~"` silently returned a *char* (since fixed in dev; a `gc[x;y]` helper sidesteps it either way) |
| 18 | lumber automaton via eight shifted submatrices; p2 finds the state cycle |
| 19 | don't run the program — run the setup, read N out of r5, and sum N's divisors directly |
| 20 | the route walked with a stack into a per-room door bitmask, then a vectorized BFS |
| 21 | reimplement the inner loop natively (the VM does division by repeated subtraction); p1/p2 are the first and last r5 before the sequence repeats |
| 22 | erosion levels row by row; Dijkstra over (cell, tool) with a bucket queue, since every edge costs 1 or 7 |
| 23 | octree search: repeatedly split the box that is best by (bot count desc, distance to origin asc, size asc) until size 1 |
| 24 | Immune System: the fiddly parse, and effective power recomputed at attack time. A quiet-value gotcha (not a bug): `sim`'s last statement is an assignment, so `(sim 0)1` at top level doesn't print — assign the result first, then index it |
| 25 | union-find over Manhattan distance ≤ 3 |
