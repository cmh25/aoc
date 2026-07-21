L:0:"../17.in"
N:{.@[x;&~x lin "0123456789";:;" "]}'L
pr:{[l;n] k:1+(n 2)-n 1; $[(*l)="x"; ((k#n 0);(n 1)+!k); (((n 1)+!k);k#n 0)]}'[L;N]
CX:,/{x 0}'pr
CY:,/{x 1}'pr
my:&/CY
MY:|/CY
x0:(&/CX)-2
W:5+(|/CX)-&/CX
G:(W*MY+1)#"."
G[(CX-x0)+W*CY]:"#"
ix:{[a;b] (a-x0)+W*b}
gc:{[a;b] G[(a-x0)+W*b]}                  / char at (a,b)
sn:(W*MY+1)#0                             / already-queued spill points
SX:,500
SY:,0
while[#SX
  x:*|SX; y:*|SY; SX:-1_SX; SY:-1_SY
  c:gc[x;y]
  if[c="."; @[`G;ix[x;y];:;"|"]]
  d:1
  while[d
    if[y=MY; d:0]
    if[d; b:gc[x;y+1]
      if[b="."; @[`G;ix[x;y+1];:;"|"]; y+:1]
      if[~b="."; d:0]]]
  b:$[y=MY;"|";gc[x;y+1]]                 / bottom row: treat as a fall-off
  if[~b="|"
    r:1
    while[r
      lx:x
      k:1
      while[k; a:gc[lx-1;y]; b:gc[lx;y+1]; k:(~a="#")&b in "#~"; if[k; lx-:1]]
      b:gc[lx;y+1]
      lo:~b in "#~"
      rx:x
      k:1
      while[k; a:gc[rx+1;y]; b:gc[rx;y+1]; k:(~a="#")&b in "#~"; if[k; rx+:1]]
      b:gc[rx;y+1]
      ro:~b in "#~"
      rng:(ix[lx;y])+!1+rx-lx
      o:lo|ro
      if[o
        @[`G;rng;:;"|"]
        if[lo; i:ix[lx;y]; if[~sn i; @[`sn;i;:;1]; SX,:lx; SY,:y]]
        if[ro; i:ix[rx;y]; if[~sn i; @[`sn;i;:;1]; SX,:rx; SY,:y]]
        r:0]
      if[~o
        @[`G;rng;:;"~"]
        y-:1
        if[y<0; r:0]
        if[~y<0; c:gc[x;y]; if[c="."; @[`G;ix[x;y];:;"|"]]]]]]]
S:G@(W*my)+!W*1+MY-my
+/S lin "|~"
+/S="~"
\\
