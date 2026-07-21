/ AoC 2020 day 2: password philosophy
L:0:"../02.in"
P:{t:" "_x;(0$"-"_t[0];t[1][0];t[2])}'L      / ((lo;hi);char;password)
p1:+/{c:+/x[2]=x[1];lo:x[0][0];hi:x[0][1];(~c<lo)&~c>hi}'P
p1                                            / part 1: count in [lo,hi]
p2:+/{lo:x[0][0];hi:x[0][1];ch:x[1];pw:x[2];1=(pw[lo-1]=ch)+pw[hi-1]=ch}'P
p2                                            / part 2: exactly one position
\\
