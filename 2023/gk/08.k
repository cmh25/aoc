/ AoC 2023 day 8: haunted wasteland
L:0:"../08.in"
dd:"R"=*L                      / instruction booleans
nd:#dd
ns:2_L
G:+ns                          / fixed-width lines: name 0-2, left 7-9, right 12-14
nms:+G 0 1 2
li:nms?/+G 7 8 9
ri:nms?/+G 12 13 14
tab:(li;ri)
n:#ns
zn:"Z"=G 2
zi:nms?"ZZZ"
P:!n                           / walk ALL nodes through one instruction pass:
fz:n#-1j                       / first in-pass step hitting any ..Z
fq:n#-1j                       / first in-pass step hitting ZZZ
t:0
while[t<nd; w:&(0>fz)&zn P; fz[w]:t; w:&(0>fq)&P=zi; fq[w]:t; P:tab[dd t;P]; t:t+1]
FM:P                           / full-pass macro-step map
mw:{[ft;s] tot:0j; while[0>ft s; s:FM s; tot:tot+nd]; tot+ft s}
mw[fq;nms?"AAA"]               / part 1: AAA to ZZZ
g:{while[y>0j; t:y; y:x!y; x:t]; x}
lc:{(x*y)div g[x;y]}
lc/mw[fz]'&"A"=G 2             / part 2: ghosts are periodic, lcm of cycle lengths
\\
