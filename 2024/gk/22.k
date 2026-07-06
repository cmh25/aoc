/ AoC 2024 day 22: monkey market
L:0:"../22.in"
v:0j$'L
st:{x:(x xor x*64j)!16777216j; x:x xor x div 32j; (x xor x*2048j)!16777216j}
S:2000 st\v                    / 2001 rows: secret per step, all buyers at once
+/*|S                          / part 1: sum of 2000th secrets
P:S!'10j                       / price rows (last digit)
e:9+(1_P)-(-1_P)               / change rows, offset to 0..18
K:(6859*-3_e)+(361*1_-2_e)+(19*2_-1_e)+3_e   / base-19 codes of 4-change windows
acc:{[a;cs;sp] i:*'=cs; @[a;cs i;+;sp i]}/[130321#0j;+K;+3_1_P]  / first hit per code, fold zips buyers
|/acc                          / part 2: best total bananas for one 4-change sequence
\\
