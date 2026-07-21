t:0$*0:"../20.in"
N:1000000
s:(N+1)#0
e:1
while[e<N+1; @[`s;e*1+!N div e;+;10*e]; e:e+1]
*&~s<t
s2:(N+1)#0
e:1
while[e<N+1; @[`s2;e*1+!50&N div e;+;11*e]; e:e+1]
*&~s2<t
\\
