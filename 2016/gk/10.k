L:0:"../10.in"

N:256
chips:{()}'!N                    / chips held by each bot
outs:N#-1                        / output bins
rlt:N#" "; rli:N#0; rht:N#" "; rhi:N#0   / each bot's low/high targets

/ parse rules and seed values
seed:()
i:0
while[i<#L;
  t:" "_L i
  if[t[0]~"value"; seed:seed,,(0$t 5;0$t 1)]      / (bot; value)
  if[t[0]~"bot";
     b:0$t 1
     rlt[b]:t 5; rli[b]:0$t 6; rht[b]:t 10; rhi[b]:0$t 11]
  i:i+1]

add:{[b;v] chips[b]::chips[b],v}
{add[x 0;x 1]}'seed;             / hand out the seed chips

ans1:-1
step:{[b]
  cs:chips b; lo:&/cs; hi:|/cs
  chips[b]::()
  if[(lo=17)&hi=61; ans1::b]
  $[rlt[b]~"bot"; add[rli b;lo]; outs[rli b]::lo]
  $[rht[b]~"bot"; add[rhi b;hi]; outs[rhi b]::hi]}

while[|/2=#'chips; step[*&2=#'chips]]
ans1                             / part 1
outs[0]*outs[1]*outs[2]          / part 2
\\
