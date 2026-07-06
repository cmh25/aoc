/ AoC 2025 day 12: packing feasibility. Exact packing is NP-hard; AoC inputs are
/ bound-decidable: a region surely fits if (w div 3)*(h div 3) >= #presents (every
/ shape fits a 3x3 block), surely can't if #cells > area. If the two bounds ever
/ disagree on a region, this prints the bracket instead of guessing.
L:0:"../12.in"
hd:&{$[2=#x;(x 1)=":";0]}'L                   / shape headers "0:".."5:"
cells:{+/,/"#"=L x+1+!3}'hd                   / #-cells per shape
rl:L@&{0<#ss[x;"x"]}'L                        / region lines
f:{t:" "_x; d:0$"x"_-1_*t; q:0$'1_t; s:~(+/q)>((*d)div 3)*(d 1)div 3; p:~(+/q*cells)>(*d)*d 1; (s;p)}
r:+f'rl
s:+/r 0
p:+/r 1
$[s=p; s; "AMBIGUOUS: answer is between ",($s)," and ",($p),"; ",($p-s)," region(s) need real packing search"]
\\
