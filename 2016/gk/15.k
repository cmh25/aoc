L:0:"../15.in"
keepdig:{$[x in"0123456789"; x; " "]}
nums:{w:" "_keepdig'x; 0$'w@&0<#'w}    / all integers in a line

N:nums'L
Ns:{x 1}'N                              / positions per disc
Ps:{x 3}'N                              / start position per disc
Ks:1+!#L                                / disc index (1-based)

first:{[Ns;Ps;Ks] t:0; while[~&/0=(Ps+Ks+t)!'Ns; t+:1]; t}

first[Ns;Ps;Ks]                         / part 1

/ part 2: add a 7th disc, 11 positions, at position 0
first[Ns,11; Ps,0; Ks,1+#L]
\\
