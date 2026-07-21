L:0:"../21.in"

rotl:{[s;r] w:#s; s@((!w)+r)!w}                 / rotate left by r
rotr:{[s;r] rotl[s; (#s)-r!#s]}                 / rotate right by r

apply:{[s;line]
  t:" "_line
  if[(t 0)~"swap";
     if[(t 1)~"position"; i:0$t 2; j:0$t 5; s:@[s;(i;j);:;s(j;i)]]
     if[(t 1)~"letter"; i:s?*t 2; j:s?*t 5; s:@[s;(i;j);:;s(j;i)]]]
  if[(t 0)~"rotate";
     if[(t 1)~"left"; s:rotl[s;0$t 2]]
     if[(t 1)~"right"; s:rotr[s;0$t 2]]
     if[(t 1)~"based"; i:s?*t 6; s:rotr[s;1+i+(3<i)]]]
  if[(t 0)~"reverse"; i:0$t 2; j:0$t 4; x:i+!1+j-i; s:@[s;x;:;|s@x]]
  if[(t 0)~"move"; i:0$t 2; j:0$t 5; c:s i; r:s di i; s:(j#r),c,j_r]
  s}

scramble:{[s0] s:s0; i:0; while[i<#L; s:apply[s;L i]; i:i+1]; s}

scramble "abcdefgh"                              / part 1

/ part 2: find the password that scrambles to fbgdceah
perms:{[v] $[1=#v; ,v; ,/{(v x),'perms v di x}'!#v]}
P:perms "abcdefgh"
*P@&{"fbgdceah"~scramble x}'P
\\
