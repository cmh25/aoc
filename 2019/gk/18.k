G:0:"../18.in"
CG:ic'G
h:#G; w:#*G
cc:,/CG
P2:1,*\25#2
bfsFrom:{[sx;sy]
  vd::(h*w)#-1; rq::(h*w)#0;
  s:sx+w*sy; @[`vd;s;:;0];
  q:,s; res:();
  while[#q;
    c:*q; q:1_q;
    nb:(1+c; c-1; c+w; c-w);
    ei:0;
    while[ei<4;
      nc:nb ei; ch:CG[nc div w]@nc!w;
      if[$[(~ch=35)&(vd nc)<0;1;0];
         @[`vd;nc;:;1+vd c];
         @[`rq;nc;:;or[rq c;$[(ch>64)&ch<91; P2 ch-65; 0]]];
         q:q,nc;
         if[(ch>96)&ch<123; res:res,,(ch-97; vd nc; rq nc)]];
      ei+:1]];
  res}
kf:&(cc>96)&cc<123
kb:(cc kf)-97
full:+/P2 kb
nk:#kf
MB:67108864
HB:16777216; HM:HB-1
hsh:{a:x; a:xor[a;a div 1024]; a:xor[a;a div 1048576]; and[a;HM]}
has:{[x] i:hsh x; r:0; c:1; while[c; k:HK i; if[k=x; r:1; c:0]; if[$[c;k<0;0]; c:0]; if[c; i:and[i+1;HM]]]; r}
add:{[x] i:hsh x; c:1; while[c; k:HK i; if[$[k<0;1;k=x]; c:0]; if[c; i:and[i+1;HM]]]; @[`HK;i;:;x]}
bfsAt:{bfsFrom[x!w;x div w]}
setup:{[starts] ns::#starts; b2p::@[26#-1; kb; :; ns+!nk]; EGA::(bfsAt'starts),bfsAt'kf}
hpush:{[d;s] HD::HD,d; HS::HS,s; i:(#HD)-1; c:1;
  while[c;
    if[i=0; c:0];
    if[i>0; p:(i-1)div 2;
       if[~HD[p]>HD i; c:0];
       if[HD[p]>HD i; t:HD p;@[`HD;p;:;HD i];@[`HD;i;:;t]; u:HS p;@[`HS;p;:;HS i];@[`HS;i;:;u]; i:p]]]}
hpop:{rd:HD 0; rs:HS 0; n:(#HD)-1;
  @[`HD;0;:;HD n]; @[`HS;0;:;HS n]; HD::(-1)_HD; HS::(-1)_HS; n:#HD;
  i:0; c:1;
  while[c;
    l:1+2*i; r:2+2*i; mn:i;
    if[$[l<n;HD[l]<HD mn;0]; mn:l];
    if[$[r<n;HD[r]<HD mn;0]; mn:r];
    if[mn=i; c:0];
    if[~mn=i; t:HD mn;@[`HD;mn;:;HD i];@[`HD;i;:;t]; u:HS mn;@[`HS;mn;:;HS i];@[`HS;i;:;u]; i:mn]];
  (rd;rs)}
solve:{[rp]
  nr:#rp; SH::(0j+MB)*_64^!nr;
  HK::HB#-1j; HD::,0; HS::,+/rp*SH; ans:-1; done:0;
  while[$[#HD;~done;0];
    r:hpop[]; cd:r 0; cs:r 1;
    if[~has cs;
       add cs;
       mask:cs!MB;
       if[mask=full; ans:cd; done:1];
       if[~done;
          ps:(cs div SH)!64; ri:0;
          while[ri<nr;
            es:EGA ps ri; ne:#es; ej:0;
            while[ej<ne;
              e:es ej; ej+:1; nb:e 0;
              if[$[and[e 2;mask]=e 2; 0=and[mask;P2 nb]; 0];
                 ns:(or[mask;P2 nb])+ +/(@[ps;ri;:;b2p nb])*SH;
                 if[~has ns; hpush[cd+e 1; ns]]]];
            ri+:1]]]];
  ans}
si:cc?64
setup[,si];
solve(,0)
sx:si!w; sy:si div w
setc:{[x;y;v] @[`CG; y; :; @[CG y; x; :; v]]}
setc[sx;sy;35]; setc[sx-1;sy;35]; setc[sx+1;sy;35]; setc[sx;sy-1;35]; setc[sx;sy+1;35];
starts:(sx-1)+w*sy-1; starts:starts,(sx+1)+w*sy-1; starts:starts,(sx-1)+w*sy+1; starts:starts,(sx+1)+w*sy+1
setup[starts];
solve 0 1 2 3
\\
