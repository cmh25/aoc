L:0:"../21.in"
rt:{|'+x}
oris:{(3{rt x}\x),3{rt x}\|x}                    / 8 dihedral orientations
enc:{2 sv,/{"#"=x}'x}                             / flatten to a bit-code
T2::16#0
T3::512#0
{[r] pr:"|"_ssr[r;" => ";"|"]; lft:"/"_pr 0; rgt:"/"_pr 1
  $[2=#lft; {@[`T2;enc x;:;rgt]}'oris lft; {@[`T3;enc x;:;rgt]}'oris lft]}'L;
step:{[G] s:#G
  b:$[0=s!2; 2; 3]
  tab:$[b=2; T2; T3]
  nb:s div b
  ,/{[bi] {x,'y}/({[bj] blk:{[row] row@(bj*b)+!b}'(G@(bi*b)+!b); tab@enc blk}'!nb)}'!nb}
G0:(".#.";"..#";"###")
+/+/"#"=5{step x}/G0                              / part 1: on-pixels after 5
+/+/"#"=18{step x}/G0                             / part 2: after 18
\\
