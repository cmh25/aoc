/ AoC 2023 day 23: a long walk
g:0:"../23.in"
w:#*g
G:,/g
N:#G
dd:(-w;w;-1;1)
opn:~"#"=G
deg:{t:x+dd; t:t@&(t>-1)&t<N; +/opn t}
nds:1,(&opn&2<deg'!N),N-2                / junction graph: start, forks, end
nn:#nds
idm:N#-1
idm[nds]:!nn
walk:{[a;c] pv:a; cr:c; ln:1; fw:1; bw:1
 while[-1=idm cr
  s:$[(G cr)=">";1;(G cr)="<";-1;(G cr)="v";w;(G cr)="^";0-w;0]
  if[~s=0; $[s=cr-pv; bw:0; fw:0]]
  nx:cr+dd; nx:nx@&(~"#"=G nx)&~nx=pv
  pv:cr; cr:*nx; ln:ln+1]
 (idm cr;ln;fw;bw)}
E:(nn,nn)#-1                             / undirected corridor lengths (part 2)
D:(nn,nn)#-1                             / slope-directed (part 1)
mk:{[ai] a:nds ai; t:a+dd; t:t@&(t>-1)&t<N; t:t@&~"#"=G t; {r:walk[nds x;y]; E[x;*r]::r 1; if[r 2; D[x;*r]::r 1]}[ai]'t}
mk'!nn;
st:idm 1
en:idm N-2
pe:*&-1<E[;en]                           / sole junction guarding the exit: entering it forces the exit edge
ple:E[pe;en]
per:&4>+/'-1<E                           / perimeter prune: boundary edges only walk toward the exit
pm:nn#0
pm[per]:1
pd:nn#-1
pd[en]:0
fr:,en
while[0<#fr; nx:?,/{&(-1<E x)&pm&pd=-1}'fr; pd[nx]:1+pd@*fr; fr:nx]
kill:{[a;b] $[(pd[a]=-1)|pd[b]=-1;0;pd[b]>pd a;1;(pd[b]=pd a)&b<a;1;0]}
{[a] {[a;b] if[kill[a;b]; E[a;b]::-1]}[a]'&-1<E a}'per;
pw:1j,*\(nn-1)#2j
pad:{[M;i] t:&-1<M i; 4#t,(4-#t)#-1}
longest:{[M]                             / exhaustive longest path, whole DFS level as one vector op
 NB:pad[M]'!nn
 LN:{[M;i] 4#(M[i]@&-1<M i),(4-#&-1<M i)#0}[M]'!nn
 fn:,st; fm:,pw st; fd:,0; bst:0
 while[0<#fn
  nd2:,/NB fn; ln2:,/LN fn; fm4:,/4#'fm; fd4:,/4#'fd
  k:&nd2>-1; nd2:nd2 k; ln2:ln2 k; fm4:fm4 k; fd4:fd4 k
  k:&0=(fm4 div pw nd2)!2j; nd2:nd2 k; fd2:fd4[k]+ln2 k; fm2:fm4[k]+pw nd2
  h:&nd2=pe; if[0<#h; bst:bst||/fd2 h]
  k:&~nd2=pe; fn:nd2 k; fm:fm2 k; fd:fd2 k]
 bst+ple}
longest D                                / part 1: slopes respected
longest E                                / part 2: slopes are plain path
\\
