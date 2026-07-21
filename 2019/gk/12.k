L:0:"../12.in"
sg:{(x>0)-x<0}
nums:{. @[x;&~x lin "-0123456789";:;" "]}
pos:nums'L
nm:#pos
step:{[pv] p:pv 0; v:pv 1; v:v+{+/sg p-\p x}'!nm; p:p+v; (p;v)}
st:1000 step/(pos;(nm,3)#0)
+/(+/'abs st 0)*+/'abs st 1
step1:{[pv] p:pv 0; v:pv 1; v:v+{+/sg p-p x}'!nm; p:p+v; (p;v)}
per:{[p0] init:(p0;nm#0); s:step1 init; c:1; while[~s~init; s:step1 s; c+:1]; c}
prs:0j+per'+pos
lcm[lcm[prs 0;prs 1];prs 2]
\\
