v:-97+ic *0:"../11.in"
bads:8 11 14
inc:{[v] i:7; v[i]+:1; while[v[i]=26; v[i]:0; i:i-1; v[i]+:1]; v}
fix:{[v] if[|/v lin bads; j:*&v lin bads; v[j]+:1; v[j+1+!7-j]:0]; v}
valid:{[v] st:|/((1_-1_v)=1+-2_v)&(2_v)=2+-2_v; pr:1<#?v@&(1_v)=-1_v; st&pr}
nxt:{[v] v:fix inc v; while[~valid v; v:fix inc v]; v}
v:nxt v
ci 97+v
v:nxt v
ci 97+v
\\
