/ AoC 2021 day 22: reactor reboot
L:0:"../22.in"
on:"n"=L@'1
M:{. ssr[ssr[ssr[ssr[ssr[x;"on x=";""];"off x=";""];",y=";" "];",z=";" "];"..";" "]}'L
g:(101 101 101)#0
{[i] c:M i; a:-50|c@0 2 4; b:50&c@1 3 5
 if[&/~a>b
  g::.[g;(50+a[0]+!1+b[0]-a 0;50+a[1]+!1+b[1]-a 1;50+a[2]+!1+b[2]-a 2);:;0+on i]]}'!#L;
+/,/,/g                      / part 1: init region cubes on
X1:0#0j;X2:X1;Y1:X1;Y2:X1;Z1:X1;Z2:X1;SG:X1
{[i] c:0j+M i
 ix1:X1|c 0; ix2:X2&c 1; iy1:Y1|c 2; iy2:Y2&c 3; iz1:Z1|c 4; iz2:Z2&c 5
 k:&(~ix1>ix2)&(~iy1>iy2)&~iz1>iz2
 ns:-SG k
 X1::X1,ix1 k; X2::X2,ix2 k; Y1::Y1,iy1 k; Y2::Y2,iy2 k; Z1::Z1,iz1 k; Z2::Z2,iz2 k; SG::SG,ns
 if[on i; X1::X1,c 0; X2::X2,c 1; Y1::Y1,c 2; Y2::Y2,c 3; Z1::Z1,c 4; Z2::Z2,c 5; SG::SG,1j]}'!#L;
+/SG*(1+X2-X1)*(1+Y2-Y1)*1+Z2-Z1   / part 2: full reboot volume
\\
