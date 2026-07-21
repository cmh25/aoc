key:*0:"../14.in"
knot:{[lens] V::!256; P::0; SK::0
  do[64; {[L] ix:(P+!L)!256; @[`V;ix;:;|V ix]; P::(P+L+SK)!256; SK+:1}'lens]
  V}
khbits:{d:{xor/x}'16 16#knot@(ic x),17 31 73 47 23; ,/{(8#2)vs x}'d}    / 128 bits
G:khbits'({key,"-",$x}'!128)                       / 128x128 grid of 0/1
+/,/G                                            / part 1: used squares
/ part 2: connected components (4-adjacency) via union-find over used cells
F:,/G
n:16384
pp::!n
fnd:{while[~x=pp x; x:pp x]; x}
uni:{[a;b] if[F[a]&F[b]; ra:fnd a; rb:fnd b; if[~ra=rb; pp[ra]::rb]]}
r:!128
{[i] j:!128
  {[i;j] c:i+128*j
    if[j<127; uni[c;c+128]]                       / down
    if[i<127; uni[c;c+1]]}[i;]'j}'r;              / right
+/{F[x]&x=fnd x}'&F                                / part 2: number of used roots
\\
