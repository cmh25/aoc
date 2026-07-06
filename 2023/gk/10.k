/ AoC 2023 day 10: pipe maze
G:0:"../10.in"
H:#G
W:#*G
s:(,/G)?"S"
r0:s div W
c0:s!W
P:"|-LJ7F"
T:(0 -1 2 -1;-1 1 -1 3;-1 -1 1 0;-1 0 3 -1;3 2 -1 -1;1 -1 -1 2)   / T[pipe;heading] -> new heading (N E S W)
DR:-1 0 1 0
DC:0 1 0 -1
ok:{nr:r0+DR x;nc:c0+DC x;$[(nr<0)|(nc<0)|(nr=H)|nc=W;0;5<i:P?G[nr;nc];0;-1<T[i;x]]}
d:*&ok'!4                                / initial heading: first neighbor that connects back
R:,r0
C:,c0
r:r0+DR d
c:c0+DC d
while[~(r=r0)&c=c0; R,:r; C,:c; d:T[P?G[r;c];d]; r:r+DR d; c:c+DC d]
L:#R
L div 2                                  / part 1: farthest point = half the loop
A2:abs+/(C*1!R)-R*1!C                    / twice the shoelace area of the loop polygon
(A2-L-2)div 2                            / part 2: Pick's theorem, interior = A - L/2 + 1
\\
