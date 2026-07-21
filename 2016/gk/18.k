r0:"^"=*0:"../18.in"                    / 1 = trap
step:{~(0,-1_x)=1_x,0}                  / trap iff left != right

count:{[rows]
  r:r0; safe:+/~r
  do[rows-1; r:step r; safe+:+/~r]
  safe}

count 40                                / part 1
count 400000                            / part 2
\\
