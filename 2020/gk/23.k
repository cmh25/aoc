/ AoC 2020 day 23: crab cups (linked list via a next[] array, amended in place)
s:-48+ic *0:"../23.in"
run:{[seq;M] N::#seq; NX::(N+1)#0
 i:0; while[i<N; @[`NX;seq i;:;seq[(i+1)!N]]; i:i+1]
 cur::*seq
 do[M
  a:NX cur; b:NX a; c:NX b
  @[`NX;cur;:;NX c]
  d:$[cur=1;N;cur-1]
  while[(d=a)|(d=b)|d=c; d:$[d=1;N;d-1]]
  @[`NX;c;:;NX d]; @[`NX;d;:;a]; cur::NX cur]}
run[s;100]
p:NX 1; out:(); do[8; out:out,p; p:NX p]
"0123456789"@out                                 / part 1: labels after cup 1
run[s,10+!1000000-9;10000000]
(0j+NX 1)*NX NX 1                                 / part 2: product of two cups after 1
\\
