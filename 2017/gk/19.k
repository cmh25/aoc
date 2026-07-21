L:0:"../19.in"
W:|/#'L
H:#L
G:,/{x,(W-#x)#" "}'L
x:(*L)?"|"
y:0
dx:0; dy:1
let:""
steps:1
done:0
while[~done
  x+:dx; y+:dy
  if[(x<0)|(x>W-1)|(y<0)|y>H-1; done:1]
  if[~done
    c:G@x+W*y
    if[c=" "; done:1]
    if[~done
      steps+:1
      k:ic c
      if[(k>64)&k<91; let,:c]
      if[c="+"
        vert:dx=0
        if[vert; dx:$[(x>0)&~" "=G@(x-1)+W*y; -1; 1]; dy:0]
        if[~vert; dy:$[(y>0)&~" "=G@x+W*(y-1); -1; 1]; dx:0]]]]]
let
steps
\\
