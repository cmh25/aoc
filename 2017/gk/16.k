mv:","_*0:"../16.in"
sw:{@[x;y;:;x@|y]}                               / swap positions in y
step:{[s;m;z] c:*m
  $[c="s"; (0-0$1_m)!s                            / spin (mind the -0$ fusion trap)
    c="x"; sw[s;0$'"/"_1_m]                        / exchange positions
    sw[s;(s?m 1),s?m 3]]}                          / partner: swap by name
dance:{step/[x;mv;0]}
S:"abcdefghijklmnop"
dance S                                          / part 1
p:1
c:dance S
while[~c~S; c:dance c; p+:1]                       / period: dances to return to S
(1000000000!p) dance/ S                            / part 2: 1e9 mod period
\\
