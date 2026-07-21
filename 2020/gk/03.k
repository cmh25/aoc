/ AoC 2020 day 3: toboggan trajectory
g:0:"../03.in"
w:#*g; h:#g
cnt:{[r;d] +/{g[x*d][(x*r)!w]="#"}'!1+_(h-1)%d}   / trees on slope right r, down d
cnt[3;1]                                           / part 1
*/{cnt[x;y]}.'(1 1;3 1;5 1;7 1;1 2)                / part 2: product over slopes
\\
