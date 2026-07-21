/ AoC 2022 day 22: monkey map (part 2: generic cube fold, doubled 3d coords)
L0:0:"../22.in"
b:*&0=#'L0
mp:b#L0
cw:|/#'mp
GR:{x,(cw-#x)#" "}'mp
nr:#GR
fs:_sqrt(+/,/~GR=" ")%6
nbr:nr div fs; nbc:cw div fs
NF:0; FB:(nbr,nbc)#-1; FO:()
{[br] {[bc] if[~" "=GR[fs*br;fs*bc]; FB[br;bc]::NF; FO::FO,,(br,bc); NF::NF+1]}'!nbc}'!nbr;
cx:{((x[1]*y 2)-x[2]*y 1;(x[2]*y 0)-x[0]*y 2;(x[0]*y 1)-x[1]*y 0)}
O3:NF#,0 0 0; R3:NF#,0 0 0; C3:NF#,0 0 0
O3[0]:1 1 0; R3[0]:0 2 0; C3[0]:2 0 0
vis:@[NF#0;0;:;1]; q:,0
gg:{[i;j] $[(i<0)|(j<0)|(i>nbr-1)|j>nbc-1; -1; FB[i;j]]}
att:{[g;oo;rw;cl] if[~vis g; vis[g]::1; O3[g]::oo; R3[g]::rw; C3[g]::cl; q::q,g]}
while[0<#q
 f:*q; q:1_q
 br:FO[f;0]; bc:FO[f;1]
 o:O3 f; rv:R3 f; cv:C3 f; n:(cx[cv;rv])div 2
 g:gg[br;bc+1]; if[g>-1; att[g; o+((fs-1)*cv)+(cv+n)div 2; rv; n]]
 g:gg[br;bc-1]; if[g>-1; att[g; (o+(n-cv)div 2)+(fs-1)*n; rv; -1*n]]
 g:gg[br+1;bc]; if[g>-1; att[g; o+((fs-1)*rv)+(rv+n)div 2; n; cv]]
 g:gg[br-1;bc]; if[g>-1; att[g; (o+(n-rv)div 2)+(fs-1)*n; -1*n; cv]]]
enc:{x[0]+(2*fs+1)*x[1]+(2*fs+1)*x 2}
RCI:,/{x,'!fs}'!fs
E3:,/{[f] enc'({(O3[f]+x[0]*R3 f)+x[1]*C3 f}'RCI)}'!NF
RMN:*'&'~GR=" "; RMX:*'|'&'~GR=" "
tg:+GR
CMN:*'&'~tg=" "; CMX:*'|'&'~tg=" "
P:L0 b+1
tp:&(P="R")|P="L"
PN:0$'{P x[0]+!x[1]-x 0}'+(0,1+tp;tp,#P)
PT:P tp
nxt1:{$[HH=0; (RR;RMN RR;0); HH=2; (RR;RMX RR;2); HH=1; (CMN CC;CC;1); (CMX CC;CC;3)]}
nxt2:{f:FB[RR div fs;CC div fs]; lr:RR!fs; lc:CC!fs
 o:O3 f; rv:R3 f; cv:C3 f; n:(cx[cv;rv])div 2
 m:$[HH=0;cv;HH=1;rv;HH=2;-1*cv;-1*rv]
 p:((o+lr*rv)+lc*cv)+(m+n)div 2
 j:E3?enc p
 g:j div fs*fs; k:j!fs*fs; lr2:k div fs; lc2:k!fs
 h2:$[n~C3 g;0;n~R3 g;1;n~-1*C3 g;2;3]
 ((FO[g;0]*fs)+lr2;(FO[g;1]*fs)+lc2;h2)}
nxt:{r2:RR+0 1 0 -1@HH; c2:CC+1 0 -1 0@HH
 inb:$[(r2<0)|(c2<0)|(r2>nr-1)|c2>cw-1; 0; ~" "=GR[r2;c2]]
 $[inb; (r2;c2;HH); W2; nxt2[]; nxt1[]]}
mvn:{[nn] k:nn; bl:0
 while[(k>0)&~bl
  t:nxt[]; ch:GR[t 0;t 1]
  if[ch="#"; bl:1]
  if[~ch="#"; RR::t 0; CC::t 1; HH::t 2]
  k:k-1]}
wlk:{[w2] W2::w2; RR::0; CC::*&GR[0]="."; HH::0; i:0
 while[i<#PN
  mvn PN i
  if[i<#PT; HH::(HH+$[(PT i)="R";1;3])!4]
  i:i+1]
 (1000*RR+1)+(4*CC+1)+HH}
wlk 0                        / part 1: flat wrap
wlk 1                        / part 2: cube wrap
\\
