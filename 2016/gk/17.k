pass:*0:"../17.in"
DIR:"UDLR"; DX:0 0 -1 1; DY:-1 1 0 0

sols:()
frontier:,(0;0;"")
while[0<#frontier;
  next:()
  si:0
  while[si<#frontier;
    st:frontier si; x:st 0; y:st 1; p:st 2
    open:(4#md5 pass,p) lin "bcdef"       / doors U D L R open?
    q4:0
    while[q4<4;
      nx:x+DX q4; ny:y+DY q4
      if[open[q4]&(~nx<0)&(nx<4)&(~ny<0)&ny<4;
        np:p,DIR q4
        $[(nx=3)&ny=3; sols:sols,,np; next:next,,(nx;ny;np)]]
      q4:q4+1]
    si:si+1]
  frontier:next]

*sols                                     / part 1: shortest (BFS order)
|/#'sols                                  / part 2: longest path length
\\
