/ AoC 2020 day 7: handy haversacks
L:0:"../07.in"
prs:{[s] w:" "_ssr[ssr[s;".";""];",";""]
 col:`$w[0],w[1]; rest:4_w; ck:(#rest)div 4
 $[rest[0]~"no";(col;!0;0#`);(col;0$'rest 4*!ck;`$'{rest[1+4*x],rest[2+4*x]}'!ck)]}
P:prs'L
d:.(); {d[x 0]:1_x}'P                        / color -> (counts;inner colors)
gold:`$"shinygold"
cols:*'P; T:,gold; w:0
while[~w; a:cols@&{|/d[x][1]lin T}'cols; nT:?T,a; w:(#nT)=#T; T:nT]
(#T)-1                                        / part 1: colors reaching shiny gold
bags:{r:d x; +/r[0]*1+bags'r[1]}
bags gold                                     / part 2: bags inside shiny gold
\\
