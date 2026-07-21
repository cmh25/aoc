L:0:"../22.in"
dep:.@[*L;&~(*L) lin "0123456789";:;" "]
u:.@[L 1;&~(L 1) lin "0123456789";:;" "]
tx:u 0
ty:u 1
W:tx+120
H:ty+120
RS:()
prow:()
y:0
while[y<H                                     / erosion levels, row by row
  row:W#0
  g:$[y=0;0;48271*y]
  row[0]:(g+dep)!20183
  x:1
  while[x<W
    g:$[y=0; 16807*x; (y=ty)&x=tx; 0; (row x-1)*prow x]
    row[x]:(g+dep)!20183
    x+:1]
  RS,:,row
  prow:row
  y+:1]
E:,/RS
TY:E!3                                        / 0 rocky 1 wet 2 narrow
+/TY@,/(W*!ty+1)+\!tx+1
NC:W*H
D:(3*NC)#99999
mx:2000
B:mx#,()
D[1]:0                                        / cell 0, tool 1 (torch)
B[0]:,1
rx:{[ns;nd] w:&(D ns)>nd
  ns:ns w
  if[#ns; D[ns]::nd; B[nd]::(B nd),ns]}
d:0
while[d<mx-8
  q:B d
  if[#q
    q:?q@&(D q)=d
    if[#q
      cl:q div 3
      tv:q!3
      t0:TY cl
      rx[(3*cl)+3-tv+t0; d+7]                 / swap to the one other legal tool
      x:cl!W
      y:cl div W
      m:&x>0
      if[#m; nc:(cl m)-1; t2:tv m; k:&~t2=TY nc; if[#k; rx[(3*nc k)+t2 k; d+1]]]
      m:&x<W-1
      if[#m; nc:1+cl m; t2:tv m; k:&~t2=TY nc; if[#k; rx[(3*nc k)+t2 k; d+1]]]
      m:&y>0
      if[#m; nc:(cl m)-W; t2:tv m; k:&~t2=TY nc; if[#k; rx[(3*nc k)+t2 k; d+1]]]
      m:&y<H-1
      if[#m; nc:W+cl m; t2:tv m; k:&~t2=TY nc; if[#k; rx[(3*nc k)+t2 k; d+1]]]]]
  d+:1]
D@1+3*tx+W*ty
\\
