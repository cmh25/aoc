T:{" "_ssr[x;",";""]}'0:"../23.in"
cmp:{[t] o:("hlf";"tpl";"inc";"jmp";"jie";"jio")?t 0
  $[o=3; (o;0;_0.0$t 1); o>3; (o;"b"=*t 1;_0.0$t 2); (o;"b"=*t 1;0)]}
P:cmp'T
n:#P
run:{[a0] r:(a0;0j); pc:0
  while[(pc>-1)&pc<n; q:P pc; o:q 0
    if[o=0; r[q 1]:r[q 1] div 2; pc:pc+1]
    if[o=1; r[q 1]:3j*r q 1; pc:pc+1]
    if[o=2; r[q 1]:1j+r q 1; pc:pc+1]
    if[o=3; pc:pc+q 2]
    if[o=4; pc:pc+$[0=(r q 1)!2; q 2; 1]]
    if[o=5; pc:pc+$[1=r q 1; q 2; 1]]]
  r 1}
run 0j
run 1j
\\
