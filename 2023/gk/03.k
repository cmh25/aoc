/ AoC 2023 day 3: gear ratios
G:0:"../03.in"
W:1+#*G
F:,/G,'"."                   / flatten with a "." column separating rows
d:(F>"/")&F<":"
st:d>0,-1_d
si:&st
V:0$'F(si+'!'1+(&d>1_d,0)-si)   / number values, run k -> V k
R:d*+\st                     / run id (1-based) per digit cell
sh:{[k;v]$[k<0;((-k)_v),(-k)#0;(k#0),(-k)_v]}
offs:(0-W+1;0-W;1-W;-1;1;W-1;W;W+1)
adj:|/sh[;~d|F="."]'offs     / cells adjacent to a symbol
+/V@-1+?R@&d&adj             / part 1: sum of runs touching a symbol
R2:((W+1)#0),R,(W+1)#0
g:{is:?R2@x+offs; is:is@&is>0; $[2=#is;*/V@is-1;0]}
+/g'(W+1)+&F="*"             / part 2: gears = stars with exactly 2 adjacent runs
\\
