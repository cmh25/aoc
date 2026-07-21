tb:ci 9
b:0$tb_*0:"../06.in"
n:#b
step:{[b] m:*&b=|/b; v:b m
  b:@[b;m;:;0]+v div n                          / zero the max bank, spread the base
  @[b;(m+1+!v!n)!n;+;1]}                         / +1 to the next (v mod n) banks
seen:()
while[~(#seen)>seen?b; seen,:,b; b:step b]        / until a state recurs
#seen                                             / part 1
(#seen)-seen?b                                   / part 2: loop length
\\
