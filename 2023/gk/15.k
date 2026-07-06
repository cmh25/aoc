/ AoC 2023 day 15: lens library
steps:","_*0:"../15.in"
hash:{(+/(ic x)*1+16*|1+!#x)!256}             / closed form: 17^k = 1+16k mod 256
+/hash'steps                 / part 1: sum of step hashes
LB:256#,()
FC:256#,()
rem:{b:hash x; i:(LB b)?x; if[i<#LB b; LB[b]::(LB b)di i; FC[b]::(FC b)di i]}
ins:{b:hash x; i:(LB b)?x; if[i<#LB b; FC[b;i]::y]; if[i=#LB b; LB[b]::(LB b),,x; FC[b]::(FC b),y]}
{$[45=ic*|x; rem -1_x; ins[-2_x;-48+ic*|x]]}'steps;
+/(1+!256)*{+/(1+!#x)*x}'FC  / part 2: focusing power
\\
