/ AoC 2024 day 8: resonant collinearity
L:0:"../08.in"
n:#L; w:#*L
flat:,/L
ai:&~flat="."                              / antenna flat indices
P:{(_x%w;x!w)}'ai                          / (row;col) per antenna
gs:=flat ai                                / group antennas by frequency char
prs:{m:#x; ,/{[i] i,'(i+1)+!(m-1)-i}'!m-1} / all index pairs i<j
pp:,/{[g] t:P g; t prs t}'gs               / all same-freq position pairs
cnt:{t:+x; r:t 0; c:t 1; #?((r*w)+c)@&(~r<0)&(~c<0)&(r<n)&c<w}   / distinct in-bounds
ab:+pp; as:ab 0; bs:ab 1
cnt((2*as)-bs),(2*bs)-as                   / part 1: 2a-b and 2b-a antinodes
span:n|w
ks:(-span)+!1+2*span
ds:bs-as
cnt@,/{as+x*ds}'ks                         / part 2: every grid point on each pair line
\\
