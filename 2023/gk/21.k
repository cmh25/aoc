/ AoC 2023 day 21: step counter
g:0:"../21.in"
w:#*g
op:~"#"=g                            / open plots (garden or S)
zr:w#0
step:{op&((1_x),,zr)|((,zr),-1_x)|((1_'x),'0)|0,'-1_'x}
k:(,/g)?"S"
s0:(w,w)#0
s0[_k%w;k!w]:1
+/,/64 step/s0                       / part 1: plots reachable in exactly 64 steps
op:655#'655#op                       / part 2: 5x5 tiling; f(65+131t) is quadratic in t (clear S row/col + border)
zr:655#0
st:(655,655)#0
st[327;327]:1
a:65 step/st
b:131 step/a
c:131 step/b
f:1j*(+/,/a;+/,/b;+/,/c)
d1:f[1]-f 0
d2:(f[2]+f 0)-2j*f 1
t:202300j
(f 0)+(t*d1)+d2*(t*t-1j)div 2j       / Newton forward quadratic at t=202300 (26501365 steps)
\\
