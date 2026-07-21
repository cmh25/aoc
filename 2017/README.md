# Advent of Code 2017

[Advent of Code 2017](https://adventofcode.com/2017).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2017/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2017/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | captcha: sum digits equal to the one `k` positions around, via `d=k!d` (rotate) then `+/d@&…` |
| 2 | tab-split rows: p1 max−min; p2 the one evenly-dividing pair per row (`d@&(d>a)&0=d!'a`) |
| 3 | spiral: p1 is a closed-form ring distance (mind gk's RTL — `2r+1` is `1+2*r`); p2 fills the spiral summing 8 written neighbours until a value exceeds the input |
| 4 | passphrases: p1 no duplicate words (`(#?x)=#x`), p2 no anagram dups (sort each word's letters first) |
| 5 | jump maze: in-place `@[`A;i;+;d]` per step; p2's rule is >=3 decrement else increment. 28 M steps ≈ 5 min |
| 6 | block redistribution: spread the max bank vectorized (base to all, +1 to the next `v mod n`), loop until a state recurs |
| 7 | tree from `name (w) -> kids`; p1 the root (never a child), p2 descends into the odd-weighted subtree and corrects one node |
| 8 | conditional register VM; the compare op is a 1-char string, so test `*op` (a char) plus length — not `op~">"` |
| 9 | stream state machine: `!` cancels the next char, `<…>` garbage; p1 group score, p2 garbage count |
| 10 | Knot Hash: reverse-with-wrap on a 256-ring; p2 is 64 rounds + XOR-16-blocks → 32-hex (reused day 14) |
| 11 | hex grid in cube coordinates; distance = (\|x\|+\|y\|+\|z\|)/2, p2 the max ever |
| 12 | union-find connected components; p1 size of 0's group, p2 group count |
| 13 | firewall: a scanner of range r has period 2(r−1); p2 scans start delays in vectorized blocks |
| 14 | Knot-Hash 128 rows → bit grid; p1 pop-count, p2 union-find regions of set bits |
| 15 | dueling LCG generators, 40 M pairs — vectorized in blocks via jump-ahead powers (`aₙ₊ₖ = aₙ·multᵏ mod M`) |
| 16 | permutation dance; p2 (1e9 rounds) by cycle detection. Spin needs `0-0$…` — `-0$` fuses to a literal |
| 17 | spinlock circular buffer; p1 simulates 2017 inserts, p2's 50 M inserts track only what lands at index 1 |
| 18 | Duet VM; p1 snd/rcv as sound, p2 two programs with cross-fed queues run until deadlock. `. x` (eval) needs the space |
| 19 | follow the line grid, turning at `+`; p1 letters seen, p2 step count |
| 20 | particles: p1 min (\|a\|,\|v\|,\|p\|) lexicographically, p2 simulate removing colliding positions (group equal rows) |
| 21 | fractal art: 2-bit/3-bit lookup tables over all 8 dihedral orientations per rule; split→transform→reassemble |
| 22 | virus carrier on an infinite grid (flat array + in-place amend); p1 10 k bursts (2 states), p2 10 M (4 states) |
| 23 | coprocessor VM; p1 counts `mul`, p2 is the disassembled loop — count composites in [106700,123700] step 17 |
| 24 | bridge DFS from port 0, components as a long bitmask; p1 strongest, p2 longest-then-strongest |
| 25 | Turing machine, 12 M steps; parse needs the *last* uppercase letter per line (skip "Begin"/"Continue") |
