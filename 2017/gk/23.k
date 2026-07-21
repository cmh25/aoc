T:{" "_x}'0:"../23.in"
az:"abcdefgh"
ri:{-97+ic*x}
gv:{$[(*x) in az; R@-97+ic*x; 0j+. x]}
n:#T
/ part 1: run with a=0, count mul invocations
R::8#0j; pc:0; muls:0
while[(pc>-1)&pc<n
  t:T pc; op:t 0
  if[op~"set"; R[ri t 1]:gv t 2]
  if[op~"sub"; j:ri t 1; R[j]:R[j]-gv t 2]
  if[op~"mul"; j:ri t 1; R[j]:R[j]*gv t 2; muls+:1]
  jmp:$[(op~"jnz")&~0=gv t 1; (gv t 2)-1; 0]
  pc:pc+1+jmp]
muls
/ part 2: h = count of composite numbers in [106700,123700] step 17
b0:100000+100*0$(*T)2
c0:b0+17000
seq:b0+17*!1+(c0-b0)div 17
comp:{[m] |/0=m!'2+!-1+_sqrt 0.0+m}                / has a divisor -> composite
+/comp'seq
\\
