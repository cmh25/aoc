/ AoC 2022 day 11: monkey in the middle
L:0:"../11.in"
nm:(2+#L)div 7
gl:{L y+7*x}                 / line y of monkey x's block
IT0:{0j$'","_ssr[(2+gl[x;1]?":")_gl[x;1];", ";","]}'!nm
op:{t:" "_gl[x;2]; v:*|t; k:**-2#t; $[v~"old";2 0j;k~"*";1,0j$v;0,0j$v]}'!nm
OK:*'op; OV:op@'1
DV:{0$*|" "_gl[x;3]}'!nm
TT:{0$*|" "_gl[x;4]}'!nm
FT:{0$*|" "_gl[x;5]}'!nm
aw:{[m;w]$[2=OK m;w*w;1=OK m;w*OV m;w+OV m]}
dm:{[m] w:aw[m;IT m]; w:$[P2;w!MM;w div 3]; CNT[m]::CNT[m]+#w; t:0=w!DV m; IT[m]::0#0j; IT[TT m]::IT[TT m],w@&t; IT[FT m]::IT[FT m],w@&~t}
P2:0; IT:IT0; CNT:nm#0j
do[20; dm'!nm];
*/2#CNT@>CNT                 / part 1
P2:1; MM:*/DV; IT:IT0; CNT:nm#0j
do[10000; dm'!nm];
*/2#CNT@>CNT                 / part 2
\\
