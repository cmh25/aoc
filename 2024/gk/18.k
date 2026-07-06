/ AoC 2024 day 18: ram run
L:0:"../18.in"
W:71; NB:1024
c:.'L                                  / n x 2 matrix of x,y byte positions
idx:(c[;1]*W)+c[;0]                    / flat cell index per byte
SH:{((1_x),,W#0)|((,W#0),-1_x)|((1_'x),'0)|0,'-1_'x}  / 4-neighbor dilation
S:(W,W)#@[(W*W)#0;0;:;1]               / start at 0,0
e:W-1
op:~(W,W)#@[(W*W)#0;NB#idx;:;1]        / open cells after first NB bytes
r:S; d:0
while[~r[e;e]; r:r|op&SH r; d+:1]      / BFS flood, one ring per step
d                                      / part 1: shortest path after 1024 bytes
reach:{[n] o:~(W,W)#@[(W*W)#0;n#idx;:;1]; f:{x|o&SH x}/S; f[e;e]}
lo:NB; hi:#c                           / part 2: binary search first cutoff byte
while[1<hi-lo; md:_(lo+hi)%2; $[reach md;lo:md;hi:md]]
b:c[hi-1]
($b 0),",",$b 1
\\
