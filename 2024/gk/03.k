/ AoC 2024 day 3: mull it over
L:0:"../03.in"
s:,/L,'"~"                    / one stream; junk char keeps line breaks corrupt
t:s,16#" "
g:{[c;k] r:(k+1)_c; m:+/&\(r>"/")&r<":"; $[(m>0)&(m<4)&")"=r m; (0j$k#c)*0j$m#r; 0j]}
f:{[p] c:16#(p+4)_t; k:+/&\(c>"/")&c<":"; $[(k>0)&(k<4)&","=c k; g[c;k]; 0j]}
ms:ss[s;"mul("]
v:f'ms                         / value of the mul at each candidate site (0 if invalid)
+/v                           / part 1
ps:0,ss[s;"do()"],ss[s;"don't()"]
ev:1,((#ss[s;"do()"])#1),(#ss[s;"don't()"])#0
o:<ps
ps:ps o
ev:ev o                       / enable-state timeline, sorted by position
+/v*ev@-1++/~ps>\ms               / part 2: gate each mul by latest do/don't
\\
