/ AoC 2021 day 9: smoke basin
m:-48+ic'0:"../09.in"
h:#m; wd:#*m
sh:{[g;e] (((,wd#e),-1_g);((1_g),,wd#e);e,'-1_'g;(1_'g),'e)}   / up down left right neighbors
nb:sh[m;10]
+/,/(1+m)*m<&/nb             / part 1: risk of low points
M:m<9
BIG:h*wd
G:(h,wd)#@[!h*wd;&~,/M;:;BIG]
f:{n:x&&/sh[x;BIG]; (M*n)+BIG*~M}
v:(,/f/G)@&,/M               / converge: basin label = min id reachable
s:#'=v
*/3#s@>s                     / part 2: product of 3 largest basins
\\
