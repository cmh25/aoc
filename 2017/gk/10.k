inp:*0:"../10.in"
knot:{[lens;rounds]                             / returns the 256-element sparse hash
  V::!256; P::0; SK::0
  do[rounds; {[L] ix:(P+!L)!256; @[`V;ix;:;|V ix]; P::(P+L+SK)!256; SK+:1}'lens]
  V}
l1:0$'","_inp
v:knot[l1;1]
(v 0)*v 1                                         / part 1
hx:"0123456789abcdef"
l2:(ic inp),17 31 73 47 23
d:knot[l2;64]
dense:{xor/x}'16 16#d                             / XOR each 16-block
,/{hx[x div 16],hx[x!16]}'dense                   / part 2: 32-char hex
\\
