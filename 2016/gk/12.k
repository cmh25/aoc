L:{" "_x}'0:"../12.in"

/ pre-compile: each instr -> (op; k1; v1; k2; v2)   op 0cpy 1inc 2dec 3jnz; k 1=register
tok:{$[(x 0) in "abcd"; (1;ic[x 0]-97); (0;. x)]}   / -> (kind; value/regidx)
comp:{[t] op:("cpy";"inc";"dec";"jnz")?t 0
  a:tok t 1
  b:$[2<#t; tok t 2; (0;0)]
  (op;a 0;a 1;b 0;b 1)}
P:comp'L
NP:#P

run:{[c0]
  r:(0;0;c0;0)
  pc:0
  while[(~pc<0)&pc<NP;
    q:P pc; op:q 0
    v1:$[q 1; r q 2; q 2]
    if[op=0; r[P[pc;4]]:v1; pc:pc+1]        / cpy v1 -> reg (arg2 is a register idx)
    if[op=1; r[q 2]+:1; pc:pc+1]            / inc
    if[op=2; r[q 2]-:1; pc:pc+1]            / dec
    if[op=3; pc:pc+$[0=v1; 1; $[q 3; r q 4; q 4]]]]   / jnz
  r 0}

run 0
run 1
\\
