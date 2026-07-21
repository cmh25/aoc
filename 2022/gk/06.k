/ AoC 2022 day 6: tuning trouble
s:*0:"../06.in"
f:{[k] k+*&{k=#?s x+!k}'!1+(#s)-k}
f 4                          / part 1: start-of-packet marker
f 14                         / part 2: start-of-message marker
\\
