/ AoC 2023 day 7: camel cards
L:0:"../07.in"
sp:" "_'L
hd:sp@'0
bs:0j$'sp@'1
o1:"23456789TJQKA"
k1:{c:(c@>c:#'=v:o1?/x),0; (371293*(10*c 0)+c 1)+13 sv v}'hd    / key = hand type, then cards base-13
+/bs*1j+<<k1                   / part 1: winnings = sum rank*bid
o2:"J23456789TQKA"
k2:{v:o2?/x; nj:+/0=v; c:#'=v@&v>0; c:(c@>c),0 0; (371293*(10*nj+c 0)+c 1)+13 sv v}'hd
+/bs*1j+<<k2                   / part 2: jokers join the biggest group, weakest label
\\
