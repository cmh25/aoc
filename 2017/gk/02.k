tb:ci 9
M:{0$tb_x}'0:"../02.in"                       / rows of ints (tab-separated)
+/{(|/x)-&/x}'M                               / part 1: max-min per row
row2:{d:x; +/{[a] q:d@&(d>a)&0=d!'a; $[#q;(*q) div a;0]}'d}
+/row2'M                                       / part 2: sum of even-division quotients
\\
