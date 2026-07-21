L:0:"../23.in"
ri:{ic[x 0]-97}
gv:{[r;t] $[(t 0) in "abcd"; r[ri t]; . t]}
isreg:{(x 0) in "abcd"}

tglop:{[t] op:t 0; $[2=#t; $[op~"inc";"dec";"inc"]; $[op~"jnz";"cpy";"jnz"]]}

run:{[a0]
  P:{" "_x}'L
  r:(a0;0;0;0)
  pc:0
  while[(~pc<0)&pc<#P;
    t:P pc; op:t 0
    if[op~"cpy"; if[isreg t 2; r[ri t 2]:gv[r;t 1]]; pc:pc+1]
    if[op~"inc"; if[isreg t 1; r[ri t 1]+:1]; pc:pc+1]
    if[op~"dec"; if[isreg t 1; r[ri t 1]-:1]; pc:pc+1]
    if[op~"jnz"; pc:pc+$[0=gv[r;t 1]; 1; gv[r;t 2]]]
    if[op~"tgl"; g:pc+gv[r;t 1]; if[(~g<0)&g<#P; P:@[P;g;:;@[P g;0;:;tglop P g]]]; pc:pc+1]]
  r 0}

fact:{*/1+!x}
p1:run 7
p1                                          / part 1
(fact 12)+p1-fact 7                         / part 2 = 12! + same offset
\\
