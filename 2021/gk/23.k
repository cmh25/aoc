/ AoC 2021 day 23: amphipod (memoized min-cost search)
L:0:"../23.in"
top:L[2]@3 5 7 9; bot:L[3]@3 5 7 9
hx:0 1 3 5 7 9 10            / usable hall slots
rx:2 4 6 8
CST:1 10 100 1000j
BTW:{[i] {(!7)@&(hx>hx[x]&rx y)&hx<hx[x]|rx y}[i]'!4}'!7   / hall slots strictly between
DST:{abs(hx x)-rx}'!7
BIG:100000000000j
mc:{[s]
 if[s~GOAL; :0j]
 ky:`$@[s;&s=".";:;"e"]; v:MEMO ky; if[~v~nul; :v]   / dict keys must be plain names: '.' -> 'e'
 hm:-1; i:0
 while[(i<7)&hm<0
  c:s i
  if[~c="."
   r:"ABCD"?c; cells:s 7+(r*DP)+!DP
   if[(&/cells lin ".",c)&0=+/~"."=s BTW[i;r]; hm:i; hr:r; hd:(+/cells=".")-1]]
  i:i+1]
 if[hm>-1
  ns:s; c:s hm; ns[hm]:"."; ns[7+(hr*DP)+hd]:c
  v:((CST"ABCD"?c)*0j+DST[hm;hr]+hd+1)+mc ns
  MEMO[ky]::v; :v]
 best:BIG; r:0
 while[r<4
  cells:s 7+(r*DP)+!DP
  if[0<+/~cells lin ".","ABCD"r
   d:+/cells="."; c:s 7+(r*DP)+d
   k:0
   while[k<7
    if[("."=s k)&0=+/~"."=s BTW[k;r]
     ns:s; ns[k]:c; ns[7+(r*DP)+d]:"."
     best:best&((CST"ABCD"?c)*0j+DST[k;r]+d+1)+mc ns]
    k:k+1]]
  r:r+1]
 MEMO[ky]::best
 best}
run:{[dp;s0] DP::dp; GOAL::(7#"."),,/{DP#"ABCD"x}'!4; MEMO::.(); mc s0}
run[2;(7#"."),,/+(top;bot)]                       / part 1
run[4;(7#"."),,/+(top;"DCBA";"DBAC";bot)]         / part 2: unfolded diagram
\\
