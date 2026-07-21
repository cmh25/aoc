d:.*0:"../08.in"
pp:0
tot:0
node:{[q]
  nc:d pp; nm:d[pp+1]; pp::pp+2
  cv:()
  do[nc; cv,:node 0]
  m:d@pp+!nm; pp::pp+nm
  tot::tot++/m
  $[nc=0; +/m; +/cv@-1+m@&(m>0)&~m>nc]}
v:node 0
tot
v
\\
