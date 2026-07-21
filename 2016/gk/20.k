R:{0j$'"-"_x}'0:"../20.in"
R:R@<{x 0}'R                            / sort by range start
TOT:4294967296j                         / 2^32 addresses

nxt:0j; allowed:0j; part1:-1
i:0
while[i<#R;
  s:R[i;0]; e:R[i;1]
  if[s>nxt; if[part1<0; part1:nxt]; allowed+:s-nxt]
  if[(e+1)>nxt; nxt:e+1]
  i:i+1]
if[nxt<TOT; allowed+:TOT-nxt; if[part1<0; part1:nxt]]
part1                                    / part 1: lowest unblocked
allowed                                  / part 2: count allowed
\\
