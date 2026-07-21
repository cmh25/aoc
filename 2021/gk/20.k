/ AoC 2021 day 20: trench map
L:0:"../20.in"
alg:"#"=*L
g:"#"='2_L
w9:256 128 64 32 16 8 4 2 1
stp:{[g;bg] wd:#*g; zz:(wd+4)#bg
 g2:(,zz),(,zz),({(2#bg),x,2#bg}'g),(,zz),,zz
 ho:2+#g; wo:wd+2
 alg@+/w9*{g2[x[0]+!ho;x[1]+!wo]}'(0 0;0 1;0 2;1 0;1 1;1 2;2 0;2 1;2 2)}
bg:0
do[2; g:stp[g;bg]; bg:alg@511*bg]
+/,/g                        / part 1: lit after 2 steps
do[48; g:stp[g;bg]; bg:alg@511*bg]
+/,/g                        / part 2: after 50
\\
