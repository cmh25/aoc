/ AoC 2020 day 4: passport processing
L:0:"../04.in"
g:+\0=#'L; i:&~0=#'L                        / group id per line; nonblank lines
recs:{,/" "_'L x}'(i)@=g@i                   / per passport: list of key:value tokens
req:`byr`iyr`eyr`hgt`hcl`ecl`pid
hex:"0123456789abcdef"; dig:"0123456789"
vchk:{[ks;vv] gv:{[k] vv@ks?k}
 hg:gv`hgt; hu:-2#hg; hn:0$-2_hg; hc:gv`hcl; pd:gv`pid
 by:0$gv`byr; iy:0$gv`iyr; ey:0$gv`eyr
 okh:$[hu~"cm";(hn>149)&hn<194;hu~"in";(hn>58)&hn<77;0]
 okc:(hc[0]="#")&(6=#1_hc)&&/(1_hc)lin hex
 oke:(`$gv`ecl)lin`amb`blu`brn`gry`grn`hzl`oth
 okp:(9=#pd)&&/pd lin dig
 (by>1919)&(by<2003)&(iy>2009)&(iy<2021)&(ey>2019)&(ey<2031)&okh&okc&oke&okp}
chk:{[rec] ks:`$'*'":"_'rec; vv:{*|":"_x}'rec
 pres:&/req lin ks
 (pres;$[pres;vchk[ks;vv];0])}
r:chk'recs
+/*'r                                         / part 1: all required present
+/{x[1]}'r                                    / part 2: present and valid
\\
