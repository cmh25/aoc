/ AoC 2025 day 10: P1 min subset with XOR = target (parity is all that matters).
/ P2: min presses with A.n = target, n>=0 (ILP): parity halving n = s+2m --
/ subset s must match t mod 2, recurse on (t-A.s)div 2, memo keyed on t vector.
L:0:"../10.in"
f:{tk:" "_x; li:"#"=1_-1_*tk; tg:+/li*_2^!#li; ms:{+/_2^0$","_1_-1_x}'1_-1_tk; st:{[s;mk;z] (s[0],s[0] xor mk; s[1],1+s 1)}/[(,0;,0);ms;nul]; &/st[1]@&st[0]=tg}
+/f'L                          / part 1
rec:{[t] $[&/t=0; 0j; ~(#MK)>i:MK?t; recc t; MV i]}
recc:{[t] pt:+/(t!2)*PW; js:&pv=pt; best:1000000000j; c:0
 while[c<#js; j:js c; v:V j; if[&/~v>t; best:best&(PC j)+2j*rec(t-v)div 2]; c:c+1]
 MK::MK,,t; MV::MV,best; best}
solve:{[ln] tk:" "_ln; tg:0$","_1_-1_tk(#tk)-1; KC::#tg
 cvs:{@[KC#0;0$","_1_-1_x;:;1]}'1_-1_tk
 PW::_2^!KC
 V::,KC#0; PC::,0j; bi:0
 while[bi<#cvs; V::V,V+\cvs bi; PC::PC,PC+1j; bi:bi+1]
 pv::{+/PW*x!2}'V
 MK::(); MV::(); rec tg}
+/solve'L                      / part 2
\\
