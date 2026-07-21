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
/ ---- day 11 ----
prog:pp@*0:"../11.in"
enc:{[x;y](100000j*x+1000)+y+1000}
DX:0 1 0 -1; DY:-1 0 1 0            / up,right,down,left
colorAt:{i:kx?x; $[i<#kx; cx i; 0]}
paint:{[k;c] i:kx?k; if[i<#kx; @[`cx;i;:;c]]; if[i=#kx; kx::kx,k; cx::cx,c]}
robot:{[start]
 boot[prog;()]; kx::(); cx::(); px:0; py:0; hd:0;
 if[start=1; kx::,enc[0;0]; cx::,1];
 while[~HALT;
   INQ::INQ,colorAt enc[px;py];
   run[];
   if[1<#OUT; c:OUT 0; t:OUT 1; OUT::();
      paint[enc[px;py];c];
      hd:$[t=0;(hd+3)!4;(hd+1)!4];
      px:px+DX hd; py:py+DY hd]];
 }
robot 0
#kx
/ part2
robot 1
wk:kx@&cx=1                          / white panel keys
X:(wk div 100000)-1000
Y:(wk!100000)-1000
x0:&/X; y0:&/Y
h:1+(|/Y)-y0; w:1+(|/X)-x0
flat:@[(h*w)#" "; ((Y-y0)*w)+X-x0; :; "#"]   / scatter via flat index
(h,w)#flat
\\
