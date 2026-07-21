L:0:"../18.in"
h:#L
w:#*L
T:"|"=L
Y:"#"=L
pz:(w+2)#0
off:(0 0;0 1;0 2;1 0;1 2;2 0;2 1;2 2)
cnt:{[m] p:(,pz),(0,'m,'0),(,pz)             / 8-neighbour counts
  +/{p[(x 0)+!h;(x 1)+!w]}'off}
step:{[q] nt:cnt T; ny:cnt Y
  o:~T|Y
  t:(o&nt>2)|T&~ny>2
  Y::(T&ny>2)|Y&(ny>0)&nt>0
  T::t}
rv:{(+/,/T)*+/,/Y}
do[10; step 0]
rv 0
T:"|"=L
Y:"#"=L
H:V:()
k:,/T+2*Y
while[(#H)=H?k                               / iterate until a state repeats
  H,:,k
  V,:rv 0
  step 0
  k:,/T+2*Y]
j:H?k
i:#H
V@j+(1000000000-j)!i-j
\\
