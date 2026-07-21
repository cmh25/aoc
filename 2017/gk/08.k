T:{" "_x}'0:"../08.in"
regs:?,/{(x 0;x 4)}'T                           / all register names
V::(#regs)#0
cmp:{[a;op;b] c:*op; tw:1<#op                   / tokens are 1-char strings, so test *op (a char)
  $[c="<"; $[tw;~a>b; a<b]; c=">"; $[tw;~a<b; a>b]; c="="; a=b; ~a=b]}
mx:0
{[t] if[cmp[V regs?t 4; t 5; . t 6]
    d:$[(t 1)~"inc"; . t 2; -. t 2]
    r:regs?t 0
    @[`V;r;+;d]
    mx::mx|V r]}'T;
|/V                                             / part 1: largest at end
mx                                              / part 2: largest ever
\\
