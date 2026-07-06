/ AoC 2024 day 25: code chronicle
L:0:"../25.in"
G:L@&0<#'L                     / drop blank separator lines
B:((#G)div 7;7)#G              / 7-row schematics
C:+/'"#"=B                    / # count per column of each block
lk:"#"=*'*'B                  / lock: top row filled; else key
+/,/{[v] +/&/'8>(C@&~lk)+\v}'C@&lk   / fit: lock+key column counts all <8
/ part 2 is the free 50th star
\\
