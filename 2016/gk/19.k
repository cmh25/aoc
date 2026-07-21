n:0$*0:"../19.in"

/ part 1: standard Josephus k=2 -> 2*(n-L)+1, L largest power of 2 <= n
L:1; while[(L*2)<n+1; L:L*2]
1+2*n-L

/ part 2: steal from across the circle. p = largest power of 3 <= n
p:1; while[(p*3)<n+1; p:p*3]
$[n=p; p; ~p<n-p; n-p; (2*n)-3*p]
\\
