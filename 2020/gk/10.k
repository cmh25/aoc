/ AoC 2020 day 10: adapter array
v:0j$'0:"../10.in"
sd:v@<v; a:0j,sd,(*|sd)+3j                    / chain: outlet 0 .. device max+3
d:(1_a)-(-1_a)                                 / consecutive differences
(+/d=1)*+/d=3                                   / part 1
w:(#a)#0j; w[0]:1j
i:1; while[i<#a; dd:(a i)-a; w[i]:+/w@&(dd>0)&dd<4; i:i+1]
*|w                                            / part 2: number of arrangements
\\
