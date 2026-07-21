/ AoC 2022 day 3: rucksack reorganization
L:0:"../03.in"
p:{v:ic x; +/(v-38)-58*v>96}    / summed priority: a-z 1-26, A-Z 27-52
c:{h:_(#x)%2; *(h#x)@&(h#x)lin h_x}'L
p c                           / part 1: item in both halves
g:(((#L)div 3),3)#L
b:{a:*x; *a@&(a lin x 1)&a lin x 2}'g
p b                           / part 2: badge common to each trio
\\
