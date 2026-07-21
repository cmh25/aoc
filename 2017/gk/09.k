s:ic*0:"../09.in"
n:#s
depth:0; score:0; garb:0; ing:0; i:0
while[i<n
  c:s i
  $[c=33; i+:1                                   / '!' cancels the next char
    ing; $[c=62; ing:0; garb+:1]                 / in garbage: '>' ends, else count
    c=60; ing:1                                   / '<' starts garbage
    c=123; score+:depth+:1                          / open group: bump depth, add to score
    c=125; depth-:1                              / '}' closes a group
    0]
  i+:1]
score                                            / part 1
garb                                             / part 2
\\
