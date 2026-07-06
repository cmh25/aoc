/ AoC 2025 day 7: tachyon manifold. P1: split count (boolean beam mask).
/ P2: many-worlds timeline count = same fold carrying long counts.
L:0:"../07.in"
ms:"^"=1_L
step:{[st;s;g] b:st 0; h:b&s; ((b&~s)|((1_h),0)|0,-1_h; (st 1)++/h)}
r:step/[("S"=L 0;0); ms; nul]
r 1
step2:{[c;s;g] h:c*s; (c*~s)+((1_h),0j)+0j,-1_h}
+/step2/[("S"=L 0)*1j; ms; nul]
\\
