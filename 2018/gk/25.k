P:.'0:"../25.in"
n:#P
pp:!n
fnd:{while[~x=pp x; x:pp x]; x}
uni:{[a;b] ra:fnd a; rb:fnd b; if[~ra=rb; pp[ra]::rb]}
lnk:{d:+/'abs P-\P x; uni[x;]'&d<4}          / join x to every point within manhattan 3
lnk'!n;
#?fnd'!n
\\
