/ AoC 2022 day 21: monkey math
L:0:"../21.in"
nm:4#'L
e:6_'L
lf:("/"<*'e)&":">*'e
VL:@[(#L)#0j;&lf;:;0j$'e@&lf]
IA:nm?/4#'e
IB:nm?/-4#'e
OP:{$[5<#x;x 5;" "]}'e
ap:{[o;a;b] $[o="+";a+b;o="-";a-b;o="*";a*b;a div b]}
ev:{$[lf x; VL x; ap[OP x; ev IA x; ev IB x]]}
ri:nm?"root"; hi:nm?"humn"
ev ri                        / part 1: root's yell
DP:(#L)#-1
dpc:{$[x=hi;1;lf x;0;(dep IA x)|dep IB x]}
dep:{if[(DP x)<0; DP[x]::dpc x]; DP x}
sob:{[i;t] a:IA i; b:IB i; o:OP i; $[dep a; so[a; $[o="+";t-ev b;o="*";t div ev b;o="-";t+ev b;t*ev b]]; so[b; $[o="+";t-ev a;o="*";t div ev a;o="-";(ev a)-t;(ev a)div t]]]}
so:{[i;t] $[i=hi; t; sob[i;t]]}
$[dep IA ri; so[IA ri; ev IB ri]; so[IB ri; ev IA ri]]   / part 2: humn
\\
