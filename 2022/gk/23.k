/ AoC 2022 day 23: unstable diffusion
L:0:"../23.in"
E:,/{(2000+&"#"=L x)+5000*x+2000}'!#L   / elves as x+5000y
MD:-5001 -5000 -4999 -1 1 4999 5000 5001         / NW N NE W E SW S SE
DD:-5000 5000 -1 1                               / proposal deltas N S W E
rnd:{[r] mm:(8,#E)#(,/MD+\E) lin E
 anyn:|/mm
 EL:(~mm[0]|mm[1]|mm 2; ~mm[5]|mm[6]|mm 7; ~mm[0]|mm[3]|mm 5; ~mm[2]|mm[4]|mm 7)
 pri:(r+!4)!4
 f0:EL pri 0; f1:EL pri 1; f2:EL pri 2; f3:EL pri 3
 t0:f0; t1:f1&~f0; t2:f2&~f0|f1; t3:f3&~f0|f1|f2
 delta:anyn*(t0*DD pri 0)+(t1*DD pri 1)+(t2*DD pri 2)+t3*DD pri 3
 tg:E+delta
 g:=tg; cv:@[(#tg)#0;,/g;:;,/(#'g)#'#'g]
 mv:(~delta=0)&cv=1
 w:&mv
 E::@[E;w;:;tg w]
 +/mv}
r:0; mvd:1; P1:0
while[mvd>0
 mvd:rnd r; r:r+1
 if[r=10; xs:E!5000; ys:E div 5000; P1:((1+(|/xs)-&/xs)*1+(|/ys)-&/ys)-#E]]
P1                           / part 1: empty cells in bbox after 10 rounds
r                            / part 2: first round with no movement
\\
