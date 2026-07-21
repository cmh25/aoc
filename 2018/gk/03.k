L:0:"../03.in"
C:.'{@[x;&~x lin "0123456789";:;" "]}'L      / id x y w h
cells:{,/(1000*x[2]+!x 4) +\ x[1]+!x 3}'C
all:,/cells
sz:#'=all
+/1<sz
cnt:@[1000000#0; ?all; :; sz]
C[*&1=|/'cnt@cells; 0]
\\
