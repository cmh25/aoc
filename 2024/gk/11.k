/ AoC 2024 day 11: plutonian pebbles
L:0:"../11.in"
v0:0j$" "_*L
pw:*\1j,18#10j                 / 10j^!19, exact
step:{v:x 0; c:x 1             / stones as (distinct values; counts)
 d:+/~pw>\v                    / digit count per stone (each-left power table)
 i0:&v=0j; i1:&(~0=d!2)&~v=0j; i2:&(0=d!2)&~v=0j
 vv:v@i2; hh:pw@_(d@i2)%2; cc:c@i2
 nv:((#i0)#1j),((v@i1)*2024j),(vv div hh),vv!'hh   / 0->1, odd->*2024, even->halves
 nc:(c@i0),(c@i1),cc,cc
 (?nv;+/'nc@=nv)}              / group-sum duplicate values
r:25 step/(?v0;0j+#'=v0)
+/r 1                          / part 1: stones after 25 blinks
/ part 2: stones after 75 blinks
r:50 step/r
+/r 1
\\
