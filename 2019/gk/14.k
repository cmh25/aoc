L:0:"../14.in"
pterm:{t:" "_x; t:t@&0<#'t; (0j$t 0; `$t 1)}
pl:{s:"|"_ssr[x;"=>";"|"]; o:pterm(s 1); (o 1; o 0; pterm'","_s 0)}
P:pl'L
outs:P[;0]; bq:P[;1]; inl:P[;2]
u:?(,`ORE),outs,,/{x[;1]}'inl
nu:#u
idF:u?`FUEL; idO:u?`ORE
bat:@[nu#0j; u?/outs; :; bq]
INS:@[nu#,(); u?/outs; :; {[r](r[;0]),'u?/r[;1]}'inl]
cc:@[nu#0; ,/{u?/x[;1]}'inl; +; 1]
oreFor:{[amt]
  need::nu#0j; @[`need;idF;:;amt]; cc2::cc; q::,idF;
  while[#q;
    o:*q; q::1_q;
    if[~o=idO;
      n:need o; bt:bat o; b:(n+bt-1)div bt;
      {[b;pr] i:pr 1; @[`need;i;+;b*pr 0]; @[`cc2;i;-;1]; if[0=cc2 i; q::q,i]}[b]'INS o]];
  need idO}
oreFor 1j
T:1000000000000j
lo:1j; hi:T
while[lo<hi; m:(1+lo+hi)div 2; $[T<oreFor m; hi:m-1; lo:m]]
lo
\\
