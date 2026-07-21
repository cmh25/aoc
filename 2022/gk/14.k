/ AoC 2022 day 14: regolith reservoir
L:0:"../14.in"
pt:{0$'","_'";"_ssr[x;" -> ";";"]}'L
seg:{[a;b] d:b-a; s:(d>0)-d<0; ((!1+|/abs d)*\s)+\a}
rc:,/,/{seg'[-1_x;1_x]}'pt   / all rock cells (x;y)
my:|/rc@'1
w:5+2*my+2; x0:500-my+2; sc:500-x0
G:((my+3),w)#@[(w*my+3)#0;(w*rc@'1)+(rc@'0)-x0;:;1]
r2:0                          / part 2 first (pure): row-by-row reachability
R:@[w#0;sc;:;1]; r2:1; yy:1
while[yy<my+2; R:((0,-1_R)|R|(1_R),0)&~G yy; r2:r2++/R; yy:yy+1]
py:,0; px:,sc; cnt:0; hit:0   / part 1: falling grains, path kept as a stack
pu:{[a;b] py::py,a; px::px,b}
re:{G[*|py;*|px]::1; cnt::cnt+1; py::-1_py; px::-1_px}
while[(~hit)&0<#py
 y:1+*|py; x:*|px
 $[y>my; hit:1; ~G[y;x]; pu[y;x]; ~G[y;x-1]; pu[y;x-1]; ~G[y;x+1]; pu[y;x+1]; re[]]]
cnt                           / part 1: grains at rest before overflow
r2                            / part 2: grains until source blocks (floor)
\\
