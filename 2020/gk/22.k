/ AoC 2020 day 22: crab combat
L:0:"../22.in"
gid:+\0=#'L
d1:0$'1_L@&(gid=0)&0<#'L
d2:0$'1_L@&(gid=1)&0<#'L
score:{+/x*(#x)-!#x}                             / top card weighted highest
play1:{[a;b] while[(0<#a)&0<#b
  x:*a;y:*b;a:1_a;b:1_b
  if[x>y;a:a,x,y]; if[y>x;b:b,y,x]]
 $[0<#a;a;b]}
score play1[d1;d2]                               / part 1
play2:{[a;b] seen:()
 while[(0<#a)&0<#b
  key:(a;b); if[key in seen;:(1;a)]; seen:seen,,key
  x:*a;y:*b;a:1_a;b:1_b
  w:$[(~x>#a)&~y>#b; (play2[x#a;y#b])0; $[x>y;1;2]]
  if[w=1;a:a,x,y]; if[w=2;b:b,y,x]]
 $[0<#a;(1;a);(2;b)]}
score(play2[d1;d2])1                             / part 2: recursive combat
\\
