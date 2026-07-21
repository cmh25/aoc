L:0:"../02.in"
c:{#'=x}'L                     / letter counts per id
(+/{2 in x}'c)*+/{3 in x}'c
n:#L
M:{+/'~x=/L}'L                 / pairwise mismatch counts
p:*&,/1=M                      / flat index of the differ-by-one pair
a:L p div n
b:L p!n
a@&a=b
\\
