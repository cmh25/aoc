/ AoC 2024 day 12: garden groups
L:0:"../12.in"
G:ic'L
n:#G; w:#*G
a:(,w#0),-1_G; b:(1_G),,w#0              / grid shifted down / up (0 = border)
mU:G=a; mD:G=b                           / same-plant masks, 4 dirs + 4 diagonals
mL:G=0,'-1_'G; mR:G=(1_'G),'0
mUL:G=0,'-1_'a; mUR:G=(1_'a),'0
mDL:G=0,'-1_'b; mDR:G=(1_'b),'0
stepl:{nU:(,x 0),-1_x; nD:(1_x),,x(n-1); nL:(*'x),'-1_'x; nR:(1_'x),'*'|'x
 x&((mU*nU)+(~mU)*x)&((mD*nD)+(~mD)*x)&((mL*nL)+(~mL)*x)&(mR*nR)+(~mR)*x}
lab:stepl/(n;w)#!n*w                     / region labels: converge min over same-plant nbrs
gs:=,/lab
area:0j+#'gs
p:,/4-mU+mD+mL+mR                        / per-cell fence segments
+/area*+/'p@gs                           / part 1: sum area*perimeter
/ part 2: price = area * number of straight SIDES = corner count per region
cn:((~mU)&~mL)+((~mU)&~mR)+((~mD)&~mL)+((~mD)&~mR)+(mU&mL&~mUL)+(mU&mR&~mUR)+(mD&mL&~mDL)+mD&mR&~mDR
cs:,/cn
+/area*+/'cs@gs
\\
