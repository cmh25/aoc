/ AoC 2024 day 1: historian hysteria
m:.'0:"../01.in"
a:m[;0]
b:m[;1]
+/abs(a@<a)-b@<b             / part 1: total distance of rank-paired lists
+/(1j*a)*+/'a=\b             / part 2: similarity = sum a * count-in-b (each-left match matrix)
\\
