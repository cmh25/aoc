T:" "_'0:"../09.in"
C:?(T[;0]),T[;2]
n:#C
D:(n;n)#0
j:0
while[j<#T; a:C?T[j;0]; b:C?T[j;2]; d:0$T[j;4]; D[a;b]:d; D[b;a]:d; j:j+1]
perms:{[v] $[1=#v; ,v; ,/{(v x),'perms v di x}'!#v]}
P:perms[!n]
cst:{[p] +/{D . x}'(-1_p),'1_p}
S:cst'P
&/S
|/S
\\
