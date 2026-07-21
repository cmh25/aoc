L:0:"../22.in"
sz:#L
dx:0 1 0 -1
dy:-1 0 1 0
/ part 1: 10000 bursts, clean<->infected, turn left(clean)/right(infected)
W:401; c:200
G::(W*W)#0
o:c-sz div 2
{[r] {[r;j] if["#"=L[r;j]; @[`G;(o+j)+W*o+r;:;1]]}[r;]'!sz}'!sz;
x:c; y:c; d:0; cnt:0
do[10000
  i:x+W*y
  d:$[G i; (d+1)!4; (d+3)!4]
  v:1-G i
  @[`G;i;:;v]
  if[v; cnt+:1]
  x+:dx d; y+:dy d]
cnt
/ part 2: 10M bursts, 4 states clean/weakened(2)/infected/flagged
W:1001; c:500
G::(W*W)#0
o:c-sz div 2
{[r] {[r;j] if["#"=L[r;j]; @[`G;(o+j)+W*o+r;:;2]]}[r;]'!sz}'!sz;
x:c; y:c; d:0; cnt:0
do[10000000
  i:x+W*y
  s:G i
  if[s=0; d:(d+3)!4; @[`G;i;:;1]]
  if[s=1; @[`G;i;:;2]; cnt+:1]
  if[s=2; d:(d+1)!4; @[`G;i;:;3]]
  if[s=3; d:(d+2)!4; @[`G;i;:;0]]
  x+:dx d; y+:dy d]
cnt
\\
