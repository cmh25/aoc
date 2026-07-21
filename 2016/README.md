# Advent of Code 2016

[Advent of Code 2016](https://adventofcode.com/2016).

Run the whole suite with `run.sh` in the gk directory.

```
GK=/path/to/gk 2016/gk/run.sh     # one-shot, or:  export GK=/path/to/gk
```

Inputs are not committed (see the [top-level README](../README.md)); save
your own as `2016/NN.in`.

## Day-by-day notes

| Day | Technique |
|-----|-----------|
| 1 | turtle walk; p1 Manhattan of endpoint, p2 first revisited intersection (track every unit step) |
| 2 | keypad walk clamped to a char grid; p2 is the diamond pad with spaces for the missing corners |
| 3 | valid triangles (`(2*max)<perimeter`); p2 reads the columns in groups of three via `,/+M` |
| 4 | room checksum = five most common letters, ties alphabetical (stable grade-down); p2 shift-decrypts to find "north" |
| 5 | MD5 password: p1 the 6th char of each 00000-hash, p2 places the 7th char by the 6th (guard non-digit positions) |
| 6 | most / least common char per column (`+M` then group-size max/min) |
| 7 | IPv7 TLS (ABBA outside, none inside) and SSL (ABA in supernet with reversed BAB in a hypernet) |
| 8 | 2-D screen: `rect`/`rotate row`/`rotate column` via re-index; p2 reads the letters AFBUPZBJPS off the pixels |
| 9 | decompression *length* only (marker `(AxB)`); p2 recurses into the referenced span — lengths are longs |
| 10 | balance-bot simulation; process any bot holding 2 chips, route low/high to bots or output bins |
| 11 | RTG floors: BFS with pair-canonicalization (elements interchangeable → sort the (gen,chip) pairs), longs as keys |
| 12 | assembunny VM; pre-compile each line to `(op;kind;val;kind;val)` for a fast hot loop |
| 13 | maze where wall = odd popcount of `x²+3x+2xy+y+y²+fav`; BFS for p1 distance, p2 count reachable ≤50 |
| 14 | one-time-pad: a triple then the same char five-of-a-kind in the next 1000 hashes; p2 stretches 2017 rounds |
| 15 | disc alignment: smallest `t` with `(P+k+t) mod N == 0` for every disc (per-element mod is `!'`) |
| 16 | dragon curve on a 0/1 vector (`a,0,reverse(~a)`), then pair-fold checksum until odd length |
| 17 | MD5-gated 4×4 maze; the hash's first four chars open U/D/L/R; BFS for shortest, longest path length |
| 18 | trap tiles: a tile is a trap iff its two upper diagonals differ — shift and XOR the row |
| 19 | Josephus: p1 closed form `2(n-2^k)+1`, p2 the across-the-circle variant keyed on the largest power of 3 |
| 20 | merge blocked IP ranges (sorted longs); p1 first gap, p2 count of allowed addresses |
| 21 | string scrambler (swap/rotate/reverse/move); p2 brute-forces all 8! permutations to invert it |
| 22 | grid disks: p1 viable pairs; p2 slide the one empty node around the wall (empty-only BFS + shuffle formula) |
| 23 | assembunny + `tgl`; the code is `a! + 77*73`, so run a=7 for the offset and compute `12! + offset` |
| 24 | duct TSP: BFS a distance matrix between the numbered cells, then brute the 7! visit orders (p2 returns to 0) |
| 25 | assembunny + `out`: lowest `a` whose `a+2555` is `101010…` in binary → alternating clock signal |
