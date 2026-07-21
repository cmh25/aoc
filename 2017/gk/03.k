N:0$*0:"../03.in"
/ part 1: closed-form ring distance (mind gk's RTL: 2r+1 is 1+2*r)
r:0
while[N>(1+2*r)*1+2*r; r+:1]                   / smallest ring with (2r+1)^2 >= N
m:N-(-1+2*r)*-1+2*r                            / offset past the inner ring's max
$[r=0; 0; r+abs (r-1)-(m-1)!2*r]
/ part 2: spiral fill, each cell = sum of 8 filled neighbours, until > N
dx:1 0 -1 0
dy:0 1 0 -1
W:41
c:20
G:(W*W)#0
G[c+W*c]:1
runs:,/{(x;x)}'1+!W
p2:1
x:c; y:c; dr:0; ri:0; rp:0
while[~p2>N
  if[rp=runs ri; dr:(dr+1)!4; ri+:1; rp:0]
  x+:dx dr; y+:dy dr; rp+:1
  p2:+/,/{[a;b] G[(a+ -1 0 1)+W*b]}[x;]'y+ -1 0 1
  G[x+W*y]:p2]
p2
\\
