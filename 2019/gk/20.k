L:0:"../20.in"
w:|/#'L
L:{x,(w-#x)#" "}'L
h:#L
CG:ic'L
DOT:46
isL:{(x>64)&x<91}
sk:{`$"s",$x}
P::()
addP:{[lab;dx;dy] o:(dx<3)|(dy<3)|(dx>w-4)|(dy>h-4); P::P,,(lab;dx+w*dy;o)}
{[y]{[x;y]
   c:CG[y]@x;
   if[isL c;
     if[$[x<w-1;isL CG[y]@x+1;0];
        lab:`$(L[y]@x),L[y]@x+1;
        if[$[x>0;DOT=CG[y]@x-1;0]; addP[lab;x-1;y]];
        if[$[x<w-2;DOT=CG[y]@x+2;0]; addP[lab;x+2;y]]];
     if[$[y<h-1;isL CG[y+1]@x;0];
        lab:`$(L[y]@x),L[y+1]@x;
        if[$[y>0;DOT=CG[y-1]@x;0]; addP[lab;x;y-1]];
        if[$[y<h-2;DOT=CG[y+2]@x;0]; addP[lab;x;y+2]]]]}[;y]'!w}'!h;
labels:{x 0}'P
sf:(P@*&labels~\`AA)1
ef:(P@*&labels~\`ZZ)1
PP::(h*w)#-1; PO::(h*w)#0
{[lab] es:P@&labels~\lab; if[1<#es; a:es 0; b:es 1;
   @[`PP;a 1;:;b 1]; @[`PO;a 1;:;a 2]; @[`PP;b 1;:;a 1]; @[`PO;b 1;:;b 2]]}'?labels;
pass:{DOT=CG[x div w]@x!w}
HW:h*w
/ ---- part1 BFS (array queue, head/tail pointers) ----
DA::HW#-1; @[`DA;sf;:;0]; Q::(HW+8)#0; @[`Q;0;:;sf]; QH::0; QT::1; a1:-1
while[$[QH<QT;a1<0;0];
  c:Q QH; QH+:1; d:DA c;
  if[c=ef; a1:d];
  nb:(1+c;c-1;c+w;c-w); ei:0;
  while[ei<4; n:nb ei; if[$[pass n;(DA n)<0;0]; @[`DA;n;:;d+1]; @[`Q;QT;:;n]; QT+:1]; ei+:1];
  if[$[(PP c)>-1;(DA PP c)<0;0]; @[`DA;PP c;:;d+1]; @[`Q;QT;:;PP c]; QT+:1]]
a1
/ ---- part2 BFS (recursive levels; array queue; level cap) ----
DI::.(); @[`DI;sk sf;:;0]; Q::300000#0j; @[`Q;0;:;sf]; QH::0; QT::1; a2:-1
while[$[QH<QT;a2<0;0];
  s:Q QH; QH+:1; d:DI sk s; cell:s!HW; lev:s div HW;
  if[$[cell=ef;lev=0;0]; a2:d];
  if[a2<0;
    nb:(1+cell;cell-1;cell+w;cell-w); ei:0;
    while[ei<4; n:nb ei; ns:n+lev*HW; if[$[pass n;(DI sk ns)~nul;0]; @[`DI;sk ns;:;d+1]; @[`Q;QT;:;ns]; QT+:1]; ei+:1];
    if[(PP cell)>-1;
       nl:$[PO cell; lev-1; lev+1];
       if[$[nl>-1;nl<40;0]; ns:(PP cell)+nl*HW;
          if[(DI sk ns)~nul; @[`DI;sk ns;:;d+1]; @[`Q;QT;:;ns]; QT+:1]]]]]
a2
\\
