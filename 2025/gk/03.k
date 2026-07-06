/ AoC 2025 day 3: P1 max 2-digit joltage = max 10*d[i]+suffixmax; P2 max 12-digit
/ subsequence: greedy, take max digit in feasible window, leftmost, 12-step fold
L:0:"../03.in"
f:{d:-48+ic x; |/(-1_10*d)+1_||\|d}
+/f'L
g:{d:-48+ic x; n:#d; r:{[s;t;z] hi:(n-11)+t; w:d@(s 0)+!hi-s 0; m:|/w; (1+(s 0)+*&w=m; m+10j*s 1)}/[(0;0j);!12;nul]; r 1}
+/g'L
\\
