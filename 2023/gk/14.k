/ AoC 2023 day 14: parabolic reflector dish
m:0:"../14.in"
T:{k:(3*+\'"#"=x)+("O"=x)+2*"."=x; x@'<'k}    / tilt west: stable-sort each row by (#-segment; #<O<.)
ld:{+/(|1+!#x)*+/'"O"=x}
ld@+T@+m                     / part 1: load after tilting north
spin:{x:+T@+x; x:T x; x:+|'T(|'+x); |'T(|'x)}
H:()
g:m
while[(#H)=H?,/g; H:H,,,/g; g:spin g]        / iterate spins until a state repeats
i:H?,/g
ld((#m),#*m)#H@i+(1000000000-i)!(#H)-i       / part 2: index the cycle at 1e9
\\
