/ AoC 2022 day 18: boiling boulders
m:1+0$'","_'0:"../18.in"   / shift +1 so the box has an empty shell
s:2+|/,/m
G:@[(s*s*s)#0;m[;0]+(s*m[;1])+s*s*m[;2];:;1]
n:+/G
a:+/(G*(1_G),0)+(G*(s_G),s#0)+G*((s*s)_G),(s*s)#0
(6*n)-2*a                    / part 1: total surface
sh:{((1_x),0)+(0,-1_x)+((s_x),s#0)+((s#0),(-s)_x)+(((s*s)_x),(s*s)#0)+((s*s)#0),(-s*s)_x}
F:{x|(~G)&0<sh x}/@[(s*s*s)#0;0;:;1]   / air reachable from the corner
+/G*sh F                     / part 2: faces touching exterior air
\\
