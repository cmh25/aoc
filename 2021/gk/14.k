/ AoC 2021 day 14: extended polymerization
L:0:"../14.in"
tm:*L
rl:2_L
pr:2#'rl; ins:rl@'6
t1:pr?/(*'pr),'ins; t2:pr?/ins,'pr@'1
c:@[(#pr)#0j;pr?/(-1_tm),'1_tm;+;1j]
stp:{@[@[(#pr)#0j;t1;+;x];t2;+;x]}
do[10; c:stp c]
ch:?,/pr
mm:{cc:@[@[(#ch)#0j;ch?/*'pr;+;x];ch?*|tm;+;1j]; nz:cc@&cc>0j; (|/nz)-&/nz}
mm c                         / part 1: 10 steps
do[30; c:stp c]
mm c                         / part 2: 40 steps
\\
