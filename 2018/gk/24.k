L:0:"../24.in"
TP:("bludgeoning";"cold";"fire";"radiation";"slashing")
gi:L?"Infection:"
gl:&{$[#x; 0<#ss[x;"units each"]; 0]}'L
U0:();HP:();DM0:();DT:();INI:();ARM:();WK:();IM:()
pg:{[j] g:L j
  t:" "_g
  dq:t?"does"
  wk:5#0
  im:5#0
  p:ss[g;"("]
  if[#p
    a:*p
    q:*ss[g;")"]
    inner:g@(1+a)+!(q-1)-a
    ps:";"_inner
    ii:0
    while[ii<#ps
      w:" "_ps ii
      w:w@&0<#'w
      ty:{TP?x@&~x=","}'2_w
      if[(w 0)~"weak"; wk[ty]:1]
      if[(w 0)~"immune"; im[ty]:1]
      ii+:1]]
  U0,:0$t 0
  HP,:0$t 4
  DM0,:0$t[1+dq]
  DT,:TP?t[2+dq]
  INI,:0$*|t
  ARM,:j>gi
  WK,:,wk
  IM,:,im}
pg'gl
n:#U0
dmv:{[i;t] e:u[i]*dm i
  $[IM[t;DT i]; 0; WK[t;DT i]; 2*e; e]}
pick:{[i] c:&(u>0)&(TK=0)&~ARM=ARM i
  if[~#c; :0]
  d:{dmv[i;x]}'c
  c:c@&d>0
  d:d@&d>0
  if[~#c; :0]
  c:c@&d=|/d
  e:u[c]*dm c
  c:c@&e=|/e
  s:c@*&(INI c)=|/INI c
  TG[i]::s
  TK[s]::1}
hit:{[i] if[u[i]<1; :0]
  t:TG i
  if[t<0; :0]
  if[u[t]<1; :0]
  k:(dmv[i;t]) div HP t
  k:k&u t
  u[t]::u[t]-k
  KT::KT+k}
sim:{[boost]
  u::U0
  dm::DM0+boost*~ARM
  while[1
    a:&u>0
    if[(~|/ARM a)|&/ARM a; :(*ARM a; +/u)]      / one army wiped out
    pw:u[a]*dm a
    o:a@>((0j+pw)*1000)+INI a                   / power desc, then initiative desc
    TK::n#0
    TG::n#-1
    pick'o
    KT::0
    hit'a@>INI a
    if[KT=0; :(-1;0)]]}
r:sim 0
r 1
b:1
r:sim 1
while[~0=*r; b+:1; r:sim b]                     / smallest boost that lets the immune system win
r 1
\\
