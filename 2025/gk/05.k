/ AoC 2025 day 5: fresh ranges. P1: count IDs in any range. P2: |union of ranges|
L:0:"../05.in"
i:*&0=#'L                     / blank-line separator
t:+0j$''"-"_'i#L
a:t 0
b:t 1
ids:0j$'(i+1)_L
+/|/(~a>\ids)&~ids>/b         / part 1: in-any-range (no <= in k, use ~a>x)
o:<a
sa:a o
sb:b o
pm:-1_(,-1j),|\sb             / running max end of earlier ranges
+/0j|sb-pm|sa-1               / part 2: union size via clipped contributions
\\
