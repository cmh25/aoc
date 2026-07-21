L:0:"../12.in"
s:"#"=15_*L
rl:2_L
R:@[32#0; sv[2;]'"#"=5#'rl; :; "#"=rl[;9]]       / 5-cell window -> next state
off:0
step:{[q] s2:(4#0),s,4#0
  m:(#s2)-4
  c:(16*s2@!m)+(8*s2@1+!m)+(4*s2@2+!m)+(2*s2@3+!m)+s2@4+!m
  t:R@c
  off::off-2
  w:&t
  if[#w; off::off+*w; t:t@(*w)+!1+(*|w)-*w]      / trim to the live span
  s::t}
do[20; step 0]
+/off+&s
s:"#"=15_*L
off:0
g:0
d:0
while[~d; ps:s; po:off; step 0; g+:1; if[s~ps; d:off-po]]   / pattern repeats, just shifting
(0j++/off+&s)+(50000000000j-g)*d*#&s
\\
