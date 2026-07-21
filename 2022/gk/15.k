/ AoC 2022 day 15: beacon exclusion zone
m:{c:((x>"/")&x<":")|x="-"; t:" "_@[x;&~c;:;" "]; _0.0$'t@&0<#'t}'0:"../15.in"
SX:m[;0]; SY:m[;1]; BX:m[;2]; BY:m[;3]
R:(abs SX-BX)+abs SY-BY
YR:2000000
h:R-abs SY-YR                / half-width of each sensor's span on the row
i:&~h<0
iv:+(SX[i]-h i;SX[i]+h i)
iv:iv@<iv@'0                 / merge sorted intervals, counting coverage
mg:{[st;p;u] $[p[0]>st 1; (st[0]+1+p[1]-p 0; p 1); p[1]>st 1; (st[0]+p[1]-st 1; p 1); st]}
c:mg/[(0;-2000000000);iv;nul]
c[0]-#?BX@&BY=YR            / part 1: excluded cells on the row
M:4000000
bs:((SY-SX)+R+1),(SY-SX)-R+1 / y=x+b just outside each sensor
cs:((SY+SX)+R+1),(SY+SX)-R+1 / y=-x+c just outside
B:,/(#cs)#'bs; C:,/(#bs)#,cs
X:(C-B)div 2; Y2:X+B
ok:(0=(C-B)!2)&(~X<0)&(~Y2<0)&(~X>M)&~Y2>M
g:{&/R<(abs X[x]-SX)+abs Y2[x]-SY}
j:&ok; s:j@*&g'j
(4000000j*X s)+Y2 s          / part 2: tuning frequency
\\
