L:" "_'0:"../22.in"
bh0:0$L[0;2]; xd:0$L[1;1]
best:0
/ state st: (php;mana;bhp;shieldT;poisonT;rechT;spent)
proc:{[st] if[st[4]>0; st[2]-:3]; if[st[5]>0; st[1]+:101]
  st[3]:0|st[3]-1; st[4]:0|st[4]-1; st[5]:0|st[5]-1; st}
pturn:{[st;hard]
  if[hard; st[0]-:1; if[st[0]<1; :0]]
  st:proc st
  if[st[2]<1; if[st[6]<best; best::st 6]; :0]
  m:st 1; sp:st 6
  if[(m>52)&(sp+53)<best; s2:st+0; s2[1]-:53; s2[6]+:53; s2[2]-:4; bturn[s2;hard]]
  if[(m>72)&(sp+73)<best; s2:st+0; s2[1]-:73; s2[6]+:73; s2[2]-:2; s2[0]+:2; bturn[s2;hard]]
  if[(m>112)&((sp+113)<best)&0=st 3; s2:st+0; s2[1]-:113; s2[6]+:113; s2[3]:6; bturn[s2;hard]]
  if[(m>172)&((sp+173)<best)&0=st 4; s2:st+0; s2[1]-:173; s2[6]+:173; s2[4]:6; bturn[s2;hard]]
  if[(m>228)&((sp+229)<best)&0=st 5; s2:st+0; s2[1]-:229; s2[6]+:229; s2[5]:5; bturn[s2;hard]]
  0}
bturn:{[st;hard]
  if[st[2]<1; if[st[6]<best; best::st 6]; :0]
  st:proc st
  if[st[2]<1; if[st[6]<best; best::st 6]; :0]
  st[0]-:1|xd-7*st[3]>0
  if[st[0]<1; :0]
  pturn[st;hard]}
best:999999
pturn[(50;500;bh0;0;0;0;0);0];
best
best:999999
pturn[(50;500;bh0;0;0;0;0);1];
best
\\
