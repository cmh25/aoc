/ AoC 2023 day 22: sand slabs
L:0:"../22.in"
m:.'(ssr'[L;"~";","])                / x1 y1 z1 x2 y2 z2 per brick (10x10 footprint, ends ordered)
m:m@<m[;2]                           / settle in bottom-z order
n:#m
H:100#0                              / heightmap: current top per cell
O:100#n                              / owner brick of that top (n = ground)
sup:()
drop:{[i] b:m i; cs:,/(b[0]+!1+b[3]-b 0)+\10*b[1]+!1+b[4]-b 1; hh:|/H cs; s:?O cs@&hh=H cs; sup::sup,,s@&s<n; H[cs]::hh+1+b[5]-b 2; O[cs]::i}
drop'!n;
n-#?,/sup@&1=#'sup                   / part 1: all but the sole supporters are safe to disintegrate
falls:{[j] fell:n#0; fell[j]:1; k:j+1; while[k<n; if[$[0=#s:sup k;0;&/fell s];fell[k]:1]; k:k+1]; -1++/fell}
+/falls'!n                           / part 2: chain reaction, one z-ordered pass per removed brick
\\
