L:0:"../25.in"
up:"ABCDEFGH"
start:-65+ic*|(L 0)@&(L 0) lin up
N:0$(L 1)@&(L 1) lin "0123456789"
wl:L@&{0<#ss[x;"Write"]}'L
ml:L@&{0<#ss[x;"Move"]}'L
nl:L@&{0<#ss[x;"Continue"]}'L
Wr:{0$x@&x lin "01"}'wl
Mv:{$[#ss[x;"right"];1;-1]}'ml
Nx:{-65+ic*|x@&x lin up}'nl
ns:(#Wr)div 2
Wr:(ns,2)#Wr
Mv:(ns,2)#Mv
Nx:(ns,2)#Nx
TP::1000000#0
pos:500000
st:start
do[N
  v:TP pos
  @[`TP;pos;:;Wr[st;v]]
  pos+:Mv[st;v]
  st:Nx[st;v]]
+/TP
\\
