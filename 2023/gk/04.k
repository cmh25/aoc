/ AoC 2023 day 4: scratchcards
L:0:"../04.in"
ns:{b:"|"_(1+x?":")_x; +/(.(b 1))in\.(b 0)}'L   / matches per card
+/_2^ns-1                    / part 1: n matches -> 2^(n-1) points (floor kills n=0)
c:(#L)#1
i:0
while[i<#L; k:ns i; if[k>0; c[i+1+!k]+:c i]; i:i+1]
+/c                          / part 2: cascading copies
\\
