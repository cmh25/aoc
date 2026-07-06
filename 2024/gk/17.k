/ AoC 2024 day 17: chronospatial computer
L:0:"../17.in"
a0:0j$12_L 0
pg:0$'","_9_L 4
run:{[a] b:0j; c:0j; ip:0; o:!0j
 while[ip<#pg; op:pg ip; li:pg ip+1; cv:$[li<4;0j+li;li=4;a;li=5;b;c]; $[op=0;a:a div */cv#2j;op=1;b:b xor li;op=2;b:cv!8j;op=3;$[a=0j;;ip:li-2];op=4;b:b xor c;op=5;o:o,cv!8j;op=6;b:a div */cv#2j;c:a div */cv#2j]; ip:ip+2]
 o}
`0:,1_,/",",'$'run a0         / part 1: the program's output
/ part 2: lowest A for which the program outputs itself (quine)
/ A is consumed 3 bits per loop: grow candidates a->8a+d, keep those whose run matches the program's tail
pgj:0j+pg
g:{[cs;k;z] c8:,/(8j*cs)+\!8j; c8@&{((-y)#pgj)~run x}[;k]'c8}
&/g/[,0j;1+!#pg;nul]
\\
