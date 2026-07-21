L:0:"../02.in"

solve:{[grid;r;c]
  nr:#grid; nc:#*grid
  code:()
  i:0
  while[i<#L;
    line:L i
    j:0
    while[j<#line;
      m:line j
      pr:r; pc:c
      $[m="U";r:r-1;m="D";r:r+1;m="L";c:c-1;c:c+1]
      ib:(~r<0)&(r<nr)&(~c<0)&c<nc
      if[ib; if[" "=grid[r;c]; ib:0]]
      if[~ib; r:pr; c:pc]
      j:j+1]
    code:code,grid[r;c]
    i:i+1]
  code}

/ part 1: 3x3 pad, start at 5 = (1,1)
p1:("123";"456";"789")
solve[p1;1;1]

/ part 2: diamond, start at 5 = (2,0)
p2:("  1  ";" 234 ";"56789";" ABC ";"  D  ")
solve[p2;2;0]
\\
