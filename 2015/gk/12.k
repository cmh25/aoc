S:*0:"../12.in"
m:S lin "-0123456789"
p:" "_@[S;&~m;:;" "]
p:p@&0<#'p
_+/0.0$p

/ part 2: recursive parse, each parser returns (sum;nextpos;isred)
pv:{[i] c:S i
  $[c="{"; pobj i; c="["; parr i; c="\""; pstr i; pnum i]}
pstr:{[i] j:i+1; while[~"\""=S j; j:j+1]; (0;j+1;"red"~S i+1+!(j-i)-1)}
pnum:{[i] j:i; if["-"=S j; j:j+1]; while[(S j) in "0123456789"; j:j+1]
  t:(),S i+!j-i; neg:"-"=*t; ((1-2*neg)*10 sv -48+ic neg _ t;j;0)}
parr:{[i] j:i+1; s:0
  while[~"]"=S j; if[","=S j; j:j+1]; r:pv j; s:s+r 0; j:r 1]
  (s;j+1;0)}
pobj:{[i] j:i+1; s:0; red:0
  while[~"}"=S j
    if[","=S j; j:j+1]
    k:pstr j; j:1+k 1
    r:pv j; s:s+r 0; red:red|r 2; j:r 1]
  ($[red;0;s];j+1;0)}
r:pv 0
r 0
\\
