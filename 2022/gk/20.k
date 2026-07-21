/ AoC 2022 day 20: grove positioning system
v:_0.0$'0:"../20.in"
n:#v
step:{[vv;i] p:O?i; o2:O di ,p; np:(p+vv i)!n-1; O::(np#o2),i,np_o2}
mix:{[vv;r] O::!n; do[r; step[vv]'!n]; O}
grove:{[vv] z:O?vv?0*vv 0; +/vv O(z+1000 2000 3000)!n}
mix[v;1]; grove v            / part 1
w:811589153j*v
mix[w;10]; grove w            / part 2
\\
