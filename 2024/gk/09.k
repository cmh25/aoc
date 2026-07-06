/ AoC 2024 day 9: disk fragmenter
L:0:"../09.in"
t0:*L
d:-48+ic t0                    / digit vector
nf:(1+#d) div 2
fl:d@2*!nf                     / file lengths
glp:(d@1+2*!nf-1),0            / gap lengths (padded)
lay:,/{((fl x)#x),(glp x)#-1}'!nf   / expanded disk, -1 = free
T:+/fl
res:T#lay
hs:&res=-1
fb:lay@&~lay=-1
res[hs]:(#hs)#|fb              / fill holes from reversed tail blocks
+/(0j+!T)*res                  / part 1: block-move checksum
st:0,-1_+\fl+glp               / file start positions
gstm:st+fl                     / gap start positions
gln:glp                        / gap remaining lengths
i:nf-1
/ part 2: move whole files, descending id, leftmost gap that fits
while[i>0; fli:fl i; c:(~gln<fli)&gstm<st i; wv:&c; if[0<#wv; j:*wv; st[i]:gstm j; gstm[j]:(gstm j)+fli; gln[j]:(gln j)-fli]; i:i-1]
+/(0j+!nf)*((0j+fl)*st)+(0j+fl*fl-1) div 2
\\
