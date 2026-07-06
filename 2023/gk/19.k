/ AoC 2023 day 19: aplenty
L:0:"../19.in"
b:L?""
W:b#L
P:{0$2_'","_-1_1_x}'(b+1)_L            / parts as n x 4 (x m a s)
nw:#W
nms:({(x?"{")#x}'W),((,"A");,"R")
prs:{","_-1_(1+x?"{")_x}'W             / rule strings per workflow
RV:{"xmas"?/*'-1_x}'prs                / var index per cond
RO:{">"=x@'1}'-1_'prs                  / 1 for >
RC:{0$2_'(x?\":")#'x}'-1_'prs
RD:{c:-1_x; (nms?/(1+c?\":")_'c),nms?*|x}'prs   / cond dests then default
w0:nms?"in"
run:{w:w0; while[w<nw; v:x RV w; c:((~RO w)&v<RC w)|(RO w)&v>RC w; w:(RD w)c?1]; w=nw}
+/,/P@&run'P                           / part 1: sum of ratings of accepted parts
WS:,w0                                 / part 2: [lo;hi] boxes through the rule tree
BS:,(4#1j),4#4000j
acc:0j
while[0<#WS
 w:*|WS; g:*|BS; WS:-1_WS; BS:-1_BS
 if[w=nw; acc:acc+*/1+g[4+!4]-g@!4]
 if[w<nw
  lo:4#g; hi:4_g; nr:#RV w; i:0; alive:1
  while[alive&i<nr
   vi:RV[w]i; cv:RC[w]i; d:RD[w]i
   if[RO[w]i; s:(lo vi)|cv+1; if[~s>hi vi; WS,:d; BS,:,@[lo;vi;:;s],hi]; hi[vi]:(hi vi)&cv]
   if[~RO[w]i; s:(hi vi)&cv-1; if[~s<lo vi; WS,:d; BS,:,lo,@[hi;vi;:;s]]; lo[vi]:(lo vi)|cv]
   alive:~(lo vi)>hi vi; i:i+1]
  if[alive; WS,:RD[w]nr; BS,:,lo,hi]
  ]
 ]
acc
\\
