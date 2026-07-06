/ AoC 2024 day 2: red-nosed reports
R:.'0:"../02.in"
sf:{d:(1_x)- -1_x; (&/(d>0)&d<4)|&/(d<0)&d>-4}   / safe: monotone, steps 1..3
+/sf'R                                            / part 1
+/{r:x; (sf r)||/sf'({r di x}'!#r)}'R             / part 2: dampener, drop each index
\\
