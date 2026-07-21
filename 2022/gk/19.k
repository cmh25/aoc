/ AoC 2022 day 19: not enough minerals
ns:{c:(x>"/")&x<":"; t:" "_@[x;&~c;:;" "]; 0$'t@&0<#'t}'0:"../19.in"
go:{[t;re;bo;g]
 if[g>best; best::g]
 if[best<g+_0.5*t*t-1
  {[k] sk:$[k<3; ~bo[k]<mx k; 0]
   if[~sk
    c:CM k; d:c-re
    w:|/0,{[j] $[d[j]>0; $[0=bo j; 99; (d[j]+bo[j]-1)div bo j]; 0]}'!3
    tn:t-w+1
    if[tn>0
     bo2:bo; g2:g
     if[k<3; bo2[k]:1+bo2 k]
     if[k=3; g2:g2+tn]
     go[tn;(re+bo*w+1)-c;bo2;g2]]]}'!4]}
sol:{[row;tm]
 CM::(row[1],0,0;row[2],0,0;(row 3;row 4;0);(row 5;0;row 6))
 mx::(|/CM[;0]),row[4],row 6
 best::0
 go[tm;0 0 0;1 0 0;0]
 best}
+/{x[0]*sol[x;24]}'ns       / part 1: sum of id * geodes in 24 min
*/sol[;32]'3#ns           / part 2: product of first three, 32 min
\\
