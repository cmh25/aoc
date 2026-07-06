/ AoC 2024 day 15: warehouse woes
L:0:"../15.in"
k:L?""
G0:k#L
M:,/(1+k)_L
NM:#M
DR:-1 1 0 0; DC:0 0 -1 1

/ part 1
G:G0
NC:#G 0
p0:*&(,/G)="@"
a:_p0%NC; b:p0!NC
i:0
while[i<NM
 d:"^v<>"?M i; dr:DR d; dc:DC d
 j:1; while["O"=G[a+j*dr;b+j*dc]; j+:1]
 t:G[a+j*dr;b+j*dc]
 if[t="."
  G[a+j*dr;b+j*dc]:"O"; G[a+dr;b+dc]:"@"; G[a;b]:"."
  a+:dr; b+:dc]
 i+:1]
w:&(,/G)="O"
+/(100*_w%NC)+w!NC                / part 1: sum of O GPS coords

/ part 2: map doubled -- # -> ##, O -> [], . -> .., @ -> @.; sum GPS of [ cells
G:{,/{$["#"=x;"##";"O"=x;"[]";"."=x;"..";"@."]}'x}'G0
NC:#G 0
p0:*&(,/G)="@"
a:_p0%NC; b:p0!NC
i:0
while[i<NM
 d:"^v<>"?M i; dr:DR d; dc:DC d
 if[0=dr
  j:1; while[("["=G[a;b+j*dc])|"]"=G[a;b+j*dc]; j+:1]
  if["."=G[a;b+j*dc]
   G[a;b+dc*1+!j]:G[a;b+dc*!j]; G[a;b]:"."; b+:dc]]
 if[~0=dr
  t:G[a+dr;b]
  ok:0; LV:()
  if["."=t; ok:1]
  if[("["=t)|"]"=t
   ok:1; CS:,$["["=t;b;b-1]; rr:a+dr
   while[ok&0<#CS
    LV:LV,,(rr;CS)
    cc:?CS,CS+1; hv:G[rr+dr]@cc
    if[|/"#"=hv; ok:0]
    if[ok; CS:?(cc@&"["=hv),(cc@&"]"=hv)-1; rr:rr+dr]]]
  if[ok
   q:-1+#LV
   while[~q<0
    rw:LV[q;0]; cl:LV[q;1]
    G[rw+dr;cl]:"["; G[rw+dr;cl+1]:"]"
    G[rw;cl]:"."; G[rw;cl+1]:"."
    q-:1]
   G[a+dr;b]:"@"; G[a;b]:"."; a+:dr]]
 i+:1]
w:&(,/G)="["
+/(100*_w%NC)+w!NC                / part 2: sum GPS of box left edges
\\
