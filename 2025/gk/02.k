/ AoC 2025 day 2: invalid IDs. P1: half repeated twice = h*(10^d+1), closed form.
/ P2: any block repeated k>=2 times: enumerate sparse candidates h*R, dedup, filter.
cs:","_,/0:"../02.in"          / join lines: input may be wrapped
cs:cs@&0<#'cs                 / drop empty piece from trailing comma
t:+0j$''"-"_'cs
a:t 0
b:t 1
f:{p:*/x#10j; m:p+1j; lo:(p div 10)|(a+m-1)div m; hi:(p-1)&b div m; n:0j|1+hi-lo; +/(m*n*(lo+hi))div 2}
+/f'1+!9                      / part 1: arithmetic-series sum per (range;d)
MB:|/b
prs:,/{x,'w@&0=x!'w:1+!x-1}'2+!17    / (length;block) with block|length (! on a list = rotate, so !')
g:{[P] L:P 0; d:P 1; pd:*/d#10j; R:+/*\1j,((L div d)-1)#pd; lo:*/(d-1)#10j; $[(R*lo)>MB; !0; R*lo+!9*lo]}
C:?,/g'prs                    / all invalid IDs <= MB, deduped (e.g. 1111 from d=1 and d=2)
+/C@&|/{(~x>C)&~C>y}'[a;b]    / part 2: sum those inside any range
\\
