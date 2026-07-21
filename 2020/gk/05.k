/ AoC 2020 day 5: binary boarding
ids:{2 sv x lin"BR"}'0:"../05.in"        / B/R=1, F/L=0, decode 10-bit seat id
|/ids                                     / part 1: highest seat id
s:ids@<ids; 1+s@*&2=(1_s)-(-1_s)         / part 2: the one gap in the run
\\
