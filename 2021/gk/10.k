/ AoC 2021 day 10: syntax scoring
L:0:"../10.in"
st:{[s;c;u] $[0<#s 1;s;c lin "([{<";(s[0],c;"");c=")]}>"@"([{<"?*|s 0;(-1_s 0;"");(s 0;,c)]}
rs:{st/[("";"");x;nul]}'L
+/3 57 1197 25137@")]}>"?/,/rs@'1          / part 1: first illegal char scores
ok:&0=#'rs@'1
sc:{{[a;c;u](5j*a)+c}/[0j;1+"([{<"?/|x;nul]}'rs[ok]@'0
s:sc@<sc
s@(#s)div 2                                / part 2: middle completion score
\\
