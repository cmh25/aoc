/ AoC 2024 day 13: claw contraption
L:0:"../13.in"
ls:L@&0<#'L
nums:{0j$","_x@&x lin "0123456789,"}'ls        / the two numbers on each line
c:+,/'((#nums)div 3;3)#nums                 / columns ax ay bx by px py
ax:c 0; ay:c 1; bx:c 2; by:c 3; px:c 4; py:c 5
/ Cramer 2x2 per machine, count only exact integer solutions
f:{[px;py;cap]
 dt:(ax*by)-ay*bx
 ua:(px*by)-py*bx; ub:(ax*py)-ay*px
 na:ua div dt; nb:ub div dt
 ok:(0=ua!'dt)&(0=ub!'dt)&(na>-1j)&(nb>-1j)&(na<cap)&nb<cap
 +/ok*(3j*na)+nb}
f[px;py;101j]                                  / part 1: <=100 presses each
/ part 2: prize coords offset by 10^13, no press cap
f[px+10000000000000j;py+10000000000000j;10000000000000000j]
\\
