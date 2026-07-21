/ AoC 2020 day 6: custom customs
L:0:"../06.in"
g:+\0=#'L; i:&~0=#'L
grp:(L i)@=g@i                             / groups, each a list of people-lines
+/{#?,/x}'grp                              / part 1: union of yes answers
+/{grp:x;+/{[c]&/{c in x}'grp}'?,/grp}'grp  / part 2: answers everyone shares
\\
