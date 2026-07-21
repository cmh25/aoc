L:0:"../04.in"
S:L@<L                         / chronological: timestamp is the line prefix
mi:{0$x[15 16]}'S              / minute field
k:S[;19]                       / G(uard) / f(alls) / w(akes)
gs:()
ms:()
g:0
st:0
i:0
while[i<#S
  c:k i
  if[c="G"; g::0$1_(" "_S i)3]
  if[c="f"; st::mi i]
  if[c="w"; d:(mi i)-st; ms::ms,st+!d; gs::gs,d#g]
  i+:1]
tot:#'=gs
bg:(?gs)@*&tot=|/tot           / sleepiest guard
mn:ms@&gs=bg
c:#'=mn
bg*(?mn)@*&c=|/c
key:ms+60*gs
c:#'=key
b:(?key)@*&c=|/c
(b div 60)*b!60
\\
