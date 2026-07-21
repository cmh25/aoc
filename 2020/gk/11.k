/ AoC 2020 day 11: seating system
g:0:"../11.in"
r:#g; c:#*g
seat:~g="."                                    / seat mask (matrix)
z:(c+2)#0
dl:(0 0;0 1;0 2;1 0;1 2;2 0;2 1;2 2)
adj:{[o] p:(,z),(0,'o,'0),,z; +/{p[(x 0)+!r;(x 1)+!c]}'dl}
step1:{[o] nb:adj o; seat&(o&~nb>3)|(~o)&nb=0}
+/,/step1/(r,c)#0                               / part 1: threshold 4, adjacent

/ part 2: line of sight, threshold 5 -- precompute visible seats per cell
dirs:(-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1)
fs:{[i;j;dr;dc] i:i+dr;j:j+dc;res:-1
 while[(i>-1)&(i<r)&(j>-1)&(j<c)&res=-1
  if[~g[i][j]=".";res:(i*c)+j]; i:i+dr;j:j+dc]
 res}
nb:{[p] i:p div c;j:p!c;$[g[i][j]=".";!0;{x@&x>-1}({fs[i;j;x 0;x 1]}'dirs)]}
vis:nb'!r*c
seatf:,/seat
step2:{[o] n:{+/o x}'vis; seatf&(o&~n>4)|(~o)&n=0}
+/step2/(r*c)#0                                 / part 2
\\
