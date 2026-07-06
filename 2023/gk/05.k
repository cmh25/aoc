/ AoC 2023 day 5: if you give a seed a fertilizer
L:0:"../05.in"
sds:0j$'1_" "_*L
b:2_L
hdr:(b?'":")<#'b               / header lines contain a colon
rows:&(0<#'b)&~hdr
V:{0j$'" "_x}'b rows
maps:V@=(+\hdr)rows            / (dest;src;len) rows grouped per stage
tr:{[v;m;q] S:m[;1]; C:(~v<\S)&v<\S+m[;2]; v+((m[;0]-S),0j)@C?'1}
&/tr/[sds;maps;nul]            / part 1: min location, seeds folded through stages
n:_(#sds)%2
pr:(n,2)#sds                   / part 2: seed line is (start;len) interval pairs
st:pr[;0]
en:st+pr[;1]
stage:{[iv;m;q] S:m[;1]; E:S+m[;2]; B:?S,E; B:B@<B; pc:{[a;b] c:a,B@&(B>a)&B<b; (c;(1_c),b)}'[iv 0;iv 1]; ns:,/pc@'0; ne:,/pc@'1; k:((~ns<\S)&ns<\E)?'1; sh:((m[;0]-S),0j)@k; (ns+sh;ne+sh)}
r:stage/[(st;en);maps;nul]     / split intervals at stage boundaries, shift mapped pieces
&/r 0
\\
