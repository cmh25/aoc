C::0$'"/"_/0:"../24.in"                                   / each row [a b]
m::#C
bits::*\1j,(m-1)#2j                               / bit value per component
best::0j
bl::0 0j                                           / (length; strength) for part 2
dfs:{[port;used;strg;len]
  if[strg>best; best::strg]
  if[(len>*bl)|(len=*bl)&strg>bl 1; bl::(len;strg)]
  {[i] if[0=used and bits i
    a:C[i;0]; b:C[i;1]
    if[(a=port)|b=port
      dfs[$[a=port;b;a]; used or bits i; strg+a+b; len+1]]]}'!m}
dfs[0;0j;0j;0];
best                                              / part 1
bl 1                                              / part 2
\\
