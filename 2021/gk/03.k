/ AoC 2021 day 3: binary diagnostic
m:"1"='0:"../03.in"
g:~(2*+/m)<#m                / most common bit per column (ties -> 1)
(2 sv g)*2 sv ~g             / part 1: gamma * epsilon
f:{[m;o] i:0; while[1<#m; b:m[;i]; k:$[o;~(2*+/b)<#m;(2*+/b)<#m]; m:m@&b=k; i:i+1]; 2 sv *m}
f[m;1]*f[m;0]                / part 2: oxygen * co2
\\
