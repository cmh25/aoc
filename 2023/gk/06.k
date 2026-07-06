/ AoC 2023 day 6: wait for it
L:0:"../06.in"
c0:*1_":"_L 0
c1:*1_":"_L 1
w:" "_c0
T:0$'w@&0<#'w
w:" "_c1
D:0$'w@&0<#'w
*/+/'((T-\t)*\t:!1+|/T)>'D     / part 1: count winning hold times per race
T2:0j$c0@&~c0=" "              / part 2: one big race, digits concatenated
D2:0j$c1@&~c1=" "
l:_0.5*T2-sqrt((T2*T2)-4*D2)
l:l-2                          / quadratic root, then exact long fix-up
while[~(l*T2-l)>D2; l:l+1]
1+T2-2*l                       / winners are l..T2-l by symmetry
\\
