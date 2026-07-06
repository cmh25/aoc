/ AoC 2024 day 6: guard gallivant
L:0:"../06.in"
n:#L; w:#*L
O:{x="#"}'L
/ per-cell next-obstacle jump tables (running max/min scans per row/col)
UPm:+{(-1),-1_|\-1+(1+!n)*x}'+O
DNm:+{(1_|&\|((!n)*x)+n*~x),n}'+O
LTm:{(-1),-1_|\-1+(1+!w)*x}'O
RTm:{(1_|&\|((!w)*x)+w*~x),w}'O
UPf:,/UPm; DNf:,/DNm; LTf:,/LTm; RTf:,/RTm
flat:,/L
s:*&flat="^"
sr:_s%w; sc:s!w
V:(n,w)#0
r:sr; c:sc; d:0; go:1
while[go; d0:d;                / part 1: segment-jump walk, mark visited
 if[d0=0; b:UPm[r;c]; h:~b<0; nr:$[h;b+1;0]; V[nr+!1+r-nr;c]:1; r:nr; d:1; go:h];
 if[d0=1; b:RTm[r;c]; h:b<w; nc:$[h;b-1;w-1]; V[r;c+!1+nc-c]:1; c:nc; d:2; go:h];
 if[d0=2; b:DNm[r;c]; h:b<n; nr:$[h;b-1;n-1]; V[r+!1+nr-r;c]:1; r:nr; d:3; go:h];
 if[d0=3; b:LTm[r;c]; h:~b<0; nc:$[h;b+1;0]; V[r;nc+!1+c-nc]:1; c:nc; d:0; go:h]]
+/,/V                          / part 1: distinct positions visited
/ part 2: obstruct each visited cell -> does the guard loop?
/ all candidates simulated at once: vector state, jump-table gathers,
/ Brent power-of-2 checkpoints for cycle detection, compress as they exit
cand:&,/V
cand:cand@&~cand=s
m:#cand
RO:_cand%w; CO:cand!w
R:m#sr; C:m#sc; D:m#0
KR:m#-1; KC:m#-1; KD:m#-1
loops:0; t:0; nxt:1; cap:8+4*+/,/0+O
while[(0<#R)&t<cap;
 idx:(R*w)+C;
 B:((D=0)*UPf idx)+((D=1)*RTf idx)+((D=2)*DNf idx)+(D=3)*LTf idx;
 B:B|(((D=0)&(CO=C)&RO<R)*RO+1)-1;         / added obstruction, per direction
 B:B|(((D=3)&(RO=R)&CO<C)*CO+1)-1;
 B:B&(((D=1)&(RO=R)&CO>C)*CO-w)+w;
 B:B&(((D=2)&(CO=C)&RO>R)*RO-n)+n;
 H:(((D=0)|D=3)&B>-1)|((D=1)&B<w)|(D=2)&B<n;  / hit an obstacle (else exits)
 k:&H; R:R k; C:C k; D:D k; RO:RO k; CO:CO k; B:B k; KR:KR k; KC:KC k; KD:KD k;
 adj:B+1-2*(D=1)|D=2;
 vm:(D=0)|D=2;
 R:(vm*adj)+(~vm)*R; C:((~vm)*adj)+vm*C;
 D:(D+1)!4;
 lm:(R=KR)&(C=KC)&D=KD;                       / state matches checkpoint = cycle
 loops:loops++/lm;
 k2:&~lm; R:R k2; C:C k2; D:D k2; RO:RO k2; CO:CO k2; KR:KR k2; KC:KC k2; KD:KD k2;
 t:t+1; if[t=nxt; KR:R; KC:C; KD:D; nxt:2*nxt]]
loops+#R                       / part 2 (cap survivors are loops too)
\\
