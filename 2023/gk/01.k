/ AoC 2023 day 1: trebuchet?!
L:0:"../01.in"
f:{d:x@&(x>"/")&x<":"; (10*-48+ic *d)+-48+ic *|d}
+/f'L                        / part 1: first and last digit per line
toks:("1";"2";"3";"4";"5";"6";"7";"8";"9";"one";"two";"three";"four";"five";"six";"seven";"eight";"nine")
vals:1+(!9),!9
g:{ps:ss[x]'toks; mn:{$[#x;*x;9999]}'ps; mx:{$[#x;*|x;-1]}'ps; (10*vals@*<mn)+vals@*>mx}
+/g'L                        / part 2: spelled digits too -- min/max ss position over 18 tokens
\\
