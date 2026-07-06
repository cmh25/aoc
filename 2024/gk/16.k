/ AoC 2024 day 16: reindeer maze
L:0:"../16.in"
f:,/L
W:#L 0; H:#L
n:#f
IN:1000000000
wl:f="#"
si:*&f="S"; ei:*&f="E"
WB:(H,W)#IN*wl                  / wall bonus keeps scans from leaking through #
TWB:+WB
/ turn-layer dijkstra: layer k = states reached with exactly k turns; one
/ capped min-plus scan per direction resolves all straight moves in a layer
scS:{[C;B] {[x;y;z] IN&(y&1+x)+z}\[IN&(C 0)+B 0;1_C;1_B]}   / 3-arg scan zips C,B rows
scd:{[v;d] m:(H,W)#v; $[d=2;,/scS[m;WB]; d=0;,/|scS[|m;|WB]; d=1;,/+scS[+m;TWB]; ,/+|scS[|+m;|TWB]]}
/ dirs 0=N 1=E 2=S 3=W; o maps facing to scan direction (reversed for backward)
stp:{[gl;o] g:gl 0; l:gl 1                      / g best-so-far, l current layer
 l2:{[d] scd[1000+(l[(d+1)!4])&l[(d+3)!4];o d]}'!4
 g2:g&l2                                       / deep min per plane
 c:l2<g; l3:(l2*c)+IN*~c                       / prune states dominated by g
 (g2;l3)}
run:{[g0;o] l0:scd'[g0;o]; r:{stp[x;o]}/(g0&l0;l0); r 0}
F:run[@[4#,n#IN;1;{@[x;si;:;0]}];0 1 2 3]       / cost from start (facing E)
best:&/F[;ei]
best                                            / part 1: cheapest path score
B:run[{@[x;ei;:;0]}'4#,n#IN;2 3 0 1]            / cost to end, any final facing
on:|/best=(0j+F)+B                             / part 2: cell on some best path
+/on
\\
