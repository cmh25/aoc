id:*0:"../05.in"

/ one scan feeds both parts: pw = 6th chars in order; pw2 = position/value fill
pw:()
pw2:8#" "
n:0
i:0
while[(8>#pw)|n<8;
  h:md5 id,$i
  if["00000"~5#h;
    if[8>#pw; pw:pw,h 5]
    p:h 5
    if[p in "01234567";
      d:0$,p
      if[" "=pw2 d; pw2[d]:h 6; n:n+1]]]
  i:i+1]
pw
pw2
\\
