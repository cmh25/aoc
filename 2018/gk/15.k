L:0:"../15.in"
W:#*L
H:#L
NC:W*H
F:,/L
WALL:F="#"
NB:(-W),(-1),1,W
P0:&F lin "GE"
T0:"GE"?/F P0
bfs:{[s] d:NC#9999; d[s]:0; fr:,s; k:0
  while[#fr
    k+:1
    nb:(fr-W),(fr-1),(fr+1),(fr+W)
    nb:?nb@&(9999=d nb)&~BL nb
    if[#nb; d[nb]:k]
    fr:nb]
  d}
adje:{[i] a:(UP i)+NB
  c:&(OC a)>0
  k:-1+OC a@c
  k@&~UT[k]=UT i}
mov:{[i;en]
  BL::WALL|OC>0
  t:,/{(UP x)+NB}'en
  t:?t@&~BL t
  if[~#t; :0]
  d:bfs UP i
  r:d t
  if[9999=&/r; :0]
  b:&/t@&r=&/r
  d2:bfs b
  nb:(UP i)+NB
  nb:nb@&~BL nb
  if[~#nb; :0]
  dd:d2 nb
  if[9999=&/dd; :0]
  s:nb@*&dd=&/dd
  OC[UP i]::0
  UP[i]::s
  OC[s]::i+1}
atk:{[i] k:adje i
  if[~#k; :0]
  h:UH k
  t:k@*&h=&/h
  UH[t]::UH[t]-$[(UT i)=1; EPW; 3]
  if[UH[t]<1; UA[t]::0; OC[UP t]::0]}
turn:{[i] en:&UA&~UT=UT i
  if[~#en; ended::1; :0]
  if[~#adje i; mov[i;en]]
  atk i}
sim:{[pw] EPW::pw
  n:#P0
  OC::NC#0
  UP::P0; UT::T0; UH::n#200; UA::n#1
  OC[UP]::1+!n
  rounds:0
  ended::0
  while[~ended
    o:&UA
    o:o@<UP o
    j:0
    while[(j<#o)&~ended
      i:o j
      if[UA i; turn i]
      j+:1]
    if[~ended; rounds+:1]]
  (rounds*+/UH@&UA; +/(UT@&~UA)=1)}
(sim 3) 0
p:3
r:0 1
while[r 1; p+:1; r:sim p]     / raise elf power until no elf dies
r 0
\\
