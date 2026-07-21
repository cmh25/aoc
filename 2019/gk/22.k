L:0:"../22.in"
pn:{$[(*x)="-"; 0j-0j$1_x; 0j$x]}
parse:{[s] t:" "_s; $[s~"deal into new stack"; (-1;-1); (t 0)~"cut"; (1; 0j-pn t 1); (pn@*|t; 0)]}
nm:{((x!y)+y)!y}                        / normalize into [0,m)
mm:{[a;b;m] a:nm[a;m]; b:nm[b;m]; r:0j;
  while[b>0; if[b!2; r:(r+a)!m]; a:(a+a)!m; b:b div 2]; r}
mp:{[a;e;m] r:1j; a:nm[a;m];
  while[e>0; if[e!2; r:mm[r;a;m]]; a:mm[a;a;m]; e:e div 2]; r}
step:{[f;line;n] t:parse line; (mm[t 0;f 0;n]; nm[mm[t 0;f 1;n]+t 1;n])}
compose:{[n] step/[(1j;0j); L; n]}      / whole shuffle as F(p)=A*p+B
/ ---- part1 ----
n1:10007
f1:compose n1
nm[mm[f1 0;2019;n1]+f1 1; n1]           / final position of card 2019
/ ---- part2 ----
n:119315717514047j
m:101741582076661j
f:compose n
A:f 0; B:f 1
Am:mp[A;m;n]
iv:{mp[x;n-2;n]}
Bm:mm[mm[B; nm[Am-1;n]; n]; iv nm[A-1;n]; n]
mm[nm[2020-Bm;n]; iv Am; n]            / card that ends at position 2020
\\
