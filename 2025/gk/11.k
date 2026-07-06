/ AoC 2025 day 11: DAG path counts via fixpoint c = ind + A.c (converge).
/ P2: paths svr->out through BOTH dac and fft: inclusion-exclusion over
/ avoid-sets (zero the avoided node's row+col).
L:0:"../11.in"
tk:" "_'L
nm:-1_'*'tk
ch:1_'tk
ns:?nm,,/ch
n:#ns
A:(n;n)#0j
{[i;cs] A[i;cs]::1j}'[ns?/nm;{ns?/x}'ch];
ind:@[n#0j;ns?"out";:;1j]
c:{ind++/'A*\x}/ind
c ns?"you"                     / part 1
SV:ns?"svr"
DA:ns?"dac"
FF:ns?"fft"
pc:{[av] mv:@[n#1j;av;:;0j]; a2:*'[mv;A*\mv]; r:{ind++/'a2*\x}/ind; r SV}
p0:pc@!0
p1:pc@,DA
p2:pc@,FF
p3:pc@DA,FF
((p0-p1)-p2)+p3                / part 2
\\
