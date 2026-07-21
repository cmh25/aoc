G:0:"../24.in"
R:#G; C:#*G
dig:"0123456789"

/ locate POIs -> P[d] = cell index r*C+c
found:()
r:0
while[r<R; row:G r; c:0
  while[c<C; if[(row c) in dig; found:found,,(0$,row c; (r*C)+c)]; c:c+1]
  r:r+1]
np:#found
P:{x 1}'found@<{x 0}'found                / cells sorted by digit

wall:{"#"=(G x div C)x!C}

bfs:{[start]
  D:(R*C)#-1; D[start]:0
  fr:,start; d:0
  while[0<#fr;
    nf:(); j:0
    while[j<#fr; k:fr j; kr:k div C; kc:k!C
      nb:(((kr-1)*C)+kc; ((kr+1)*C)+kc; k-1; k+1)
      nb:nb@&{(~wall x)&(D x)<0}'nb
      D[nb]:d+1
      nf:nf,nb
      j:j+1]
    fr:?nf; d:d+1]
  D}

DM:{[i] (bfs P i)@P}'!np                   / POI-to-POI distance matrix

perms:{[v] $[1=#v; ,v; ,/{(v x),'perms v di x}'!#v]}
PM:perms 1+!np-1

cost:{[perm] path:0,perm; +/{DM . x}'(-1_path),'1_path}
&/cost'PM                                  / part 1: shortest path from 0
&/{(cost x)+DM[*|x;0]}'PM                   / part 2: return to 0
\\
