/ AoC 2023 day 24: never tell me the odds
L:0:"../24.in"
pj:{$["-"=*x;0j-0j$1_x;0j$x]}
lm:{pj'","_ssr[ssr[x;" ";""];"@";","]}'L    / px py pz vx vy vz, longs
n:#lm
px:0.0+lm[;0]
py:0.0+lm[;1]
vx:0.0+lm[;3]
vy:0.0+lm[;4]
I:,/((n-1)-!n)#'!n                          / all pairs, vectorized
J:,/(1+!n)+'!'(n-1)-!n
d:((vx I)*vy J)-(vy I)*vx J
n1:(((px J)-px I)*vy J)-((py J)-py I)*vx J
n2:(((px J)-px I)*vy I)-((py J)-py I)*vx I
t1:n1%d
t2:n2%d
X:(px I)+t1*vx I
Y:(py I)+t1*vy I
lo:2e14
hi:4e14
+/(~d=0)&(t1>0)&(t2>0)&(X>lo)&(X<hi)&(Y>lo)&Y<hi   / part 1: future XY crossings in the box
cand:-1000+!2001                            / part 2: pin rock velocity per axis by divisibility
axcand:{[ax] g:=lm[;3+ax]; gs:g@&1<#'g; prs:,/{(*x),'1_x}'gs; cand@&&/{[ax;pr] dp:abs lm[pr 1;ax]-lm[pr 0;ax]; (dz&dp=0)|(~dz)&0=dp!'d+dz:0=d:abs cand-lm[pr 0;3+ax]}[ax]'prs}
cx:axcand 0
cy:axcand 1
cz:axcand 2
slv:{[a;b;c] u:lm[;3]-a; ww:lm[;4]-b; q:lm[;5]-c; cross:(u[0]*ww)-ww[0]*u; s:&~0=cross; if[0=#s;:0j]; s:*s
 num:(((lm[s;0])-lm[0;0])*ww s)-((lm[s;1])-lm[0;1])*u s
 den:(u[0]*ww s)-ww[0]*u s
 t0:num div den; if[~num=t0*den;:0j]; if[t0<0j;:0j]
 X:lm[0;0]+t0*u 0; Y:lm[0;1]+t0*ww 0; Z:lm[0;2]+t0*q 0
 n1:lm[;0]-X; n2:lm[;1]-Y; n3:lm[;2]-Z; e1:0j-u; e2:0j-ww; e3:0j-q
 z1:0=e1; z2:0=e2; z3:0=e3
 t:((n1 div e1+z1)*~z1)+((n2 div e2+z2)*z1*~z2)+(n3 div e3+z3)*z1&z2
 ok:(n1=t*e1)&(n2=t*e2)&(n3=t*e3)&t>-1j
 $[&/ok; X+Y+Z; 0j]}                        / rock-frame lines concur at the rock; verified exactly vs all stones
|/,/,/{[a]{[a;b]slv[a;b]'cz}[a]'cy}'cx
\\
