/ AoC 2020 day 16: ticket translation
L:0:"../16.in"
gid:+\0=#'L
rl:L@&(gid=0)&0<#'L                            / rule lines
yourL:L@&(gid=1)&0<#'L
nearL:L@&(gid=2)&0<#'L
names:{*":"_x}'rl
rng:{p:":"_x; q:ssr[ssr[p 1;"-";" "];" or ";" "]; t:" "_q; 0$'t@&0<#'t}'rl   / (a b c d)
your:0j$'","_yourL 1
near:{0j$'","_x}'1_nearL
ok1:{[r;x] ((~x<r 0)&~x>r 1)|(~x<r 2)&~x>r 3}   / value x valid for rule r
anyok:{|/{ok1[x;y]}[;x]'rng}                     / valid for any rule
av:,/near
+/av@&~anyok'av                                 / part 1: scanning error rate
/ part 2: keep valid tickets, solve field->position
vt:near@&{&/anyok'x}'near
col:+vt                                          / columns: col[j] = values at position j
cand:{[c] &{&/ok1[x;c]}'rng}'col                 / rule indices valid for each column
asg:(#col)#-1
while[|/asg<0; j:*&1=#'cand; r:*cand j; asg[j]:r; cand:{x@&~x=r}'cand]
dep:&{"departure"~9#x}'names
*/your@&asg lin dep                              / part 2: product of departure fields
\\
