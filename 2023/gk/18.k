/ AoC 2023 day 18: lavaduct lagoon
ps:" "_'0:"../18.in"
lag:{[dx;dy;n] xx:+\dx*n; yy:+\dy*n; 1+((abs+/(xx*1!yy)-yy*1!xx)div 2)+(+/n)div 2}
d:"RLDU"?/*'*'ps
lag[(1 -1 0 0)d;(0 0 1 -1)d;1j*0$ps@'1]  / part 1: shoelace + perimeter/2 + 1
c:(ic 2_'-1_'ps@'2)-48
v:c-39*c>9                                / hex digit values
lag[(1 0 -1 0)v[;5];(0 1 0 -1)v[;5];1j*16 sv'v[;!5]]  / part 2: hex-decoded plan
\\
