/ AoC 2022 day 24: blizzard basin
L:0:"../24.in"
I:1_-1_1_'-1_'L            / interior
hh:#I; ww:#*I
B1:I=">"; B2:I="<"; B3:+I="v"; B4:+I="^"
blz:{[t] tw:t!ww; th:t!hh; ((0-tw)!'B1)|(tw!'B2)|(+(0-th)!'B3)|+th!'B4}
zw:ww#0
sd:{(,zw),-1_x}; su:{(1_x),,zw}
sr:{0,'-1_'x}; sl:{(1_'x),'0}
trip:{[t0;rev] F:(hh,ww)#0; t:t0; done:0
 while[~done
  t:t+1
  F:F|(sd F)|(su F)|(sr F)|sl F
  $[rev; F[hh-1;ww-1]:1; F[0;0]:1]     / can always step in from the doorway
  F:F&~blz t
  done:$[rev; F[0;0]; F[hh-1;ww-1]]]   / cell next to the exit reached
 t+1}
a:trip[0;0]
a                            / part 1: start -> goal
c:trip[trip[a;1];0]
c                            / part 2: there, back for snacks, there again
\\
