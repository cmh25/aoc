/ AoC 2020 day 13: shuttle search
L:0:"../13.in"
t:0$*L
parts:","_L 1
idx:&~{x~,"x"}'parts                           / positions of in-service buses
ids:0j$'parts@idx
w:{(x-t!x)!x}'ids                               / wait per bus
mn:&/w; mn*ids@w?mn                             / part 1: wait * bus id
tt:0j; step:1j; i:0
while[i<#ids; m:ids i
 while[~0=(tt+idx i)!m; tt+:step]
 step*:m; i:i+1]
tt                                             / part 2: CRT alignment
\\
