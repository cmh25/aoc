/ AoC 2022 day 4: camp cleanup
m:0$',/'"-"_''","_'0:"../04.in"   / a-b,c-d -> 4 columns
a:m[;0]; b:m[;1]; c:m[;2]; d:m[;3]
+/((~a>c)&~d>b)|(~c>a)&~b>d       / part 1: one range contains the other
+/(~b<c)&~d<a                     / part 2: ranges overlap at all
\\
