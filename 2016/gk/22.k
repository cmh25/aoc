L:2_0:"../22.in"
keepdig:{$[x in"0123456789"; x; " "]}
nums:{w:" "_keepdig'x; 0$'w@&0<#'w}
D:nums'L
X:{x 0}'D; Y:{x 1}'D; SZ:{x 2}'D; U:{x 3}'D; V:{x 4}'D
n:#D

+/{[a] $[U[a]>0; (+/~V<U a)-~V[a]<U a; 0]}'!n     / part 1

/ part 2: slide the empty node around; move goal data (top-right) to (0,0)
e:*&U=0
W:1+|/X; H:1+|/Y                                  / grid width, height
cap:SZ e                                          / empty node capacity
WG:(W*H)#0
wi:&U>cap                                         / immovable "wall" nodes
WG[X[wi]+W*Y[wi]]:1
WG[(W-1)+W*0]:1                                  / block the goal-data cell too
DX:1 -1 0 0; DY:0 0 1 -1
gnbr:{[k] x:k!W; y:k div W
  c:((x+1;y);(x-1;y);(x;y+1);(x;y-1))
  c:c@&{(~x[0]<0)&(x[0]<W)&(~x[1]<0)&x[1]<H}'c
  c:c@&{0=WG[(x 0)+W*x 1]}'c
  {(x 0)+W*x 1}'c}

/ shortest empty-node path to the cell just left of the goal data (W-2,0)
bfs:{[s;t]
  vis:,s; fr:,s; d:0
  while[1;
    nx:(?,/gnbr'fr) dvl vis
    d:d+1
    if[t in nx; :d]
    vis:vis,nx; fr:nx]}
dA:bfs[(X e)+W*Y e; (W-2)+W*0]
dA+1+5*(W-1)-1                                    / part 2: dA + 1 + 5*(goalX-1)
\\
