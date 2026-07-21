PI:2*acos 0
G:0:"../10.in"
ast:,/{[y]xs:&"#"=G y; xs,'y}'!#G      / (x;y) of every asteroid
dir:{[a;b] dx:(b 0)-a 0; dy:(b 1)-a 1; g:gcd[abs dx;abs dy]; (dx div g; dy div g)}
vis:{[i] #?dir[ast i]'ast di i}        / distinct sightlines from asteroid i
counts:vis'!#ast
|/counts
/ ---- part2 ----
bi:counts?|/counts
st:ast bi
oth:ast di bi
drs:dir[st]'oth                        / reduced direction to each other asteroid
D:{((x 0)-st 0)^2+((x 1)-st 1)^2}'oth  / squared distance (ordering only)
udir:?drs
uang:{dx:x 0;dy:x 1;t:atan2[dx;- dy];$[t<0;t+2*PI;t]}'udir
ord:udir@<uang                         / directions clockwise from up
grp:{[d] is:&drs~\d; is@<D@is}'ord      / per direction, indices sorted near->far
mx:|/#'grp
vord:,/{[r],/{$[r<#x;,x r;()]}'grp}'!mx / vaporization order (round-robin by angle)
w:oth vord 199                         / 200th vaporized
(100*w 0)+w 1
\\
