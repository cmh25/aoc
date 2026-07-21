/ AoC 2022 day 25: full of hot air
L:0:"../25.in"
vl:{{[a;c;u](5j*a)+c}/[0j;-2+"=-012"?/x;nul]}
t:+/vl'L
s:""
while[t>0; r:t!5; s:("012=-" r),s; t:(t+0 0 0 2 1@r)div 5]
s                            / the SNAFU sum (only part on day 25)
\\
