/ AoC 2021 day 15: chiton (value-iteration shortest path)
m:-48+ic'0:"../15.in"
INF:999999
lo:{[B] h:#B; wd:#*B
 rx:{n:x&B+&/(((,wd#INF),-1_x);((1_x),,wd#INF);INF,'-1_'x;(1_'x),'INF); .[n;0 0;:;0]}
 d:rx/.[(h,wd)#INF;0 0;:;0]
 d[h-1;wd-1]}
lo m                         / part 1
rowr:{[r] {x,'y}/({1+(m+r+x-1)!'9}'!5)}
lo@,/rowr'!5                 / part 2: 5x5 tiled map
\\
