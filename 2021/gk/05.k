/ AoC 2021 day 5: hydrothermal venture
t:" "_'0:"../05.in"
a:0$'","_'t@'0; b:0$'","_'t@'2
x1:a@'0; y1:a@'1; x2:b@'0; y2:b@'1
n:1+(abs x2-x1)|abs y2-y1
sx:{(x>0)-x<0}x2-x1; sy:{(x>0)-x<0}y2-y1
f:{[ii] c:@[1000000#0;,/{(x1[x]+sx[x]*!n x)+1000*y1[x]+sy[x]*!n x}'ii;+;1]; +/1<c}
f@&(x1=x2)|y1=y2             / part 1: horizontal/vertical overlaps
f@!#t                        / part 2: all lines
\\
