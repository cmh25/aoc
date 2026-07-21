/ AoC 2020 day 21: allergen assessment
L:0:"../21.in"
prs:{[s] p:"("_s
 ings:`$'{x@&0<#'x}" "_p 0
 alls:`$'{x@&0<#'x}" "_ssr[9_ -1_p 1;",";" "]
 (ings;alls)}
F:prs'L
allg:?,/{x 1}'F
cand:{[a] ig:{x 0}'F@&{a in x 1}'F; {x@&x lin y}/ig}    / candidate ings per allergen
poss:?,/cand'allg                                / any ingredient that could be allergenic
+/~(,/{x 0}'F)lin poss                            / part 1: safe-ingredient occurrences
cm:cand'allg                                     / candidate set per allergen
asg:(#allg)#`
while[|/asg=`; j:*&1=#'cm; ing:*cm j; asg[j]:ing; cm:{x@&~x=ing}'cm]
{x,",",y}/$'asg@<allg                             / part 2: dangerous list, sorted by allergen
\\
