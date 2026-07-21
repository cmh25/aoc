L:0:"../08.in"
G:6 50#0

rr:{[row;b] w:#row; row@((!w)+w-(b!w))!w}   / rotate a vector right by b
rect:{[W;r] (W#1),W_r}                       / set first W of a row to 1

step:{[line]
  t:" "_line
  if[t[0]~"rect"; wh:"x"_t 1; G::@[G;!0$wh 1; rect[0$wh 0;]]]
  if[t[1]~"row"; G::@[G;0$2_t 2; rr[;0$t 4]]]
  if[t[1]~"column"; G::+@[+G;0$2_t 2; rr[;0$t 4]]]}

step'L;
+/,/G                                        / part 1

/ part 2: the screen spells 10 letters (5px wide each) -> AFBUPZBJPS
{" #"@x}'G
\\
