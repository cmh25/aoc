/ AoC 2021 day 25: sea cucumbers
g:0:"../25.in"
h:#g; w:#*g
i:0; c:1
while[c
 mv:(g=">")&"."=1!'g
 idx:&,/mv; ti:(w*idx div w)+(idx+1)!w
 g:(h,w)#@[@[,/g;idx;:;"."];ti;:;">"]
 c:#idx
 mv:(g="v")&"."=1!g
 idx:&,/mv; ti:(idx+w)!h*w
 g:(h,w)#@[@[,/g;idx;:;"."];ti;:;"v"]
 c:0<c+#idx
 i:i+1]
i                            / first step with no movement (day 25 has one part)
\\
