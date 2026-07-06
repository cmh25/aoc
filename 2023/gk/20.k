/ AoC 2023 day 20: pulse propagation
ps:{"@"_ssr[x;" -> ";"@"]}'0:"../20.in"
hd:ps@'0
typ:("%"=*'hd)+2*"&"=*'hd              / 0 broadcaster, 1 flip-flop, 2 conjunction
nm:(typ>0)_'hd
dl:{","_ssr[x;", ";","]}'ps@'1
u:?,/dl
u:u@&(nm?/u)=#nm                       / dest-only sink modules (rx, output)
nsl:nm,u
typ:typ,(#u)#3
DS:({nsl?/x}'dl),(#u)#,!0
IN:(#nsl)#,!0
m:0
while[m<#nm; j:0; ds:DS m; while[j<#ds; d:ds j; IN[d]:IN[d],m; j:j+1]; m:m+1]
PO:{{x?y}'[IN DS x;x]}'!#nsl           / position of m in each dest's input list
bc:nsl?"broadcaster"
FB:(#nsl)#0
MEM:0*IN
press:{[t] qd::,bc; qp::,0; qx::,0; nlo::nlo+1; i:0
 while[i<#qd
  d:qd i; p:qp i; t2:typ d; o:-1
  if[t2=0; o:p]
  if[t2=1; if[~p; FB[d]::~FB d; o:FB d]]
  if[t2=2; MEM[d;qx i]::p; o:~&/MEM d
   if[o; wi:WT?d; if[wi<#WT; if[0=HIT wi; HIT[wi]::t]; if[(t>HIT wi)&0=HIT2 wi; HIT2[wi]::t]]]]
  if[o>-1; ds:DS d; k:#ds; qd::qd,ds; qp::qp,k#o; qx::qx,PO d; $[o;nhi::nhi+k;nlo::nlo+k]]
  i:i+1]}
nlo:0; nhi:0; WT:!0; HIT:!0; HIT2:!0
do[1000; press 0]
nlo*nhi                                / part 1: low pulses * high pulses after 1000 presses
FB:(#nsl)#0
MEM:0*IN
WT:IN@*IN nsl?"rx"                    / part 2: the conjunctions feeding rx's feeder
HIT:0*WT; HIT2:0*WT
pn:0
while[0<+/HIT2=0; pn:pn+1; press pn]
if[~HIT2~2*HIT; "PERIOD MISMATCH"; HIT; HIT2]
{(x*y)div{while[y>0;r:x!y;x:y;y:r];x}[x;y]}/1j*HIT   / lcm of feeder periods
\\
