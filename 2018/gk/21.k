P:1_0:"../21.in"
u:" "_P 7
K:0j$u 1                                 / the seed constant
u:" "_P 11
M:0j$u 2                                 / the multiplier
nxt:{[v] b:v or 65536                    / one full outer iteration of the program
  r:K
  c:1
  while[c
    r:r+b and 255
    r:r and 16777215
    r:r*M
    r:r and 16777215
    if[256>b; c:0]
    if[c; b:b div 256]]
  r}
H:()
v:0j
c:1
while[c
  v:nxt v
  if[(#H)>H?v; c:0]                      / r5 value repeats -> the cycle closed
  if[c; H,:v]]
*H
*|H
\\
