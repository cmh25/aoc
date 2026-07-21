/ AoC 2020 day 25: combo breaker
pk:0j$'0:"../25.in"
M:20201227j
v:1j; n:0; while[~v=pk 0; v:(v*7)!M; n:n+1]      / loop size of card
r:1j; do[n; r:(r*pk 1)!M]                        / transform door key that many times
r                                                / part 1: encryption key
\\
