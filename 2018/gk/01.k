L:.'0:"../01.in"
n:#L
P:+\L
s:P n-1
s
f:*'=P                       / first-occurrence index of each distinct prefix sum
fd:&~(!n) lin f              / indices that repeat an earlier prefix sum
fd:$[#fd; *fd; n]            / first within-cycle repeat (n = none)
seen:,0
c:0
dn:0
while[~dn; V:P+c*s; h:&V lin seen; i:fd&$[#h; *h; n]; if[i<n; r:V i; dn:1]; if[~dn; seen,:V; c+:1]]
r
\\
