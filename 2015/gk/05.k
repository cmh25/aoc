L:0:"../05.in"
n1:{[s] v:2<+/s lin "aeiou"; d:|/(1_s)=-1_s; b:|/{0<#ss[x;y]}[s]'("ab";"cd";"pq";"xy"); v&d&~b}
+/n1'L
n2:{[s] p:(-1_s),'1_s; a:|/1<(!#p)-p?/p; b:|/(2_s)=-2_s; a&b}
+/n2'L
\\
