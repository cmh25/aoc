/ AoC 2021 day 24: arithmetic logic unit (MONAD stack constraints)
L:0:"../24.in"
b:18*!14
tk:{_0.0$*|" "_x}
dz:tk'L@b+4; ax:tk'L@b+5; ay:tk'L@b+15
hi:14#0; lo:14#0; st:(); prs:()
{[i] if[(dz i)=1; st::st,,(i;ay i)]
 if[(dz i)=26; j:*|st; st::-1_st; prs::prs,,(j[0];i;j[1]+ax i)]}'!14;
{[p] j:p 0; i:p 1; d:p 2; ne:~d<0
 hi[j]::$[ne;9-d;9]; hi[i]::$[ne;9;9+d]
 lo[j]::$[ne;1;1-d]; lo[i]::$[ne;1+d;1]}'prs;
{[a;c;u](10j*a)+c}/[0j;hi;nul]   / part 1: largest model number
{[a;c;u](10j*a)+c}/[0j;lo;nul]   / part 2: smallest
\\
