L:0:"../06.in"
prs:{[s] t:" "_s
  $[t[0]~"toggle"; (2;0$","_t 1;0$","_t 3); (t[1]~"on";0$","_t 2;0$","_t 4)]}
P:prs'L
g:1000000#0
b:1000000#0
j:0
while[j<#L
  q:P j; op:q 0; a:q 1; c:q 2
  ix:,/((a 0)+!1+(c 0)-a 0)+/1000*(a 1)+!1+(c 1)-a 1
  if[op=1; g[ix]:1; b[ix]+:1]
  if[op=0; g[ix]:0; b[ix]:0|b[ix]-1]
  if[op=2; g[ix]:~g ix; b[ix]+:2]
  j:j+1]
+/g
+/b
\\
