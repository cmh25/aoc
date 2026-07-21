/ AoC 2022 day 16: proboscidea volcanium
L:0:"../16.in"
nm:(" "_'L)@'1
ra:{0$x@&(x>"/")&x<":"}'L
nbi:{[s] t:" "_ssr[s;",";""]; nm?/9_t}'L
n:#nm
D:(n,n)#9999
{[i] D[i;nbi i]::1; D[i;i]::0}'!n;
{[k] D::D&D[;k]+\D k}'!n;
vv:&ra>0; nv:#vv; rt:ra vv
dm:D[vv;vv]; d0:D[nm?"AA";vv]
bt:_2^!nv
go:{[p;t;msk;acc] if[acc>best msk; best[msk]::acc]
 {[j] nt:t-1+dm[p;j]; if[(nt>0)&0=(msk div bt j)!2; go[j;nt;msk+bt j;acc+nt*rt j]]}'!nv}
run:{[tm] best::(_2^nv)#0; {[j] tt:tm-1+d0 j; if[tt>0; go[j;tt;bt j;tt*rt j]]}'!nv; best}
|/run 30                     / part 1: alone, 30 minutes
mx:run 26
{[b] i:&0<((!_2^nv)div bt b)!2; mx[i]::mx[i]|mx i-bt b}'!nv;
|/mx+|mx                     / part 2: you + elephant on disjoint valve sets
\\
