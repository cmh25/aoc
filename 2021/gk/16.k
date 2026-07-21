/ AoC 2021 day 16: packet decoder
B:,/{(4#2)vs x}'"0123456789ABCDEF"?/*0:"../16.in"
P:0; VS:0j
rdi:{r:2 sv B P+!x; P::P+x; r}
rd:{r:{[a;c;u](2j*a)+c}/[0j;B P+!x;nul]; P::P+x; r}
lval:{[u] v:0j; c:1j; while[c=1j; c:rd 1; v:(16j*v)+rd 4]; v}
opv:{[t] vals:()
 $[0=rdi 1; e:P+rdi 15; e:-1]
 if[e>0; while[P<e; vals:vals,,parse[]]]
 if[e<0; do[rdi 11; vals:vals,,parse[]]]
 $[t=0j;+/vals;t=1j;*/vals;t=2j;&/vals;t=3j;|/vals;t=5j;0j+(*vals)>vals 1;t=6j;0j+(*vals)<vals 1;0j+(*vals)=vals 1]}
parse:{[u] VS::VS+rd 3; t:rd 3; $[t=4j;lval[];opv t]}
r:parse[]
VS                           / part 1: version sum
r                            / part 2: evaluate the expression
\\
