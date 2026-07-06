/ AoC 2025 day 8: closest-pair union-find. P1: 3 largest circuits after 1000 edges.
/ P2: keep going until one circuit; product of X coords of the closing pair.
L:0:"../08.in"
m:0j$''","_'L
n:#m
F:,/{+/'t*t:m-\m x}'!n             / flattened n*n squared-distance matrix (long)
fi:!n*n
w:&(fi div n)<fi!n                 / upper triangle i<j
e:w@<F w                           / ALL pairs by distance
ei:e div n
ej:e!n
p:!n
find:{while[~x=p x; x:p x]; x}
{ra:find x; rb:find y; if[~ra=rb; p[ra]::rb]}'[1000#ei;1000#ej];
sz:#'=find'!n
*/3#sz@>sz                         / part 1
nc:#?find'!n                       / circuits left after the first 1000
i:1000
ans:0j
while[nc>1; ra:find ei i; rb:find ej i; if[~ra=rb; p[ra]::rb; nc:nc-1; if[nc=1; ans:(m[ei i]0)*m[ej i]0]]; i:i+1]
ans                                / part 2
\\
