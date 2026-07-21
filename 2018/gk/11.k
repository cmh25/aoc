ser:.*0:"../11.in"
r:11+!300                                    / x+10 for x=1..300
P:{-5+((((x*r)+ser)*r) div 100)!10}'1+!300   / power grid, row = y
S:+\'+\P                                     / 2-D inclusive prefix sums
S0:(,301#0),0,'S                             / zero-padded
best:{[s] k:301-s; I:!k; J:s+!k
  f:,/(S0[J;J]-S0[I;J])-S0[J;I]-S0[I;I]
  m:|/f; i:*&f=m
  (m;1+i!k;1+i div k;s)}
b:best 3
($b 1),",",$b 2
B:best'1+!300
b:B@*&(B[;0])=|/B[;0]
($b 1),",",($b 2),",",$b 3
\\
