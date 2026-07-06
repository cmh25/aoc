/ AoC 2024 day 4: ceres search
/ part 2: count X-shaped crossings of two MAS/SAM diagonals centered on A
G:0:"../04.in"
n:#G
w:#*G
p3:3#,(w+6)#"."
P:p3,({("...",x),"..."}'G),p3   / grid in a 3-deep "." border
dirs:(0 1;0 -1;1 0;-1 0;1 1;1 -1;-1 1;-1 -1)
f:{[d] S:{[a;b;k] P[(3+k*a)+!n;(3+k*b)+!w]}[d 0;d 1]'!4; +/,/("X"=S 0)&("M"=S 1)&("A"=S 2)&"S"=S 3}
+/(f'dirs)                      / part 1: XMAS rays in all 8 directions
c:P[3+!n;3+!w]
ul:P[2+!n;2+!w]
dr:P[4+!n;4+!w]
ur:P[2+!n;4+!w]
dl:P[4+!n;2+!w]
d1:((ul="M")&dr="S")|(ul="S")&dr="M"
d2:((ur="M")&dl="S")|(ur="S")&dl="M"
+/,/(c="A")&d1&d2               / part 2
\\
