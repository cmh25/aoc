/ AoC 2020 day 14: docking data  (& and | are min/max, so work on bit vectors)
L:0:"../14.in"
ismask:{"mask"~4#x}
pw:|1j,*\35#2j                                  / 2^35..2^0 as longs (msb first)
dec:{+/pw*x}                                    / bit vector -> long (2 sv overflows i32)
/ part 1: mask forces value bits
A:(); V:(); mask:36#"X"; i:0
while[i<#L; ln:L i
 if[ismask ln; mask:7_ln]
 if[~ismask ln
  t:" "_ln; a:0j$4_-1_t 0; v:0j$t 2
  A:A,a; V:V,dec(mask="1")|(mask="X")&(36#2)vs v]
 i:i+1]
+/{*|V x}'=A                                    / part 1: last write wins per address
/ part 2: mask makes address bits float
A:(); V:(); mask:36#"X"; i:0
while[i<#L; ln:L i
 if[ismask ln; mask:7_ln]
 if[~ismask ln
  t:" "_ln; a:0j$4_-1_t 0; v:0j$t 2
  base:(mask="1")|(mask="0")&(36#2)vs a          / '0' keeps addr bit, '1' forces 1
  xp:&mask="X"; nx:#xp
  al:{[base;xp;nx;c] dec @[base;xp;:;(nx#2)vs c]}[base;xp;nx]'!*/nx#2
  A:A,al; V:V,(#al)#v]
 i:i+1]
+/{*|V x}'=A                                    / part 2: floating-address writes
\\
