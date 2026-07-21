s:0$'"-"_ *0:"../04.in"
ns:(s 0)+!1+(s 1)-s 0
dg:{(6#10) vs x}'ns              / six digits of each candidate
nd:{~|/(1_x)< -1_x}'dg           / digits never decrease
+/nd&{|/(1_x)= -1_x}'dg          / some adjacent pair equal
+/nd&{|/2={#x}'=x}'dg            / some digit-run is exactly length 2
\\
