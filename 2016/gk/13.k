fav:0$*0:"../13.in"
open:{[x;y] 0=(+/2 vs (x*x)+(3*x)+(2*x*y)+(y*y)+y+fav)!2}
enc:{(x 0)+256*x 1}

nbr:{[p] x:p 0; y:p 1
  c:((x-1;y);(x+1;y);(x;y-1);(x;y+1))
  c:c@&{(~x[0]<0)&~x[1]<0}'c
  c@&{open . x}'c}

start:(1;1); tgt:enc[(31;39)]
visited:,enc start
frontier:,start
dist:0; part1:-1; part2:-1
while[(part1<0)|part2<0;
  nb:?,/nbr'frontier
  ks:enc'nb
  m:~ks lin visited
  nb:nb@&m; ks:ks@&m
  dist:dist+1
  if[(part1<0)&tgt in ks; part1:dist]
  visited:visited,ks
  if[dist=50; part2:#visited]
  frontier:nb]
part1
part2
\\
