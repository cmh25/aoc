salt:*0:"../14.in"
MAX:40000

/ first repeated-triple char in a hash, or 0 if none
trip:{[h] m:((-2_h)=1_-1_h)&(1_-1_h)=2_h; $[|/m; h@*&m; 0]}

solve:{[HA]
  keys:()
  i:0
  while[((#keys)<64)&i<MAX-1001;
    c:trip HA i
    if[~c~0;
      j:i+1; found:0
      while[(j<i+1001)&~found; if[0<#ss[HA j; 5#c]; found:1]; j:j+1]
      if[found; keys:keys,i]]
    i:i+1]
  *|keys}

/ part 1
HA1:{md5 salt,$x}'!MAX
solve HA1

/ part 2: 2016 extra rounds of hashing (2017 total) per index
HA2:{h:md5 salt,$x; do[2016;h:md5 h]; h}'!MAX
solve HA2
\\
