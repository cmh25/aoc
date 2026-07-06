/ AoC 2025 day 4: rolls (@) with <4 of 8 neighbors accessible.
/ P2: remove accessible rolls to fixpoint (converge). NB: global named z would
/ become the lambda's implicit 3rd param -- hence ZR.
L:0:"../04.in"
m:"@"=L
n:#m
w:#*m
ZR:(w+2)#0
os:(0 0;0 1;0 2;1 0;1 2;2 0;2 1;2 2)
nbr:{p:(,ZR),(0,'x,'0),,ZR; +/{p[(x 0)+!n;(x 1)+!w]}'os}
+/,/m&4>nbr m                 / part 1
step:{x&~4>nbr x}
r:step/m
(+/,/m)-+/,/r                 / part 2: total removable
\\
