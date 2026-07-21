g:0:"../24.in"
b0:,/{"#"=x}'g                          / 25 cells row-major
P2:1,*\24#2
orthN:{[i] r:i div 5; c:i!5; a:(); if[r>0;a,:i-5]; if[r<4;a,:i+5]; if[c>0;a,:i-1]; if[c<4;a,:i+1]; a}
/ ---- part1 ----
NB:orthN'!25
step1:{[b] {[b;i] cnt:+/b NB i; $[b i; cnt=1; (cnt=1)|cnt=2]}[b]'!25}
bio:{+/x*P2}
seen:(); b:b0; r1:-1
while[r1<0; v:bio b; if[v in seen; r1:v]; if[~v in seen; seen,:v; b:step1 b]]
r1
/ ---- part2: recursive grids ----
M:{[i] ns:orthN i; @[25#0; ns@&~ns=12; :; 1]}'!25   / same-level adj (center excluded)
OFF:210; NL:421
G::@[{25#0}'!NL; OFF; :; 1*b0]                       / center level = input
STEPS:200
outer:{[go] o:@[25#0; 0 1 2 3 4;+;go 7]; o:@[o;20 21 22 23 24;+;go 17]; o:@[o;0 5 10 15 20;+;go 11]; @[o;4 9 14 19 24;+;go 13]}
inner:{[gi] c:@[25#0; 7;:;+/gi 0 1 2 3 4]; c:@[c;17;:;+/gi 20 21 22 23 24]; c:@[c;11;:;+/gi 0 5 10 15 20]; @[c;13;:;+/gi 4 9 14 19 24]}
onestep:{
  NG::G;
  L:1; while[L<NL-1;
    gL:G L; cnt:({+/x*gL}'M)+(outer G L-1)+inner G L+1;
    nw:(gL&cnt=1)|(~gL)&(cnt=1)|cnt=2; nw:@[nw;12;:;0];
    @[`NG;L;:;nw]; L+:1];
  G::NG}
do[STEPS; onestep[]]
+/,/G
\\
