/ AoC 2022 day 1: calorie counting
L:0:"../01.in"
i:&~0=#'L                    / nonblank lines
n:0$'L i                     / calories
t:+/'n@=(+\0=#'L)@i       / total per elf (blank-line runs advance the group id)
|/t                          / part 1: max elf total
+/3#t@>t                     / part 2: top three
\\
