/ AoC 2020 day 15: rambunctious recitation (Van Eck)
/ @[`LAST;i;:;v] amends the global array IN PLACE (a[i]:v copies the whole vector)
s:0$","_*0:"../15.in"
play:{[N] LAST::(N+1)#0                          / last[v] = turn v was last spoken
 i:0; while[i<(#s)-1; @[`LAST;s i;:;i+1]; i:i+1]   / seed all but the last start number
 cur:*|s; t:#s
 while[t<N; p:LAST cur; @[`LAST;cur;:;t]; cur:$[p=0;0;t-p]; t:t+1]
 cur}
play 2020                                        / part 1
play 30000000                                    / part 2
\\
