L:0:"../12.in"
id:{0$*" "_x}'L
nb:{p:ss[x;"> "]; 0$'","_ssr[(2+*p)_x;", ";","]}'L   / neighbours per line
n:#L
pp::!n
fnd:{while[~x=pp x; x:pp x]; x}
uni:{[a;b] ra:fnd a; rb:fnd b; if[~ra=rb; pp[ra]::rb]}
{[i] uni[id i;]'nb i}'!n;
roots:fnd'!n
+/roots=fnd 0                                    / part 1: size of 0's group
#?roots                                          / part 2: number of groups
\\
