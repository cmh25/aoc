/ AoC 2021 day 17: trick shot
v:.(ssr[ssr[ssr[*0:"../17.in";"target area: x=";""];", y=";" "];"..";" "])
x1:v 0; x2:v 1; yl:v 2; yh:v 3
(yl*yl+1)div 2               / part 1: apex of vy = -ylo-1
vxs:1+!x2; vys:yl+!-2*yl
VX:,/{(#vys)#x}'vxs; VY:,/(#vxs)#,vys
px:0*VX; py:px; hit:px; vx:VX; vy:VY
do[2+-2*yl; px:px+vx; py:py+vy; hit:hit|(~px<x1)&(~px>x2)&(~py<yl)&~py>yh; vx:0|vx-1; vy:vy-1]
+/hit                        / part 2: distinct launch velocities
\\
