step:0$*0:"../17.in"
/ part 1: simulate 2017 inserts, report the value after 2017
buf:,0
pos:0
v:1
while[v<2018; pos:((pos+step)!v)+1; buf:(pos#buf),v,pos_buf; v+:1]
buf@(1+buf?2017)!#buf                             / value after 2017
/ part 2: 50M inserts; value 0 stays at index 0, track whatever lands at index 1
pos:0
ans:0
v:1
while[v<50000001; pos:((pos+step)!v)+1; if[pos=1; ans:v]; v+:1]
ans
\\
