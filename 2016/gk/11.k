/ Radioisotope BFS. State = (elevator floor E; gen floors G; chip floors C), floors 0-3.
/ Canonical key: sort the (gen,chip) pairs (elements are interchangeable).

solve:{[G0;C0]
  np:#G0
  enc:{[E;G;C] E+4*16 sv {x@<x}(4*G)+C}
  dec:{[k] X:k div 4; cds:(np#16) vs X; (k!4; cds div 4; cds!4)}
  valid:{[G;C] ~|/(~G=C)&C lin G}
  goal:enc[3;np#3;np#3]
  start:enc[0;G0;C0]

  nbrs:{[k]
    s:dec k; E:s 0; G:s 1; C:s 2
    T:(0,'&G=E),(1,'&C=E)            / movable tokens on floor E: (kind;idx)
    nt:#T
    subs:,'!nt                        / singletons
    a:0; while[a<nt; b:a+1; while[b<nt; subs:subs,,(a;b); b:b+1]; a:a+1]
    res:()
    dq:0
    while[dq<2; nE:E+-1 1 dq
      if[(~nE<0)&nE<4;
         si:0
         while[si<#subs; sub:subs si
           nG:G; nC:C
           ti:0
           while[ti<#sub; tok:T sub ti;
             if[0=tok 0; nG:@[nG;tok 1;:;nE]]; if[1=tok 0; nC:@[nC;tok 1;:;nE]]; ti:ti+1]
           if[valid[nG;nC]; res:res,enc[nE;nG;nC]]
           si:si+1]]
      dq:dq+1]
    res}

  visited:,start
  frontier:,start
  dist:0
  while[1;
    nxt:?,/nbrs'frontier
    nxt:nxt dvl visited
    dist:dist+1
    if[goal in nxt; :dist]
    visited:visited,nxt
    frontier:nxt]}

/ input: gens Po Th Pm Ru Co all on floor 0; chips Po,Pm on floor 1, rest floor 0
solve[5#0; 1 0 1 0 0]                 / part 1
solve[7#0; 1 0 1 0 0 0 0]             / part 2 (adds Elerium + Dilithium pairs on floor 0)
\\
