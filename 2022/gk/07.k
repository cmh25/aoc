/ AoC 2022 day 7: no space left on device
stk:(); done:()
pop:{t:*|stk; stk::-1_stk; done::done,t; if[0<#stk; stk[(#stk)-1]::t+*|stk]}
f:{c:*x; $[x~"$ cd .."; pop[]; (4#x)~"$ cd"; stk::stk,0; (c>"/")&c<":"; stk[(#stk)-1]::(0$*" "_x)+*|stk; 0]}
f'0:"../07.in";
while[0<#stk; pop[]]
+/done@&~done>100000         / part 1: sum of small dir totals
&/done@&~done<30000000-70000000-*|done   / part 2: smallest freeing enough
\\
