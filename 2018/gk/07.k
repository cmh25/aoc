L:0:"../07.in"
A:ic L[;5]                       / prerequisite step
B:ic L[;36]                      / dependent step
u:?A,B
S:u@<u                           / all steps, alphabetical
rdy:{[r;dn] r@&{~|/~(A@&B=x) lin dn}'r}
rem:S
done:()
while[#rem; c:*rdy[rem;done]; done,:c; rem:rem@&~rem=c]
ci done
n:#S
rem:S; done:(); busy:(); ft:(); t:0
while[n>#done
  i:&ft=t
  if[#i; done,:busy i; busy:busy di i; ft:ft di i]
  av:rdy[rem;done]
  k:(5-#busy)&#av
  if[k; c:k#av; busy,:c; ft,:t+c-4; rem:rem@&~rem lin c]
  if[n>#done; t+:1]]
t
\\
