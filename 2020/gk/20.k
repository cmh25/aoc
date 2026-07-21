/ AoC 2020 day 20: jurassic jigsaw
L:0:"../20.in"
gid:+\0=#'L
G:{L@&(gid=x)&0<#'L}'?gid
G:G@&0<#'G                                        / drop empty groups (trailing blank line)
ids:{0j$-1_5_*x}'G                               / "Tile 2311:" -> 2311
grids:{1_x}'G
en:{2 sv"#"=x}                                    / edge string -> 10-bit number
ce:{(en x)&en(|x)}                                / canonical = min(edge, reverse)
edges:{[g](g 0;g 9;g[;0];g[;9])}
tce:{ce'edges x}'grids                            / 4 canonical edges per tile
allce:,/tce
nbord:{+/1={+/allce=x}'x}'tce                     / #edges unique to this tile
*/ids@&2=nbord                                    / part 1: product of corner ids
/ part 2: assemble, strip borders, hunt sea monsters
rt:{+|x}                                         / rotate 90
oris:{[g] r0:g;r1:rt g;r2:rt r1;r3:rt r2; (r0;r1;r2;r3),{|'x}'(r0;r1;r2;r3)}
K:_sqrt#grids
ori:oris'grids
isouter:{1=+/allce=ce x}
find:{[used;pr] res:0;t:0                          / first unused tile+orient satisfying pr
 while[t<#grids
  if[~used t; os:ori t;k:0
   while[k<8; o:os k; if[pr o; res:(t;o);t:#grids;k:8]; k:k+1]]
  t:t+1]
 res}
/ fill the KxK grid from a given top-left orientation; returns PL or 0 on a dead end
fill:{[c0] PL:(K*K)#0; U:(#grids)#0; ok:1
 PL[0]:c0 1; U[c0 0]:1
 c:1;while[(c<K)&ok; lft:PL[c-1]; L9:en lft[;9]
  m:find[U;{(en x[;0])=L9}]
  if[m~0;ok:0]; if[~m~0; PL[c]:m 1; U[m 0]:1]; c:c+1]
 r:1;while[(r<K)&ok
  c:0;while[(c<K)&ok
   abv:PL[c+(r-1)*K]; TT:en abv 9; lft:PL[(c-1)+r*K]; LT:en lft[;9]
   m:$[c=0; find[U;{(en x 0)=TT}]; find[U;{((en x 0)=TT)&(en x[;0])=LT}]]
   if[m~0;ok:0]; if[~m~0; PL[c+r*K]:m 1; U[m 0]:1]; c:c+1]
  r:r+1]
 $[ok;PL;0]}
/ try every corner-orientation as (0,0) until one assembles fully
cands:,/{[t] {[t;o] $[(isouter o 0)&isouter o[;0]; (t;o); 0]}[t]'ori t}'!#grids
cands:cands@&{~x~0}'cands
PL:{[acc;c;z] $[acc~0; fill c; acc]}/[0;cands;nul]
inr:{1_-1_{1_-1_x}'x}
PI:inr'PL
img:,/{[r] ,/'+PI@(r*K)+!K}'!K
mon:((0;18);(1;0);(1;5);(1;6);(1;11);(1;12);(1;17);(1;18);(1;19);(2;1);(2;4);(2;7);(2;10);(2;13);(2;16))
countmon:{[im] IM::im; H:#im; W:#*im
 +/,/{[r] {[r;c] &/{"#"=IM[r+x 0][c+x 1]}'mon}[r]'!W-19}'!H-2}
tot:+/+/"#"=img
tot-15*|/countmon'oris img                        / part 2: water roughness
\\
