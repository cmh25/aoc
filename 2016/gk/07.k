L:0:"../07.in"

seg:{[line]                       / -> (supernets; hypernets)
  b:"["_line
  parts:{"]"_x}'1_b               / each tail = (hyper; super)
  ((,b 0),{x 1}'parts; *'parts)}

/ ABBA: a=d, b=c, a!=b over sliding 4-windows (via aligned drops)
abbaIn:{[s] $[4>#s;0; |/((-3_s)=3_s)&((1_-2_s)=2_-1_s)&~(-3_s)=1_-2_s]}

/ ABA slices: a=c, a!=b over 3-windows
abas:{[s] $[3>#s;(); {x[y+0 1 2]}[s]'(!(#s)-2)@&((-2_s)=2_s)&~(-2_s)=1_-1_s]}

S:seg'L
tls:{[g] (|/0,abbaIn'g 0)&~|/0,abbaIn'g 1}
+/tls'S                           / part 1

ssl:{[g] A:,/abas'g 0;            / all ABAs in supernets
  0<|/0,{[hyp;aba] |/0,{#ss[x;y]}[;aba 1 0 1]'hyp}[g 1]'A}
+/ssl'S                           / part 2
\\
