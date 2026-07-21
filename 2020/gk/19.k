/ AoC 2020 day 19: monster messages (position-set CFG matcher)
L:0:"../19.in"
gid:+\0=#'L
rlines:L@&(gid=0)&0<#'L
msgs:L@&(gid=1)&0<#'L
prule:{[rl] p:":"_rl; id:0$p 0; rest:1_p 1
 $[rest[0]="\"";(id;0;rest 1);(id;1;{s:" "_x; 0$'s@&0<#'s}'"|"_rest)]}
P:prule'rlines
R:(1+|/{x 0}'P)#0                                / ids are sparse; index by actual id
{@[`R;x 0;:;1_x]}'P;                             / R[id] = (tag; payload); tag 0=literal
match:{[id;poss] poss:?poss; r:R id
 $[0=#poss;poss;(r 0)=0;1+poss@&{$[x<#S;S[x]=r 1;0]}'poss;,/mseq[;poss]'r 1]}
mseq:{[seq;poss] cur:poss; i:0; while[i<#seq;cur:?match[seq i;cur];i:i+1];cur}
cnt:{+/{[m] S::m; (#S)lin match[0;,0]}'msgs}
cnt[]                                            / part 1
R[8]:(1;(,42;42 8)); R[11]:(1;(42 31;42 11 31))
cnt[]                                            / part 2: rules 8 and 11 recurse
\\
