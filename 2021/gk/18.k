/ AoC 2021 day 18: snailfish (flat value/depth vectors)
pl:{d:+\("["=x)-"]"=x; i:&x lin "0123456789"; (-48+ic x i;d i)}
ex:{[v;d;i] if[i>0; v[i-1]:v[i-1]+v i]; if[(i+2)<#v; v[i+2]:v[i+2]+v i+1]; ((i#v),0,(i+2)_v;(i#d),4,(i+2)_d)}
sp:{[v;d;i] a:(v i)div 2; ((i#v),a,((v i)-a),(i+1)_v;(i#d),(1+d i),(1+d i),(i+1)_d)}
red:{[s] r:1
 while[r
  i:s[1]?5
  if[i<#s 1; s:ex[s 0;s 1;i]]
  if[~i<#s 1; j:(9<s 0)?1; $[j<#s 0; s:sp[s 0;s 1;j]; r:0]]]
 s}
add:{red(x[0],y 0;1+x[1],y 1)}
mg:{v:x 0; d:x 1; while[1<#v; md:|/d; i:d?md; v:(i#v),((3*v i)+2*v i+1),(i+2)_v; d:(i#d),(md-1),(i+2)_d]; *v}
ps:pl'0:"../18.in"
t:add/ps
mg t                         / part 1: magnitude of the total
ii:!#ps
|/,/{[i] {mg add[ps i;ps x]}'ii di ,i}'ii   / part 2: best ordered pair
\\
