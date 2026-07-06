/ AoC 2024 day 19: linen layout
L:0:"../19.in"
pats:","_ssr[L 0;", ";","]            / available towel patterns
ds:2_L                                / desired designs
lens:?#'pats
PT:{[l] pats@&l=#'pats}'!1+|/lens     / patterns grouped by length
ways:{[s] m:#s; w:@[(1+m)#0j;0;:;1j]  / w i = ways to build first i stripes
 i:1; while[~i>m; w[i]:+/{[l] $[l>i;0j;w[i-l]*~(#PT l)=(PT l)?s@(i-l)+!l]}'lens; i:i+1]; *|w}
wv:ways'ds
+/0j<wv                               / part 1: designs possible at all
+/wv                                  / part 2: total distinct ways over all designs
\\
