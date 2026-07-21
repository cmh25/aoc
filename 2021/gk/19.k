/ AoC 2021 day 19: beacon scanner
L:0:"../19.in"
hd:&{(2#x)~"--"}'L
blk:{[i] (1+hd i)_$[i<-1+#hd;(hd i+1)#L;L]}'!#hd
S:{.'x@&0<#'x}'blk
pms:(0 1 2;0 2 1;1 0 2;1 2 0;2 0 1;2 1 0)
ev:1 0 0 1 1 0                / perm parity: even=1
sgs:{-1+2*(2 2 2)vs x}'!8
ROT:,/{[i] {(pms x;y)}[i]'sgs@&(-1+2*ev i)=*/'sgs}'!6
rt3:{[B;r] p:r 0; s:r 1; (s[0]*B[;p 0]),'(s[1]*B[;p 1]),'s[2]*B[;p 2]}
enc:{(x[;0]+50000j)+(100000j*x[;1]+50000)+10000000000j*x[;2]+50000}
try:{[lb;rb] r:0; f:0
 while[(r<24)&f=0
  C:rt3[rb;ROT r]
  D:,/{x-/C}'lb
  g:=enc D
  n:#'g
  if[11<|/n; f:1; off:D@*g@n?|/n]
  r:r+1]
 $[f;(1;off;C+\off);,0]}
n:#S
AB:S; POS:n#,0 0 0; done:@[n#0;0;:;1]
q:,0
while[0<#q
 cur:*q; q:1_q
 t:&~done
 {[u] m:try[AB cur;S u]; if[*m; AB[u]::m 2; POS[u]::m 1; done[u]::1; q::q,u]}'t
 ]
#?enc@,/AB                   / part 1: distinct beacons
|/,/{+/'abs x-/POS}'POS      / part 2: max scanner manhattan distance
\\
