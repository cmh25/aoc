sa:0$*|" "_(0:"../15.in")0                       / generator A start
sb:0$*|" "_(0:"../15.in")1
M:2147483647j
B:1000000
PA:1_(B){(x*16807j)!M}\1j                        / jump-ahead powers, block of B
PB:1_(B){(x*48271j)!M}\1j
a:0j+sa; b:0j+sb
cnt:0
do[40; ba:(a*PA)!M; bb:(b*PB)!M; cnt+:+/(ba!65536)=bb!65536; a:*|ba; b:*|bb]
cnt                                              / part 1: 40M pairs, low-16 matches
need:5000000
CA:()
a:0j+sa
while[(#CA)<need; ba:(a*PA)!M; a:*|ba; CA,:ba@&0=ba!4]
CB:()
b:0j+sb
while[(#CB)<need; bb:(b*PB)!M; b:*|bb; CB,:bb@&0=bb!8]
+/((need#CA)!65536)=(need#CB)!65536              / part 2: 5M picky pairs
\\
