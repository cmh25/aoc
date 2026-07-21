T:" "_'0:"../07.in"
N:*'|'T
R:-2_'T
V:(#N)#-1
ev:{[w] w:(),w
  if[(*w) in "0123456789"; :0$w]
  i:N?w
  if[~0>V i; :V i]
  r:R i
  v:$[1=#r; ev[*r]
     (*r)~"NOT"; 65535 xor ev r 1
     (r 1)~"AND"; (ev[*r]) and ev r 2
     (r 1)~"OR"; (ev[*r]) or ev r 2
     (r 1)~"LSHIFT"; ((ev[*r])*_2^0$r 2)!65536
     ((ev[*r]) div _2^0$r 2)]
  V[i]::v
  v}
p1:ev "a"
p1
V:(#N)#-1
V[N?,"b"]:p1
ev "a"
\\
