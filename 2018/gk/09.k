s:*0:"../09.in"
w:.@[s;&~s lin "0123456789";:;" "]
np:w 0
ins:{[m] a:nxt cur; b:nxt a                      / place one marble after cur's successor
  @[`nxt;a,m;:;m,b]; @[`prv;m,b;:;a,m]; cur::m}
tak:{[m] do[7; cur::prv cur]                     / 23rd marble: score it and the one 7 back
  @[`sc;m!np;+;0j+m+cur]
  a:prv cur; b:nxt cur
  @[`nxt;a;:;b]; @[`prv;b;:;a]; cur::b}
one:{[m] $[0=m!23; tak m; ins m]}
play:{[M]
  nxt::(M+1)#0; prv::(M+1)#0; sc::np#0j; cur::0
  m:1
  while[~m>46&M; one m; m+:1]                    / 2 groups naively: batching needs a 23-node circle
  g:2
  while[~M<23+23*g
    b:23*g
    Ms:b+1+!22                                   / 22 marbles land in the 22 gaps ahead of cur
    C:22{nxt x}\(nxt cur)
    @[`nxt;(-1_C),Ms;:;Ms,1_C]
    @[`prv;Ms,1_C;:;(-1_C),Ms]
    cur::*|Ms
    tak b+23
    g+:1]
  m:1+23*g
  while[~m>M; one m; m+:1]
  |/sc}
play w 1
play 100*w 1
\\
