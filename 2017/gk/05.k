J:.'0:"../05.in"
n:#J
run:{[part2]
  A::J
  i:0; c:0
  while[(i>-1)&i<n
    o:A i
    @[`A;i;$[part2&o>2; -; +];1]                / p2: >=3 decrements, else increment
    i+:o
    c+:1]
  c}
run 0
run 1
\\
