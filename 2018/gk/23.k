P:.'{@[x;&~x lin "-0123456789";:;" "]}'0:"../23.in"
X:P[;0]; Y:P[;1]; Z:P[;2]; R:P[;3]
i:*&R=|/R
+/~((abs X-X i)+(abs Y-Y i)+abs Z-Z i)>R i
cnt:{[a;b;c;s] e:s-1                          / bots that can reach the box
  dx:0|(a-X)|X-a+e
  dy:0|(b-Y)|Y-b+e
  dz:0|(c-Z)|Z-c+e
  +/~(dx+dy+dz)>R}
d0:{[a;b;c;s] e:s-1                           / box's closest distance to the origin
  (0|a|-(a+e))+(0|b|-(b+e))+0|c|-(c+e)}
m:|/(abs X),(abs Y),abs Z
s:1
while[s<m+1; s*:2]
BX:,-s; BY:,-s; BZ:,-s; BS:,2*s
BC:,cnt[-s;-s;-s;2*s]
BD:,d0[-s;-s;-s;2*s]
ans:-1
while[ans<0
  k:&BC=|/BC
  k:k@&(BD k)=&/BD k
  i:k@*&(BS k)=&/BS k                         / best: most bots, then nearest, then smallest
  if[1=BS i; ans:BD i]
  if[ans<0
    a:BX i; b:BY i; c:BZ i; h:(BS i) div 2
    BX:BX di i; BY:BY di i; BZ:BZ di i; BS:BS di i; BC:BC di i; BD:BD di i
    j:0
    while[j<8
      na:a+h*j!2; nb:b+h*(j div 2)!2; nc:c+h*j div 4
      BX,:na; BY,:nb; BZ,:nc; BS,:h
      BC,:cnt[na;nb;nc;h]
      BD,:d0[na;nb;nc;h]
      j+:1]]]
ans
\\
