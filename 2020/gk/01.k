/ AoC 2020 day 1: report repair
v:0$'0:"../01.in"
h:2020-v; i:*&h lin v; v[i]*h[i]           / part 1: pair summing to 2020
p2:{r:0;i:0;while[r=0;c:(2020-v[i])-v;m:c lin v;if[|/m;j:*&m;r:v[i]*v[j]*c[j]];i:i+1];r}
p2[]                                       / part 2: triple summing to 2020
\\
