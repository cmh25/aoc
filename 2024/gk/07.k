/ AoC 2024 day 7: bridge repair
L:0:"../07.in"
pw:*\1j,18#10j
ps:{c:":"_x; ww:" "_1_c 1; ww:ww@&0<#'ww; (0j$c 0; 0j$'ww; pw@#'ww)}'L
ok1:{t:x 0; v:x 1; g:{[r;a;z] u:(r+a),r*a; ?u@&~u>t}; t in g/[,*v;1_v;nul]}
ok2:{t:x 0; v:x 1; g:{[r;a;b] u:(r+a),(r*a),a+r*b; ?u@&~u>t}; t in g/[,*v;1_v;1_x 2]}
ts:*'ps
+/ts*ok1'ps                   / part 1: + * left-to-right
+/ts*ok2'ps                   / part 2: also || concat (r*10^digits + n)
\\
