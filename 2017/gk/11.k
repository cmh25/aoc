tok:","_*0:"../11.in"
dirs:((,"n");(,"s");"ne";"sw";"nw";"se")
vec:(0 1 -1;0 -1 1;1 0 -1;-1 0 1;-1 1 0;1 -1 0)
D:vec@dirs?/tok                                 / per-step cube deltas
C:+\D                                           / cumulative position
dist:(+/'abs C) div 2                            / hex distance at each step
*|dist                                          / part 1: final distance
|/dist                                          / part 2: max distance ever
\\
