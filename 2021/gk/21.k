/ AoC 2021 day 21: dirac dice
p:0$'28_'0:"../21.in"
pos:p-1; sc:0 0; r:0; t:0
while[&/sc<1000; pos[t]:(pos[t]++/1+(r+!3)!100)!10; sc[t]:sc[t]+1+pos t; r:r+3; t:1-t]
r*&/sc                       / part 1: losing score * rolls
I:!44100
p1v:I!10; p2v:(I div 10)!10; s1v:(I div 100)!21; s2v:I div 2100
rw:1 3 6 7 6 3 1
mf:{[pv;qv;r] np:(pv+r)!10; ns:qv+np+1; (np;ns;~ns<21)}
mvs:mf'[7#,p1v;7#,s1v;3+!7]
mv2:mf'[7#,p2v;7#,s2v;3+!7]
C:@[44100#0j;(p[0]-1)+10*p[1]-1;:;1j]; W1:0j; W2:0j; t:0
while[0<+/C
 NC:44100#0j
 if[t=0; {[k] m:mvs k; np:m 0; ns:m 1; wn:m 2; wj:0j+rw k; W1::W1++/wj*C*wn; NC::@[NC;np+(10*p2v)+(100*ns*~wn)+2100*s2v;+;wj*C*~wn]}'!7]
 if[t=1; {[k] m:mv2 k; np:m 0; ns:m 1; wn:m 2; wj:0j+rw k; W2::W2++/wj*C*wn; NC::@[NC;p1v+(10*np)+(100*s1v)+2100*ns*~wn;+;wj*C*~wn]}'!7]
 C:NC; t:1-t]
W1|W2                        / part 2: winning universes
\\
