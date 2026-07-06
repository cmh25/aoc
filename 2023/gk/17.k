/ AoC 2023 day 17: clumsy crucible
G:-48+ic(0:"../17.in")
n:#G
GT:+G
GR:|G
GTR:|GT
h0:.[(n,#*G)#2000000;0 0;:;0]
dn:{[X;G2] p:+\G2; p+&/{(#x)#((y,#*x)#2000000),(-y)_x}[X-p]'K}   / min-plus relax: runs of K cells downward
step:{h:*x; v:x 1; (h&+dn[+v;GT]&|dn[|+v;GTR]; v&dn[h;G]&|dn[|h;GR])}
best:{r:step/(h0;h0); (&/r)[n-1;-1+#*G]}
K:1+!3
best 0                                 / part 1: 1-3 straight then turn
K:4+!7
best 0                                 / part 2: ultra crucible, 4-10 straight
\\
