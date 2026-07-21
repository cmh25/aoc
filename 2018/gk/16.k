L:0:"../16.in"
cl:{.@[x;&~x lin "0123456789";:;" "]}
ns:+/{$[#x;"B"=*x;0]}'L                       / number of Before/After samples
S:{(cl L[4*x];cl L[1+4*x];cl L[2+4*x])}'!ns
op:{[o;r;a;b]
  u:$[a<4; r a; -9999999]
  v:$[b<4; r b; -9999999]
  $[o=0;u+v; o=1;u+b; o=2;u*v; o=3;u*b
    o=4;u and v; o=5;u and b; o=6;u or v; o=7;u or b
    o=8;u; o=9;a
    o=10;a>v; o=11;u>b; o=12;u>v
    o=13;a=v; o=14;u=b; u=v]}
ok:{[s;o] i:s 1; (op[o;s 0;i 1;i 2])=(s 2)@i 3}   / does opcode o explain sample s?
M:{[s] {ok[s;x]}'!16}'S
+/2<+/'M
P:16 16#1                                     / P[code;op] still possible
{P[(x 1)0]::P[(x 1)0]&{ok[x;y]}[x]'!16}'S
mp:16#-1
while[|/mp<0
  i:*&(mp<0)&1=+/'P
  o:*&P i
  mp[i]:o
  P[;o]:0
  P[i;o]:1]
r:0 0 0 0
run:{[i] o:mp i 0; r[i 3]::op[o;r;i 1;i 2]}
pg:{cl x}'(2+4*ns)_L
run'pg
r 0
\\
