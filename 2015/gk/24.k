W:{0$(),x}'0:"../24.in"
W:W@>W
n:#W
bq:0j
srch:{[i;k;s;p]
  if[k=0; if[s=0; if[(bq<1)|p<bq; bq::p]]; :0]
  if[(i>n-1)|s<1; :0]
  if[(bq>0)&~p<bq; :0]
  srch[i+1;k-1;s-W i;p*0j+W i]
  srch[i+1;k;s;p]
  0}
go:{[t] k:1; bq::0j; while[bq<1; srch[0;k;t;1j]; k:k+1]; bq}
tot:+/W
go tot div 3
go tot div 4
\\
