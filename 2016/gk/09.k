s:*0:"../09.in"

decl:{[s;rec]
  n:#s; i:0; L:0j
  while[i<n;
    c:s[i]
    if[c="(";
       e:i+(i_s)?")";                 / index of matching ')'
       ab:"x"_(i+1)_e#s;              / marker "AxB" -> ("A";"B")
       a:0j$ab 0; b:0j$ab 1;
       data:s@(e+1)+!a;               / the a chars after ')'
       L+:b*$[rec; decl[data;1]; a];
       i:e+1+a]
    if[~c="("; L+:1; i+:1]]
  L}

decl[s;0]                              / part 1
decl[s;1]                              / part 2
\\
