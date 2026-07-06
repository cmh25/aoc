/ AoC 2025 day 1: safe dial
L:0:"../01.in"
d:(-1+2*"R"=*'L)*0$1_'L      / signed rotations: R -> +, L -> -
A:50++\d                      / unwrapped absolute position after each rotation
+/0=A!100                     / part 1: rests on 0 <=> multiple of 100
b:50,-1_A                     / position before each rotation
f:{$[y>x;(_y%100)-_x%100;(_(x-1)%100)-_(y-1)%100]}  / #100-multiples crossed
+/f'[b;A]                     / part 2: every click that lands on 0
\\
