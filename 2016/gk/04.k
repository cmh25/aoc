L:0:"../04.in"
az:"abcdefghijklmnopqrstuvwxyz"

parse:{[line]
  h:"["_line
  cs:-1_h 1                        / checksum (drop trailing ])
  left:h 0
  parts:"-"_left
  sec:0$*|parts
  letters:,/-1_parts               / all name words, dashes removed
  (letters;sec;cs)}

P:parse'L
real:{[p]
  cnt:+/'az=\p 0                    / count of each a-z letter
  top:az@5#>cnt                     / 5 most common, ties alphabetical
  top~p 2}

reals:real'P
+/{x 1}'P@&reals                    / part 1: sum of real sector ids

/ part 2: decrypt real rooms, find the one about north pole objects
dec:{[p] s:p 1; az@(s+ic[p 0]-97)!26}
i:0; ans:0
while[i<#P;
  if[reals i; if[#ss[dec P i;"north"]; ans:(P i)1]]
  i:i+1]
ans
\\
