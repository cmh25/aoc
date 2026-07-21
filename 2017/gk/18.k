T:{" "_x}'0:"../18.in"
az:"abcdefghijklmnopqrstuvwxyz"
ri:{-97+ic*x}
n:#T
/ part 1: single program, snd/rcv are sound played/recovered
gv:{$[(*x) in az; R@-97+ic*x; 0j+. x]}
R::26#0j; pc:0; snd:0j; ans:0
while[(pc>-1)&(pc<n)&ans=0
  t:T pc; op:t 0
  if[op~"set"; R[ri t 1]:gv t 2]
  if[op~"add"; j:ri t 1; R[j]:R[j]+gv t 2]
  if[op~"mul"; j:ri t 1; R[j]:R[j]*gv t 2]
  if[op~"mod"; j:ri t 1; R[j]:R[j]!gv t 2]
  if[op~"snd"; snd::gv t 1]
  if[op~"rcv"; if[~0=gv t 1; ans:snd]]
  jmp:$[(op~"jgz")&0j<gv t 1; (gv t 2)-1; 0]
  pc:pc+1+jmp]
ans
/ part 2: two programs, cross-fed queues; count program 1's sends
gvi:{[id;tok] $[(*tok) in az; R[id;-97+ic*tok]; 0j+. tok]}
R::2 26#0j
R[1;ri"p"]:1j
PC::0 0
Q::(();())
C1::0
run:{[id] o:1-id; prog:0
  while[1
    p:PC id
    if[(p<0)|~p<n; :prog]
    t:T p; op:t 0
    if[op~"set"; R[id;ri t 1]:gvi[id;t 2]]
    if[op~"add"; j:ri t 1; R[id;j]:R[id;j]+gvi[id;t 2]]
    if[op~"mul"; j:ri t 1; R[id;j]:R[id;j]*gvi[id;t 2]]
    if[op~"mod"; j:ri t 1; R[id;j]:R[id;j]!gvi[id;t 2]]
    if[op~"snd"; Q[o]:Q[o],gvi[id;t 1]; if[id=1; C1+:1]]
    if[op~"rcv"; if[0=#Q id; :prog]; R[id;ri t 1]:*Q id; Q[id]:1_Q id]
    jmp:$[(op~"jgz")&0j<gvi[id;t 1]; (gvi[id;t 2])-1; 0]
    PC[id]:p+1+jmp
    prog:1]}
while[(run 0)|run 1; ]
C1
\\
