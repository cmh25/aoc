L:0:"../03.in"
wire:{[s] t:","_s; ds:*'t; ns:0j$'1_'t;
  dx:(ds="R")-ds="L"; dy:(ds="U")-ds="D";
  px:+\,/ns#'dx; py:+\,/ns#'dy;
  (1000000j*px+500000)+py+500000}    / encode each visited point as one long key (long: avoid i32 overflow)
k1:wire L 0
k2:wire L 1
c:?k1@&k1 lin k2                     / distinct common keys
x:(c div 1000000)-500000
y:(c!1000000)-500000
&/(abs x)+abs y                      / closest by Manhattan distance
&/2+(k1?/c)+k2?/c                    / fewest combined steps (1-based); ?/ = per-element find
\\
