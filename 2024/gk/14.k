/ AoC 2024 day 14: restroom redoubt
L:0:"../14.in"
c:+{_0.0$p@&0<#'p:","_@[x;&~x lin "0123456789,-";:;","]}'L
px:c 0; py:c 1; vx:c 2; vy:c 3
W:101; H:103
X:(px+(100*vx)+100*W)!W                   / positions after 100s (mod, kept positive)
Y:(py+(100*vy)+100*H)!H
mx:_W%2; my:_H%2
(+/(X<mx)&Y<my)*(+/(X>mx)&Y<my)*(+/(X<mx)&Y>my)*+/(X>mx)&Y>my   / part 1: quadrant product
/ part 2: earliest time the robots cluster into the tree picture;
/ x pattern repeats mod W, y mod H: take min-variance phase of each, CRT-combine
var:{m:(+/x)%#x; (+/(x-m)^2)%#x}
tx:*<{var(px+(x*vx)+x*W)!W}'!W
ty:*<{var(py+(x*vy)+x*H)!H}'!H
tx+W*((((ty-tx)*modinv[W;H])!H)+H)!H
\\
