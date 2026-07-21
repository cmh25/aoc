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
/ ---- day 13 ----
prog:pp@*0:"../13.in"
sg:{(x>0)-x<0}
boot[prog;()]; run[]
nt:(#OUT)div 3; T:(nt,3)#OUT
+/T[;2]=2
/ part2: free play, joystick = sign(ballx - paddlex)
boot[prog;()]; @[`MEM;0;:;2j];
bx:0; px:0; score:0
while[~HALT;
  run[];
  nt:(#OUT)div 3; T:(nt,3)#OUT; OUT::();
  si:&(T[;0]=-1)&T[;1]=0; if[#si; score::*|T[si;2]];
  bi:&T[;2]=4; if[#bi; bx::T[*|bi;0]];
  pi:&T[;2]=3; if[#pi; px::T[*|pi;0]];
  INQ::INQ,sg bx-px]
score
\\
