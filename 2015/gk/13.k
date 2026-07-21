T:" "_'0:"../13.in"
P:?T[;0]
n:#P
H:(n+1;n+1)#0
j:0
while[j<#T; a:P?T[j;0]; b:P?-1_T[j;10]; v:0$T[j;3]; H[a;b]:$["gain"~T[j;2];v;-v]; j:j+1]
perms:{[v] $[1=#v; ,v; ,/{(v x),'perms v di x}'!#v]}
sc:{[p] +/{(H . x)+H . |x}'p,'(1_p),*p}
q1:{0,x}'perms[1+!n-1]; |/sc'q1
q2:{n,x}'perms[!n]; |/sc'q2
\\
