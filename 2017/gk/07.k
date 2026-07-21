L:0:"../07.in"
nm:{*" "_x}'L                                   / program name
w:{0$x@&x lin "0123456789"}'L                   / weight
ch:{p:ss[x;"-> "]; $[#p; ","_ssr[(3+*p)_x;", ";","]; ()]}'L   / child names
cx:{nm?/x}'ch                                    / children as indices
root:*&~nm lin ,/ch
nm root                                          / part 1: the root program
tot:{w[x]++/tot'cx x}                            / recursive subtree weight
i:root
target:0
ans:0
while[~ans                                        / descend into the odd-weighted subtree
  ts:tot'cx i
  u:?ts
  if[1=#u; ans:target-+/ts]                      / children balanced -> node i's weight is wrong
  if[~1=#u
    cn:{+/ts=x}'u
    odd:u@*&cn=1
    target:u@*&cn=|/cn                            / the correct sibling total
    i:(cx i)@*&ts=odd]]
ans                                              / part 2: corrected weight
\\
