/ AoC 2023 day 16: the floor will be lava
G:0:"../16.in"
h:#G
w:#*G
hw:h*w
DEAD:4*hw
n:1+4*hw
slf:,/"/"=G
bsf:,/"\\"=G
pipef:,/"|"=G
dashf:,/"-"=G
dotf:,/"."=G
phf:dashf|dotf
pvf:pipef|dotf
/ states: dir plane (R L U D) * hw + cell; per-dir move tables, DEAD = off grid
ix:!hw
rr:ix div w
cc:ix!w
ok0:cc<w-1
ok1:cc>0
ok2:rr>0
ok3:rr<h-1
M0:(ok0*ix+1)+DEAD*~ok0
M1:(ok1*hw+ix-1)+DEAD*~ok1
M2:(ok2*(2*hw)+ix-w)+DEAD*~ok2
M3:(ok3*(3*hw)+ix+w)+DEAD*~ok3
Mf:M0,M1,M2,M3
/ per-dir outgoing headings from each cell char (second heading -1 = none)
d1:((2*slf|pipef)+3*bsf; phf+(3*slf)+(2*bsf)+2*pipef; (2*pvf)+bsf+dashf; (3*pvf)+slf+dashf)
d2:((4*pipef)-1; (4*pipef)-1; dashf-1; dashf-1)
s1:(,/{Mf@(x*hw)+ix}'d1),DEAD
s2:(,/{ok:x>-1; (ok*Mf@((x|0)*hw)+ix)+DEAD*~ok}'d2),DEAD
/ path-compress straight runs through interior dots (pointer doubling)
ds:(,/4#,dotf&ok0&ok1&ok2&ok3),0
L:((~ds)*!n)+ds*s1
L:{v:ds x; ((~v)*x)+v*x@x}/L
j1:L s1
j2:L s2
SR:(,/4#,rr),0
SC:(,/4#,cc),0
w1:w+1
h1:h+1
/ BFS the bounce graph, then paint the straight segments between visited states
run:{[s0] V:n#0; F:,s0; while[#F; V[F]:1; N:?j1[F],j2[F]; F:N@&~V N]
 vi:&-1_V; E:vi,vi; T:(j1 vi),j2 vi; k:&T<DEAD; E:E k; T:T k
 hz:T div hw; r1:SR E; c1:SC E; r2:SR T; c2:SC T
 i:&2>hz; lo:(c1 i)&c2 i; hi:(c1 i)|c2 i; rw:r1 i
 hd:@[(h*w1)#0;lo+w1*rw;+;1]; hd:@[hd;1+hi+w1*rw;+;-1]; hcov:-1_'0<+\'(h,w1)#hd
 i:&1<hz; lo:(r1 i)&r2 i; hi:(r1 i)|r2 i; cl:c1 i
 vd:@[(w*h1)#0;lo+h1*cl;+;1]; vd:@[vd;1+hi+h1*cl;+;-1]; vcov:+-1_'0<+\'(w,h1)#vd
 +/,/((h,w)#|/(4,hw)#-1_V)|hcov|vcov}
run 0                        / part 1: beam in at top-left heading right
starts:(w*!h),(hw+(w-1)+w*!h),((3*hw)+!w),(2*hw)+((h-1)*w)+!w
|/run'starts                 / part 2: best edge entry
\\
