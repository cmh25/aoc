/ AoC 2024 day 10: hoof it
L:0:"../10.in"
g:{-48+ic x}'L                 / height grid
n:#g; w:#*g
zr:w#0
nb:{((1_x),,zr)+((,zr),-1_x)+({(1_x),0}'x)+{0,-1_x}'x}  / sum of 4 shifts
oh:{a:(n*w)#0; a[x]:1; (n,w)#a}                          / one-hot grid from flat idx
sc:{m:oh x; m:{[m;h;z] (g=h)*0<nb m}/[m;1+!9;nul]; +/,/m}  / flood up by height
+/sc'&,/g=0                    / part 1: sum of trailhead scores (distinct 9s)
c:{[c;h;z] (g=h)*nb c}/[0+g=9;|!9;nul]  / path-count DP from the 9s down
+/,/c                          / part 2: sum of ratings (distinct trails)
\\
