/ AoC 2023 day 2: cube conundrum
L:0:"../02.in"
f:{tk:2_" "_ssr[ssr[ssr[x;":";""];";";""];",";""]; m:(#tk)div 2; ns:0$tk@2*!m; cs:tk@1+2*!m; (|/ns*cs~\"red";|/ns*cs~\"green";|/ns*cs~\"blue")}
M:f'L                        / per-game max seen of (red;green;blue)
+/(1+!#L)*~|/'M>\12 13 14    / part 1: games fitting 12r 13g 14b
+/*/'M                       / part 2: sum of power = product of maxima
\\
