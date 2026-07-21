T:{" "_ssr[ssr[x;":";""];",";""]}'0:"../16.in"
K:("children";"cats";"samoyeds";"pomeranians";"akitas";"vizslas";"goldfish";"trees";"cars";"perfumes")
V:3 7 2 3 0 0 5 3 2 1
m1:{[t] &/(0$t 3 5 7)=V K?/t 2 4 6}
1+*&m1'T
cmp:{[k;v;r] $[(k=1)|k=7; v>r; (k=3)|k=6; v<r; v=r]}
m2:{[t] i:K?/t 2 4 6; &/cmp'[i;0$t 3 5 7;V i]}
1+*&m2'T
\\
