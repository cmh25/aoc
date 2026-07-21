/ AoC 2020 day 9: encoding error
v:0j$'0:"../09.in"
w:25                                          / preamble length
n:#v; i:w; bad:0
while[bad=0; s:v i; win:v@(i-w)+!w; t:s-win
 if[~|/(t lin win)&~t=win; bad:s]; i:i+1]
bad                                           / part 1: first non-sum
ps:0,+\v                                       / prefix sums
i:0; r:0
while[r=0; j:ps?ps[i]+bad
 if[(j<#ps)&j>i+1; seg:v@i+!j-i; r:(&/seg)+|/seg]; i:i+1]
r                                             / part 2: min+max of the run
\\
