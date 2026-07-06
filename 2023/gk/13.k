/ AoC 2023 day 13: point of incidence
L:0:"../13.in"
B:"#"=L
ps:{x@&0<#'x}'(0,1+&0=#'L)_B
mk:{[m;k] j:k&(#m)-k; +/,/~(j#k _ m)=j#|k#m}   / mismatches across split k
f:{[m;t] n:#m; w:#*m; h:1+&t=mk[m]'1+!n-1; v:1+&t=mk[+m]'1+!w-1; +/(100*h),v}
+/f'[ps;0]                   / part 1: perfect mirror (0 mismatches)
+/f'[ps;1]                   / part 2: smudged mirror (exactly 1 mismatch)
\\
