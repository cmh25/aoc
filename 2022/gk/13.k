/ AoC 2022 day 13: distress signal
L:0:"../13.in"
pv:{$[(S P)="[";plist[];pnum[]]}
plist:{P::P+1; r:(); while[~(S P)="]"; r:r,,pv[]; if[(S P)=","; P::P+1]]; P::P+1; r}
pnum:{n:0; while[$[P<#S;((S P)>"/")&(S P)<":";0]; n:(10*n)+-48+ic S P; P::P+1]; n}
pk:{S::x; P::0; pv[]}'L@&0<#'L
cmp:{$[(@x)&@y; (x>y)-x<y; @x; cmp[,x;y]; @y; cmp[x;,y]; cl[x;y]]}
cl:{i:0; r:0; while[(r=0)&(i<#x)&i<#y; r:cmp[x i;y i]; i:i+1]; $[~r=0;r;((#x)>#y)-(#x)<#y]}
n2:(#pk)div 2
rs:cmp'[pk@2*!n2;pk@1+2*!n2]
+/1+&rs=-1                   / part 1: indices of ordered pairs
dva:,,2; dvb:,,6
(1++/-1=cmp[;dva]'pk)*2++/-1=cmp[;dvb]'pk   / part 2: divider positions
\\
