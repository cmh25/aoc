/ AoC 2023 day 25: snowverload
L:0:"../25.in"
tk:{" "_ssr[x;":";""]}'L
uniq:?,/tk
n:#uniq
ea:,/{(uniq?*x),'uniq?/1_x}'tk              / undirected edges as id pairs
m:#ea
eF:,/ea                                     / directed edge k: 2k = a->b, 2k+1 = b->a (rev = xor 1)
eT:,/|'ea
eadj:n#,!0
eadj[?eF]:=eF
cap:(2*m)#1
bfsf:{[src] par:n#-1; par[src]:-2; fr:,src; while[0<#fr; es:,/eadj fr; es:es@&0<cap es; tg:eT es; k:&-1=par tg; es:es k; tg:tg k; fi:*'=tg; u:tg fi; par[u]:es fi; fr:u]; par}
aug:{[t] p:t; while[~-2=par p; e:par p; cap[e]::(cap e)-1; r:e+1-2*e!2; cap[r]::(cap r)+1; p:eF e]}
/ unit-capacity max flow from node 0: a sink across the cut caps at flow 3; residual reach = one side
ans:0
ti:1
while[(0=ans)&ti<20
 t:(ti*1|n div 20)!n
 cap:(2*m)#1
 fl:0
 ok:~t=0
 while[ok&fl<4; par:bfsf 0; ok:~-1=par t; if[ok; aug t; fl:fl+1]]
 if[fl=3; par:bfsf 0; s:+/~par=-1; ans:s*n-s]
 ti:ti+1]
ans
\\
