p:ic*0:"../05.in"
react:{[s]                        / stack machine, returns the reduced length
  n:#s
  stk::n#0
  q:0
  i:0
  while[i<n
    c:s i
    h:$[q>0; 32=abs c-stk q-1; 0]
    if[h; q-:1]
    if[~h; @[`stk;q;:;c]; q+:1]
    i+:1]
  q}
react p
&/{react p@&~p lin x,x-32}'97+!26
\\
