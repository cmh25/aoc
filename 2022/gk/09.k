/ AoC 2022 day 9: rope bridge
L:0:"../09.in"
i:"UDLR"?/*'L
n:0$'2_'L
hp:+(+\,/n#'0 0 -1 1@i;+\,/n#'1 -1 0 0@i)   / head positions over time
step:{[t;h;u] d:h-t; $[1<|/abs d; t+(d>0)-d<0; t]} / follower chases leader
p:1_step\[0 0;hp;nul]
#?(,0 0),p                   / part 1: distinct tail positions, 2 knots
do[8; p:1_step\[0 0;p;nul]]
#?(,0 0),p                   / part 2: 10 knots
\\
