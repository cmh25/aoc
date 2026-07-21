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
/ ---- day 25: text adventure auto-solver ----
prog:pp@*0:"../25.in"
A:ci !128
lns:{(ci 10)_x}
rname:{ls:lns x; m:ls@&{(2#x)~"=="}'ls; $[#m; 3_(-3)_*m; ""]}
glist:{[x;hdr] ls:lns x; j:ls?hdr; res:(); k:j+1; while[$[$[j<#ls;k<#ls;0]; "- "~2#ls k; 0]; res:res,,2_ls k; k+:1]; res}
rdoors:{glist[x;"Doors here lead:"]}
ritems:{glist[x;"Items here:"]}
send:{[cmd] INQ::INQ,(ic cmd),10; run[]; t:A@OUT; OUT::(); t}
BAD:("infinite loop";"giant electromagnet";"escape pod";"molten lava";"photons")
opp:{$[x~"north";"south"; x~"south";"north"; x~"east";"west"; "east"]}
VIS::(); CKPATH::(); FLOORD::""; ITEMS::()
dfs:{[txt;path]
  nm:rname txt; VIS::VIS,,nm;
  {[it] if[~it in BAD; send "take ",it; ITEMS::ITEMS,,it]}'ritems txt;
  if[nm~"Security Checkpoint"; CKPATH::path];
  {[nm;path;d]
     ntxt:send d; nnm:rname ntxt;
     if[nnm~"Pressure-Sensitive Floor"; if[nm~"Security Checkpoint"; FLOORD::d]];
     if[~nnm~"Pressure-Sensitive Floor";
        if[nnm in VIS; send opp d];
        if[~nnm in VIS; dfs[ntxt; path,,d]; send opp d]]
  }[nm;path]'rdoors txt}
boot[prog;()]; run[]; t0:A@OUT; OUT::()
dfs[t0;()];
{send x}'CKPATH;
n:#ITEMS
{send "drop ",x}'ITEMS;
PW:1,*\24#2
held:n#0
res:-1; m:1; lim:_2^n
while[$[m<lim; res<0; 0];
  wnt:(m div PW@!n)!2;
  td:ITEMS@&held&~wnt; tk:ITEMS@&wnt&~held;
  {send "drop ",x}'td; {send "take ",x}'tk; held:wnt;
  ntxt:send FLOORD;
  if[0=#ss[ntxt;"Alert"]; res:0$ntxt@&ntxt lin "0123456789"];
  m+:1]
res
\\
