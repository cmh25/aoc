/ AoC 2021 day 2: dive!
L:0:"../02.in"
c:*'L                        / f/d/u
n:0$'*'|'" "_'L
dd:("d"=c)-"u"=c
h:+/n*c="f"
h*+/n*dd                     / part 1: horizontal * depth
h*+/(c="f")*n*+\n*dd         / part 2: aim = cumsum of d/u, depth += aim*fwd
\\
