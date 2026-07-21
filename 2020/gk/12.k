/ AoC 2020 day 12: rain risk
L:0:"../12.in"
op:*'L; vl:0$'1_'L
px:0;py:0;dx:1;dy:0                            / part 1: ship moves, heading (dx,dy)
i:0;while[i<#L; o:op i;v:vl i
 if[o=*"N";py+:v]; if[o=*"S";py-:v]; if[o=*"E";px+:v]; if[o=*"W";px-:v]
 if[o=*"F";px+:v*dx;py+:v*dy]
 if[o=*"L";do[v div 90;t:dx;dx:-dy;dy:t]]
 if[o=*"R";do[v div 90;t:dx;dx:dy;dy:-t]]
 i:i+1]
(abs px)+abs py                                / part 1
sx:0;sy:0;wx:10;wy:1                           / part 2: waypoint-relative
i:0;while[i<#L; o:op i;v:vl i
 if[o=*"N";wy+:v]; if[o=*"S";wy-:v]; if[o=*"E";wx+:v]; if[o=*"W";wx-:v]
 if[o=*"F";sx+:v*wx;sy+:v*wy]
 if[o=*"L";do[v div 90;t:wx;wx:-wy;wy:t]]
 if[o=*"R";do[v div 90;t:wx;wx:wy;wy:-t]]
 i:i+1]
(abs sx)+abs sy                                / part 2
\\
