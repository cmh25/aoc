/ AoC 2020 day 18: operation order (shunting-yard, precedence as a parameter)
L:0:"../18.in"
tk:{t:ssr[ssr[x;"(";"( "];")";" )"]; s:" "_t; s@&0<#'s}
lp:,"("; rp:,")"; pl:,"+"; ml:,"*"
isop:{(x~pl)|x~ml}
sh:{[toks;pp] out:();op:();i:0
 while[i<#toks; t:toks i
  if[t~lp;op:op,,t]
  if[t~rp;while[~(*|op)~lp;out:out,,*|op;op:-1_op];op:-1_op]
  if[isop t
   pop:1
   while[pop
    if[0=#op;pop:0]
    if[pop;if[(*|op)~lp;pop:0]]
    if[pop;if[pp[*|op]<pp t;pop:0]]
    if[pop;out:out,,*|op;op:-1_op]]
   op:op,,t]
  if[~(t~lp)|(t~rp)|isop t;out:out,,t]
  i:i+1]
 while[0<#op;out:out,,*|op;op:-1_op]
 out}
rpn:{[out] st:();i:0
 while[i<#out; t:out i
  if[isop t;b:*|st;a:*|-1_st;st:(-2_st),$[t~pl;a+b;a*b]]
  if[~isop t;st:st,0j$t]
  i:i+1]
 *st}
ev:{[s;pp] rpn sh[tk s;pp]}
+/{ev[x;{1}]}'L                                  / part 1: + and * equal precedence
+/{ev[x;{$[x~pl;2;1]}]}'L                          / part 2: + binds tighter
\\
