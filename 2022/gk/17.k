/ AoC 2022 day 17: pyroclastic flow
J:*0:"../17.in"
JS:"<>"?/J; nj:#JS             / 0 left, 1 right
SH:((,0 0 1 1 1 1 0)
 (0 0 0 1 0 0 0;0 0 1 1 1 0 0;0 0 0 1 0 0 0)
 (0 0 1 1 1 0 0;0 0 0 0 1 0 0;0 0 0 0 1 0 0)
 (4#,0 0 1 0 0 0 0)
 (0 0 1 1 0 0 0;0 0 1 1 0 0 0))
cl:{[r;b] 0<+/,/r&C b+!#r}
rock:{[si] r:SH si; b:hgt+3
 while[(#C)<b+5; C::C,,7#0]
 f:1
 while[f
  j:JS ji; ji::(ji+1)!nj
  can:$[j;~|/r[;6];~|/r[;0]]
  if[can; r2:$[j;0,'-1_'r;(1_'r),'0]; if[~cl[r2;b]; r:r2]]
  dn:$[b=0;0;~cl[r;b-1]]
  if[dn; b:b-1]
  if[~dn; {[k] C[b+k]::C[b+k]|r k}'!#r; hgt::hgt|b+#r; f:0]]}
key:{[c] rows:$[hgt<8; C@!hgt; C@(hgt-8)+!8]; (c!5;ji),2 sv/rows}
C:(); hgt:0; ji:0; H:,0; KL:(); i:0; c0:0; per:0; dh:0
while[per=0
 rock i!5; i:i+1; H:H,hgt
 k:key i; f:KL?k
 if[f<#KL; c0:f+1; per:i-c0; dh:H[i]-H c0]
 if[~f<#KL; KL:KL,,k]]
do[per; rock i!5; i:i+1; H:H,hgt]
ht:{$[x<c0; H@_x; H[c0+_(x-c0)!per]+dh*(x-c0)div per]}
ht 2022                       / part 1
ht 1000000000000j             / part 2
\\
