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
/ ---- day 7 ----
prog:pp@*0:"../07.in"
perm:{$[2>#x; ,x; ,/{[x;i](x i),/perm x di i}[x]'!#x]}
/ part1: amps in series, phases 0..4, signal threaded, each amp fresh
run1:{[sig;ph;c] boot[prog;(ph;sig)]; run[]; *|OUT}
chain:{run1/[0j; x; nul]}
|/chain'perm(0 1 2 3 4)
/ part2: feedback loop, phases 5..9, machines persist until E halts
ld:{MEM::x 0; IP::x 1; RB::x 2; INQ::x 3; OUT::x 4; HALT::x 5}
save:{(MEM;IP;RB;INQ;OUT;HALT)}
mk:{boot[prog;,x]; save[]}                 / new amp state, phase queued
loop:{[phs] st:mk'phs; sig:0j;
  while[~(st 4)5;                          / until amp E (index4) halted
    j:0;
    while[j<5; ld st j; INQ::INQ,sig; run[]; sig::*|OUT; OUT::(); st[j]:save[]; j+:1]];
  sig}
|/loop'perm(5 6 7 8 9)
\\
