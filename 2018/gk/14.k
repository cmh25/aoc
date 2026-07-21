n:*0:"../14.in"
num:0$n
p:-48+ic n                                   / the pattern, as digits
m:#p
S:30000000#0
S[0]:3; S[1]:7
L:2; e1:0; e2:1
gen:{[nd]                                    / extend the scoreboard to nd recipes
  l:L; f:e1; g:e2
  while[l<nd
    a:S f; b:S g
    s:a+b
    if[s>9; @[`S;l;:;1]; l+:1]
    @[`S;l;:;s!10]
    l+:1
    f:(f+1+a)!l
    g:(g+1+b)!l]
  L::l; e1::f; e2::g}
gen num+10
"0123456789"@S@num+!10
fnd:{[lo;hi] q:1+(hi-lo)-m; lo+&&/{S[lo+x+!q]=p x}'!m}
lo:0
w:()
while[~#w; gen L+2000000; w:fnd[lo;L]; lo:L-m]
*w
\\
