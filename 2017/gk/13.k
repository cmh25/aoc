L:0:"../13.in"
M:{0$'" "_ssr[x;": ";" "]}'L                     / [depth range] per line
dep:M[;0]
rng:M[;1]
per:2*rng-1                                      / scanner period
+/{[i] $[0=(dep i)!per i; (dep i)*rng i; 0]}'!#L  / part 1: severity (delay 0)
B:200000
t0:0
ans:-1
while[ans<0
  T:t0+!B
  bad:B#0
  i:0
  while[i<#L; bad:bad|0=(T+dep i)!per i; i+:1]
  s:&~bad
  if[#s; ans:t0+*s]
  t0+:B]
ans                                              / part 2: min safe delay
\\
