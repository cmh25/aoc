/ AoC 2020 day 8: handheld halting
t:" "_'0:"../08.in"
op:*'t; ns:{*|x}'t
ar:{(1-2*"-"=x 0)*0$1_x}'ns                     / op strings, signed args
run:{[op] n:#op; pc:0; acc:0; seen:n#0          / -> (acc; terminated?)
 while[$[(pc<n)&~pc<0;~seen pc;0]
  seen[pc]:1; o:op pc; a:ar pc
  acc:acc+a*o~"acc"; pc:pc+$[o~"jmp";a;1]]
 (acc;~pc<n)}
*run op                                          / part 1: acc at first repeat
p2:{i:0;r:0;while[r=0
  o:op i
  if[~o~"acc";res:run@[op;i;:;$[o~"jmp";"nop";"jmp"]];if[res 1;r:res 0]]
  i:i+1];r}
p2[]                                             / part 2: acc when patched to halt
\\
