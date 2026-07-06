/ AoC 2023 day 11: cosmic expansion
G:0:"../11.in"
W:#*G
g:&"#"=,/G                               / flat galaxy positions
/ pairwise distance sum per axis: sort coords, expand past empty lines, sum s*(2i-n+1)
ax:{[v;e] o:v@<v; c:+\~(!1+*|o)lin o; s:o+e*c o; +/s*(2j*!#s)-(#s)-1}
+/ax[;1]'(g div W;g!W)                   / part 1: empty rows/cols count double
+/ax[;999999j]'(g div W;g!W)             / part 2: a million times
\\
