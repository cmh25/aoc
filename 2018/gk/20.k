s:1_-1_*0:"../20.in"
NC:512*512
D:NC#0                                  / door bitmask per room: 1 N, 2 E, 4 S, 8 W
off:(-512),1,512,-1
bt:1 2 4 8
ob:4 8 1 2
st:()
cur:256+512*256
i:0
n:#s
while[i<n
  c:s i
  j:"NESW"?c
  if[j<4; @[`D;cur;or;bt j]; nx:cur+off j; @[`D;nx;or;ob j]; cur:nx]
  if[c="("; st,:cur]
  if[c="|"; cur:*|st]
  if[c=")"; cur:*|st; st:-1_st]
  i+:1]
dt:NC#-1
s0:256+512*256
dt[s0]:0
fr:,s0
k:0
while[#fr
  k+:1
  nb:,/{(fr@&0<(D fr) and bt x)+off x}'!4
  nb:?nb@&(dt nb)<0
  if[#nb; dt[nb]:k]
  fr:nb]
|/dt
+/dt>999
\\
