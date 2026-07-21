/ AoC 2022 day 8: treetop tree house
m:-48+ic'0:"../08.in"
g:{x>{-1,-1_|\x}'x}        / visible from the left, per row
vis:g[m]|(|'g[|'m])|(+g[+m])|+|'g[|'+m]
+/,/vis                      / part 1: visible from any edge
cm:+m; n:#m; w:#*m
vd:{[h;v] b:&~v<h; $[0=#v;0;0=#b;#v;1+*b]}   / viewing distance along v
s:{[i;j] h:m[i;j]; r:m i; c:cm j; vd[h;|j#r]*vd[h;(j+1)_r]*vd[h;|i#c]*vd[h;(i+1)_c]}
|/,/{s[x]'!w}'!n   / part 2: best scenic score
\\
