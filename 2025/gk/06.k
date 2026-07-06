/ AoC 2025 day 6: cephalopod math. Both parts parsed from column blocks (split on
/ all-space columns) so problems with missing numbers in some row still work.
/ P1: numbers are block ROWS (spaces stripped). P2: numbers are block COLUMNS.
L:0:"../06.in"
w:|/#'L
c:+w$'L                       / character columns
nr:(#L)-1                     / digit rows (last row is ops)
bl:&/'" "=c
gs:=(+\bl)@nb:&~bl            / group non-blank columns into blocks
BC:{c nb x}'gs                / block -> its columns
op:{oc:(+x)nr; *oc@&~" "=oc}'BC
n1:{s:+nr#'x; s:s@&{~&/" "=x}'s; {0j$x@&~" "=x}'s}'BC
n2:{{t:nr#x; 0j$t@&~" "=t}'x}'BC
+/{$[y="*";*/x;+/x]}'[n1;op]  / part 1
+/{$[y="*";*/x;+/x]}'[n2;op]  / part 2
\\
