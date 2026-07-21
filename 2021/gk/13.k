/ AoC 2021 day 13: transparent origami
L:0:"../13.in"
bl:*&0=#'L
p:0$'","_'bl#L
X:p@'0; Y:p@'1
fds:{(x 11;0$13_x)}'(bl+1)_L
ap:{[s;fd;u] a:fd 1; $[fd[0]="x";(a-abs s[0]-a;s 1);(s 0;a-abs s[1]-a)]}
r1:ap[(X;Y);*fds;nul]
#?r1[0]+10000*r1 1          / part 1: dots after first fold
r:ap/[(X;Y);fds;nul]
w:1+|/r 0
".#"@(1+|/r 1;w)#@[(w*1+|/r 1)#0;r[0]+w*r 1;:;1]   / part 2: read the letters
\\
