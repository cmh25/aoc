/ AoC 2024 day 21: keypad conundrum
L:0:"../21.in"
NK:"7894561230A"
DP:(0 1;0 2;1 0;1 1;1 2)   / "^A<v>" key positions, gap 0 0
NP:(0 0;0 1;0 2;1 0;1 1;1 2;2 0;2 1;2 2;3 1;3 2)  / NK positions, gap 3 0
/ candidate move seqs a->b as dirpad key indices ending with press A(=1):
/ horizontal-first and vertical-first, dropping the one whose corner is the gap
pth:{[pa;pb;g] dc:(pb 1)-pa 1
 hh:(abs dc)#$[dc<0;2;4]; vv:(abs(pb 0)-pa 0)#$[(pb 0)<pa 0;0;3]
 cs:(); if[~(pa 0;pb 1)~g; cs:cs,,hh,vv,1]
 if[(~(pb 0;pa 1)~g)&~(vv,hh)~hh,vv; cs:cs,,vv,hh,1]
 cs}
gi:{w:1,x; (5*-1_w)+1_w}   / a seq as gather indices into a flat 5x5 cost matrix
GIDX:{[p] gi'pth[DP p 0;DP p 1;0 0]}',/{x,'!5}'!5
NIDX:{[p] gi'pth[NP p 0;NP p 1;3 0]}',/{x,'!11}'!11
mc:{[f;cs] &/{+/x y}[f]'cs}          / min over candidate seqs of summed cost
step:{[C] 5 5#mc[,/C]'GIDX}          / dirpad cost matrix through one more robot
slv:{[N;c] w:10,NK?/c; (0j$3#c)*+/(,/N)[(11*-1_w)+1_w]}   / complexity of a code
+/slv[11 11#mc[,/2 step/5 5#1j]'NIDX]'L     / part 1: 2 robot dirpads
/ part 2: 25 robot dirpads between you and the numpad
+/slv[11 11#mc[,/25 step/5 5#1j]'NIDX]'L
\\
