/ AoC 2024 day 5: print queue
/ part 2: reorder the incorrect updates by the rules, sum their middle pages
L:0:"../05.in"
e:*&0=#'L                  / blank line splits rules from updates
ru:0$'"|"_'e#L
us:0$'","_'(1+e)_L
fr:+ru
M:100 100#@[10000#0;(100*fr 0)+fr 1;:;1]   / M[a;b]=1 iff rule a|b (pages are 2-digit)
og:{c:+/M[x;x]; c~!#x}        / ordered iff predecessor-count = position
o:og'us
t:us@&o
+/t@'_(#'t)%2                     / part 1
+/{(x@<+/M[x;x])@_(#x)%2}'us@&~o   / part 2: place by pred count
\\
