/ AoC 2021 day 11: dumbo octopus
m:-48+ic'0:"../11.in"
zr:12#0
nc:{p:(,zr),(0,'x,'0),,zr; +/{p[x[0]+!10;x[1]+!10]}'(0 0;0 1;0 2;1 0;1 2;2 0;2 1;2 2)}
i:0; T:0; P1:0; sync:0
while[(i<100)|sync=0
 g:m+1; f:(10,10)#0
 while[|/,/nf:(g>9)&~f; f:f|nf; g:g+nc nf]
 m:g*~f; i:i+1; fc:+/,/f; T:T+fc
 if[i=100;P1:T]
 if[(sync=0)&fc=100;sync:i]]
P1                           / part 1: flashes in 100 steps
sync                         / part 2: first synchronized step
\\
