L:0:"../13.in"
W:|/#'L
F:,/{x,(W-#x)#" "}'L                        / flat padded track
ix:&F lin "<>^v"
CX:ix!W; CY:ix div W
CD:"^>v<"?/F ix                             / 0 up 1 right 2 down 3 left
F:@[F;ix;:;"|-|-"@CD]                       / erase the carts from the track
CT:(#CX)#0                                  / intersection turn counter
AL:(#CX)#1
dx:0 1 0 -1
dy:-1 0 1 0
c1:()
mv:{[i] if[~AL i; :0]
  CX[i]::CX[i]+dx@CD i
  CY[i]::CY[i]+dy@CD i
  h:&AL&(CX=CX i)&CY=CY i
  if[1<#h; AL[h]::0; if[~#c1; c1::(CX i),CY i]; :0]
  t:ic F[CX[i]+W*CY i]
  if[t=47; CD[i]::1 0 3 2@CD i]             / '/'
  if[t=92; CD[i]::3 2 1 0@CD i]             / backslash
  if[t=43; CD[i]::((CD i)+3 0 1@CT i)!4; CT[i]::(1+CT i)!3]}
while[1<+/AL
  o:&AL
  o:o@<(W*CY o)+CX o                        / carts move in reading order
  mv'o]
($c1 0),",",$c1 1
i:*&AL
($CX i),",",$CY i
\\
