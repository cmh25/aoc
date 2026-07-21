/ AoC 2022 day 12: hill climbing algorithm
m:ic'0:"../12.in"
f:,/m; sp:f?83; qe:f?69     / S and E flat positions
f[sp]:97; f[qe]:122
r:#m; c:#*m; m:(r,c)#f
zr:c#0
sd:{(,zr),-1_x}; su:{(1_x),,zr}
sr:{0,'-1_'x}; sl:{(1_'x),'0}
F:(r,c)#qe=!r*c              / BFS backwards from E
vis:F; D:((r,c)#qe=!r*c)-1   / dist: 0 at E, -1 unvisited
d:0
while[|/,/F
 nf:((sd F)&~(m+1)<sd m)|((su F)&~(m+1)<su m)|((sr F)&~(m+1)<sr m)|(sl F)&~(m+1)<sl m
 nf:nf&~vis
 d:d+1; D:D+nf*1+d; vis:vis|nf; F:nf]
v:,/D; g:,/m
v sp                         / part 1: shortest S -> E
&/v@&(g=97)&v>-1             / part 2: shortest from any 'a'
\\
