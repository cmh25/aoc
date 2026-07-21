# Advent of Code 2015

[Advent of Code 2015](https://adventofcode.com/2015).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2015/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2015/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | paren floor counter: `+\` of ±1; p2 first index reaching -1 |
| 2 | sort each box's dims; paper `3ab+2(bc+ac)`, ribbon `2(a+b)+abc` |
| 3 | cumulative sums of moves, positions keyed `x+10000*y`, count uniques; p2 de-interleave santa/robot |
| 4 | MD5 brute force for 00000/000000 prefixes (`md5` builtin, `while` from p1's index) |
| 5 | vectorized string predicates (`lin`, aligned drops); p2 pair-repeat via self-find gap `(!#p)-p?/p` |
| 6 | 1000×1000 grid as a flat vector; per-instruction rectangle index vector, indexed assign / `~`toggle / `0|`floor |
| 7 | wire circuit: memoized recursive eval over parsed rules; `and`/`or`/`xor` builtins, shifts via `*`/`div` powers of 2 |
| 8 | escape decoding: per-line scan loop (`\\`, `\"`, `\xHH`); p2 is just counting `"` and `\` |
| 9 | 8-city TSP: distance matrix + brute all `8!` permutations (min and max) |
| 10 | look-and-say on an int vector: run starts `&1,~=`-style, next = `,/lens,'digits`; 40 and 50 rounds |
| 11 | password increment in base-26 digits; skip-ahead past i/o/l; vectorized straight/pair checks |
| 12 | p1 mask non-digits and sum; p2 recursive JSON walk returning (sum;pos;isred), objects zeroed on "red" |
| 13 | circular table happiness: brute `7!` with fixed seat, pair value `H[a;b]+H[b;a]`; p2 adds a zero row/col |
| 14 | reindeer distance closed form per second grid (2503 cols); p2 points = rows matching column max |
| 15 | ingredient amounts summing to 100: enumerate all triples, score `*/0|` dot products; p2 filter calories=500 |
| 16 | match Sue properties against the ticker; p2 turns cats/trees into `>` and pomeranians/goldfish into `<` |
| 17 | container combinations: DP over (count;sum) matrix, one row-shift per container |
| 18 | Conway life 100×100 ×100 steps: zero-pad + sum of 8 shifted submatrices; p2 pins the corners |
| 19 | p1 all one-step replacements via `ss` positions, count uniques; p2 closed form `atoms - Rn - Ar - 2Y - 1` |
| 20 | divisor sieves to 1M: per-elf `@[`s;e*1+!N div e;+;10*e]` in-place amend; p2 caps at 50 visits |
| 21 | RPG shop: enumerate all 660 loadouts, fight decided by ceil-division turn counts |
| 22 | wizard fight: DFS over (hp;mana;bosshp;timers;spent) with best-so-far pruning; p2 hard mode -1 hp/turn |
| 23 | hlf/tpl/inc/jmp/jie/jio VM on two long registers (the program is a Collatz chase) |
| 24 | balance packages: DFS combinations by ascending group size, prune on product ≥ best; QE needs longs |
| 25 | grid code = `20151125 * 252533^(n-1) mod 33554393`, diagonal index + square-and-multiply modpow |
