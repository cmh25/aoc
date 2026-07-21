L:0:"../06.in"
pr:")"_'L
A:*'pr                        / parents
B:{x 1}'pr                    / children
u:?A,B                        / distinct object names
n:#u
par:@[n#-1; u?/B; :; u?/A]    / par[id child] = id parent  (root stays -1)
depth:{c:0; j:x; while[~-1=par j; j:par j; c+:1]; c}
+/depth'!n
anc:{r:(); j:x; while[~-1=par j; j:par j; r:r,j]; r}
you:anc u?"YOU"
san:anc u?"SAN"
&/{(you?x)+san?x}'you@&you lin san
\\
