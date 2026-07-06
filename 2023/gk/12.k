/ AoC 2023 day 12: hot springs
a:" "_'0:"../12.in"
ps:*'a
gs:0$'","_'a@'1
/ arrangement count: DP vectorized over positions, folded over groups
/ f[i] = ways to fill first i chars of ".",s placing the groups so far, position i free
/ per group: pl = run fits ending at i (window all non-dot, separator non-hash),
/ then f[i] = f[i-1]*nh[i-1] + pl[i]*fprev[i-L-1] as a reset-segmented cumsum
row:{[s;gs]
 s2:".",s; n2:#s2; nh:~"#"=s2; nb:~"."=s2; c0:0,+\nb; lr:|\(!1+n2)*~0,nh
 f:{[fp;L;z] pl:((L#0),((L_c0)-(-L)_c0)=L)*((L+1)#0),(n2-L)#nh; p:pl*((L+1)#0j),(-(L+1))_fp; cp:+\p; (cp-cp lr)+p lr}/[1j*1,&\nh;gs;nul]
 *|f}
+/row'[ps;gs]                            / part 1
pu:{1_,/"?",'5#,x}'ps
gu:{,/5#,x}'gs
+/row'[pu;gu]                            / part 2: unfold 5x with ? joints
\\
