/ AoC 2021 day 12: passage pathing
e:"-"_'0:"../12.in"
nm:?,/e
ai:nm?/e@'0; bi:nm?/e@'1
adj:{(bi@&ai=x),ai@&bi=x}'!#nm
lc:96<ic *'nm                / lowercase = small cave
S:nm?"start"; E:nm?"end"
cnt:{[v;vis;tw] $[v=E;1;+/{$[x=S;0;~vis x;cnt[x;@[vis;x;:;lc x];tw];tw;cnt[x;vis;0];0]}'adj v]}
cnt[S;(#nm)#0;0]             / part 1: small caves at most once
cnt[S;(#nm)#0;1]             / part 2: one small cave may repeat
\\
