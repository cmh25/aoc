line:*0:"../01.in"
toks:","_ssr[line;" ";""]         / ("R1";"R3";...)
turns:*'toks                       / turn chars
mags:0$1_'toks                     / magnitudes

DX:0 1 0 -1                        / N E S W
DY:1 0 -1 0
x:0;y:0;d:0
path:,0 0                          / every intersection visited (start included)
i:0
while[i<#toks;
  d:(d+$[turns[i]="R";1;3])!4;
  do[mags i; x:x+DX d; y:y+DY d; path:path,,(x;y)];
  i:i+1]
(abs x)+abs y                      / part 1

/ part 2: first coordinate visited twice
seen:()
ans:0n
i:0
while[(i<#path)&ans~0n;
  p:path i;
  $[(#seen)>seen?p; ans:p; seen:seen,,p];
  i:i+1]
(abs ans 0)+abs ans 1
\\
