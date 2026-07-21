init:-48+ic*0:"../16.in"                / initial state as 0/1 vector

fill:{[disk]
  a:init
  while[(#a)<disk; a:a,0,|~a]           / dragon: a, 0, reverse(complement)
  disk#a}

csum:{[d]
  cs:d
  while[0=(#cs)!2; h:(#cs)div 2; cs:(cs@2*!h)=cs@1+2*!h]
  "01"@cs}

csum fill 272                           / part 1
csum fill 35651584                      / part 2
\\
