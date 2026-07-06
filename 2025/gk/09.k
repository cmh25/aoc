/ AoC 2025 day 9: P1 largest rect on 2 red corners. P2: rect must stay inside the
/ rectilinear red/green loop: coordinate-compress (v and v+1 breakpoints), even-odd
/ fill, 2D prefix of outside cells, O(1) test per vertex pair.
L:0:"../09.in"
t:+0$''","_'L
X:t 0
Y:t 1
n:#X
XL:0j$'$X
|/{|/(1+abs XL-XL x)*1j+abs Y-Y x}'!n     / part 1
NX:1!X
NY:1!Y
vi:&X=NX
vex:X vi
va:(Y vi)&NY vi
vb:(Y vi)|NY vi
hi:&Y=NY
hey:Y hi
hc:(X hi)&NX hi
hd:(X hi)|NX hi
xs:{x@<x}@?X,X+1
ys:{x@<x}@?Y,Y+1
J:#xs
K:#ys
mapx:@[(2+|/xs)#0;xs;:;!J]
mapy:@[(2+|/ys)#0;ys;:;!K]
B:(K;J)#0
{[e] j:mapx vex e; ks:(mapy va e)+!1+(mapy vb e)-mapy va e; B[ks;j]::1}'!#vi;
{[e] k:mapy hey e; js:(mapx hc e)+!1+(mapx hd e)-mapx hc e; B[k;js]::1}'!#hi;
orow:{[k] yk:ys k; exs:vex@&(~va>yk)&yk<vb; cnt:$[0=#exs;J#0;+/exs>\xs]; (~B k)&0=cnt!2}
O:orow'!K
S:+\+\'O
W:1+J
SF:,/(,W#0),0,'S
fi:!n*n
w:&(fi div n)<fi!n
ii:w div n
jj:w!n
x1:(X ii)&X jj
x2:(X ii)|X jj
y1:(Y ii)&Y jj
y2:(Y ii)|Y jj
a1:mapx x1
a2:mapx x2
b1:mapy y1
b2:mapy y2
t1:SF@(W*1+b2)+1+a2
t2:SF@(W*b1)+1+a2
t3:SF@(W*1+b2)+a1
t4:SF@(W*b1)+a1
ar:(1+x2-x1)*1j+y2-y1
|/ar@&0=((t1-t2)-t3)+t4                   / part 2
\\
