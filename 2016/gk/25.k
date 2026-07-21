L:{" "_x}'0:"../25.in"
tok:{$[(x 0) in "abcd"; (1;ic[x 0]-97); (0;. x)]}
comp:{[t] op:("cpy";"inc";"dec";"jnz";"out")?t 0
  a:tok t 1
  b:$[2<#t; tok t 2; (0;0)]
  (op;a 0;a 1;b 0;b 1)}
P:comp'L
NP:#P

test:{[a0]
  r:(a0;0;0;0); pc:0; no:0
  while[(pc<NP)&no<40;
    q:P pc; op:q 0; v1:$[q 1; r q 2; q 2]
    if[op=0; r[q 4]:v1; pc:pc+1]
    if[op=1; r[q 2]+:1; pc:pc+1]
    if[op=2; r[q 2]-:1; pc:pc+1]
    if[op=3; pc:pc+$[0=v1; 1; $[q 3; r q 4; q 4]]]
    if[op=4; if[~v1=no!2; :0]; no:no+1; pc:pc+1]]
  1}

a:1; while[~test a; a:a+1]; a
\\
