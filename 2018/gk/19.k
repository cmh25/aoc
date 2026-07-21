L:0:"../19.in"
nm:("addr";"addi";"mulr";"muli";"banr";"bani";"borr";"bori";"setr";"seti";"gtir";"gtri";"gtrr";"eqir";"eqri";"eqrr")
ipr:0$*|" "_*L
P:{t:" "_x; (nm?t 0),0$'1_t}'1_L
op:{[o;r;a;b]
  u:$[a<6; r a; 0j]
  v:$[b<6; r b; 0j]
  $[o=0;u+v; o=1;u+b; o=2;u*v; o=3;u*b
    o=4;u and v; o=5;u and b; o=6;u or v; o=7;u or b
    o=8;u; o=9;a
    o=10;a>v; o=11;u>b; o=12;u>v
    o=13;a=v; o=14;u=b; u=v]}
seed:{[a] r:6#0j; r[0]:a                       / run the setup; it stops at the main loop
  while[~1=r ipr
    i:r ipr
    s:P i
    r[s 3]:op[s 0;r;s 1;s 2]
    r[ipr]:1+r ipr]
  |/r}
sd:{[n] d:1+!_sqrt 0.0+n                       / sum of divisors
  d:d@&0=n!'d
  s:+/d+n div d
  $[n=(*|d)*(*|d); s-*|d; s]}
sd seed 0
sd seed 1
\\
