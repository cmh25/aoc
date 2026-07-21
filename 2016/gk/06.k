M:0:"../06.in"
cols:+M
mc:{[c] (?c)@*>{#x}'=c}         / most common char in column
lc:{[c] (?c)@*<{#x}'=c}         / least common char
mc'cols                         / part 1
lc'cols                         / part 2
\\
