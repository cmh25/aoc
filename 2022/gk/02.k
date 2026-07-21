/ AoC 2022 day 2: rock paper scissors
L:0:"../02.in"
o:-65+ic *'L                 / opponent shape 0 1 2 (A B C)
c:-88+ic L@'2              / my column 0 1 2 (X Y Z)
+/(c+1)+3 6 0@(c-o+3)!3      / part 1: col = my shape; outcome from (mine-theirs) mod 3
+/1+(3*c)+(o+c+2)!3          / part 2: col = outcome (0 lose 1 draw 2 win); shape = o+c-1 mod 3
\\
