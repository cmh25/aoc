/ AoC 2022 day 10: cathode-ray tube
L:0:"../10.in"
ds:,/{$[x~"noop";,0;(0;_0.0$*|" "_x)]}'L   / per-cycle deltas (addx lands after 2)
d:1,-1_1++\ds                / X during each cycle
cs:20 60 100 140 180 220
+/cs*d cs-1                  / part 1: summed signal strengths
(6,40)#".#"@2>abs d-(!#d)!40 / part 2: read the 8 letters
\\
