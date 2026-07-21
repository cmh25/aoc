/ ---- Intcode ----
pp:{x:","_x; {$[(*x)="-"; 0j-0j$1_x; 0j$x]}'x}   / parse comma prog to longs (signed)
boot:{[p;ins] MEM::p,(16384-#p)#0j; IP::0j; RB::0j; INQ::ins; OUT::(); HALT::0}
run:{RUN::1;
 while[RUN;
  o:MEM IP; op:o!100;
  m1:(o div 100)!10; m2:(o div 1000)!10; m3:(o div 10000)!10;
  a:MEM[IP+1];
  if[op=99; RUN::0; HALT::1];
  if[op=3; e:0<#INQ; if[e; @[`MEM;$[m1=2;RB+a;a];:;*INQ]; INQ::1_INQ; IP::IP+2]; if[~e; RUN::0]];
  if[op=4; OUT::OUT,$[m1=1;a;m1=2;MEM RB+a;MEM a]; IP::IP+2];
  if[op=9; RB::RB+$[m1=1;a;m1=2;MEM RB+a;MEM a]; IP::IP+2];
  if[(op=1)|(op=2)|(op=5)|(op=6)|(op=7)|(op=8);
     b:MEM[IP+2];
     v1:$[m1=1;a;m1=2;MEM RB+a;MEM a];
     v2:$[m2=1;b;m2=2;MEM RB+b;MEM b];
     if[op=5; IP::$[~v1=0;v2;IP+3]];
     if[op=6; IP::$[v1=0;v2;IP+3]];
     if[(op=1)|(op=2)|(op=7)|(op=8);
        d:$[m3=2;RB+MEM[IP+3];MEM[IP+3]];
        @[`MEM;d;:;$[op=1;v1+v2; op=2;v1*v2; op=7;v1<v2; v1=v2]]; IP::IP+4]]];
 }
/ ---- day 15 ----
prog:pp@*0:"../15.in"
boot[prog;()];
DX:0 0 0 -1 1; DY:0 -1 1 0 0    / dir 1=N 2=S 3=W 4=E
rv:0 2 1 4 3
enc:{[x;y](100000j*x+1000)+y+1000}
mv:{INQ::INQ,x; run[]; r:*|OUT; OUT::(); r}
vis::,enc[0;0]; walls::(); oxy::0j
explore:{[x;y] d:1;
  while[d<5;
    nx:x+DX d; ny:y+DY d; k:enc[nx;ny];
    if[~(k in vis)|k in walls;
       r:mv d;
       if[r=0; walls::walls,k];
       if[~r=0; vis::vis,k; if[r=2; oxy::k]; explore[nx;ny]; mv rv d]];
    d+:1]}
explore[0;0]
/ BFS on open cells (vis)
dx4:0 0 -1 1; dy4:-1 1 0 0
nbrs:{[k] x:(k div 100000)-1000; y:(k!100000)-1000; nk:enc'[x+dx4;y+dy4]; nk@&nk lin vis}
bfsd:{[src] seen:,src; fr:,src; d:0; D:,0;
  while[#fr; nx:?,/nbrs'fr; nw:nx@&~nx lin seen; seen:seen,nw; D:D,(#nw)#d+1; fr:nw; d+:1];
  (seen;D)}
sd:bfsd enc[0;0]
(sd 1)@(sd 0)?oxy
|/(bfsd oxy)1
\\
