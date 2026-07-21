/ AoC 2022 day 5: supply stacks
L:0:"../05.in"
e:*&0=#'L                    / blank line separates picture from moves
h:(e-1)#L                    / crate rows (digit line at e-1)
ns:#&~(L e-1)=" "            / number of stacks
w:|/#'h
m:+{x,(w-#x)#" "}'h          / pad rows, transpose to columns
S:{x@&~x=" "}'m@1+4*!ns      / stack strings, top first
ms:0$'(" "_'(e+1)_L)@\1 3 5 / moves: (n;from;to)
st:S
{n:x 0;a:x[1]-1;b:x[2]-1; st[b]::(|n#st a),st b; st[a]::n_st a}'ms;
*'st                         / part 1: one at a time (reversed)
st:S
{n:x 0;a:x[1]-1;b:x[2]-1; st[b]::(n#st a),st b; st[a]::n_st a}'ms;
*'st                         / part 2: moved as a block
\\
