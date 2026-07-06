/ AoC 2024 day 20: race condition
G:0:"../20.in"
h:#G
w:#*G
F:,/G                          / flat grid
open:~"#"=F
D:(h*w)#-1                     / dist along the single racetrack
cur:F?"S"
iE:F?"E"
D[cur]:0
d4:(1;-1;w;-w)
k:0
while[~cur=iE; c:cur+d4; c:c@&(open c)&-1=D c; k:k+1; D[*c]:k; cur:*c]
Dm:(h;w)#D
os:,/{x,'(-(20-abs x))+!1+2*20-abs x}'-20+!41   / all offsets, manhattan<=20
t:+os
os:os@&((abs t 0)<h)&(abs t 1)<w
md:+/'abs os
/ cheat A->B saves D[B]-D[A]-manhattan; count savings >= t over the shifted grids
f:{[o;t] dr:o 0; dc:o 1; m:(abs dr)+abs dc; rA:(0|-dr)+!0|h-abs dr; cA:(0|-dc)+!0|w-abs dc; A:Dm[rA;cA]; B:Dm[rA+dr;cA+dc]; +/,/(A>-1)&(B>-1)&((B-A)-m)>t-1}
+/f[;100]'os@&2=md             / part 1: 2-picosecond cheats
+/f[;100]'os@&1<md             / part 2: cheats up to 20 picoseconds
\\
