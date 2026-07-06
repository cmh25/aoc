/ AoC 2024 day 24: crossed wires
L:0:"../24.in"
b:(#'L)?0
I:b#L; G:(b+1)_L                   / initial wire values, gate list
gsp:" "_'G
n1:*'gsp; op:gsp@'1; n2:gsp@'2; no:gsp@'4
opc:{("AND";"OR";"XOR")?x}'op      / 0 1 2
nm:?(3#'I),n1,n2,no                / wire name -> id
i1:nm?/n1; i2:nm?/n2; oo:nm?/no
vlu:(#nm)#-1
vlu[nm?/3#'I]:-48+ic I@'5
/ settle: each round computes every gate whose inputs are known
ev:{[og] v:vlu; d:(#G)#0
 while[|/~d; r:&(~d)&(v[i1]>-1)&v[i2]>-1; a:v i1 r; c:v i2 r; k:opc r
  v[og r]:((k=0)*a&c)+((k=1)*a|c)+(k=2)*~a=c; d[r]:1]
 v}
zid:&"z"=*'nm
+/((ev oo) zid@<nm zid)*1j,*\45#2j
/ part 2: 4 swapped output pairs of a ripple-carry adder; a gate output is wrong
/ if: non-final z not from XOR; internal XOR not fed by x,y; AND (not the 00
/ half-adder) feeding a non-OR; sum-XOR of x,y (not 00) feeding an OR
pz:"z"=*'no; pxy:(("x"=*'n1)&"y"=*'n2)|("y"=*'n1)&"x"=*'n2
d00:"00"~/1_'n1
fOr:{|/((i1=x)|i2=x)&opc=1}'oo     / output feeds an OR gate
fNo:{|/((i1=x)|i2=x)&~opc=1}'oo    / output feeds a non-OR gate
bad:?no@&((pz&~"z45"~/no)&~opc=2)|(((opc=2)&~pz)&~pxy)|(((opc=0)&~pxy&d00)&fNo)|((opc=2)&pxy&~d00)&fOr
1_,/",",'bad@<bad
\\
