/ AoC 2020 day 24: lobby layout (hex grid, doubled-width coords)
L:0:"../24.in"
walk:{[s] x:0;y:0;i:0
 while[i<#s; c:s i
  if[c=*"e";x+:2]
  if[c=*"w";x-:2]
  if[c=*"n";i+:1;$[(s i)=*"e";x+:1;x-:1];y+:1]
  if[c=*"s";i+:1;$[(s i)=*"e";x+:1;x-:1];y-:1]
  i+:1]
 (x;y)}
coords:walk'L
u:=coords; dc:coords@*'u; oc:(#'u)!2
bl:dc@&oc=1                                       / black tiles (flipped odd times)
#bl                                               / part 1
offs:((2;0);(-2;0);(1;1);(-1;1);(1;-1);(-1;-1))
enc:{(500+x 0)+2000*500+x 1}
step:{[bl] nb:,/{[c]{c+x}'offs}'bl
 ky:enc'nb; u:=ky; cnt:#'u; dc:nb@*'u
 isb:(enc'dc)lin enc'bl
 dc@&(isb&(cnt=1)|cnt=2)|(~isb)&cnt=2}
do[100; bl:step bl]
#bl                                               / part 2: 100 days of hex life
\\
