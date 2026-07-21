d:-48+ic *0:"../16.in"
n:#d
base:0 1 0 -1
pm:{base((1+!n)div x+1)!4}'!n          / pattern matrix, row i
phase:{[c] {(abs+/x*c)!10}'pm}
r:100 phase/d
10 sv 8#r
/ part2: offset in 2nd half -> output = suffix cumsum mod 10
off:10 sv 7#d
L:(n*10000)-off
td:d (off+!L)!n                        / tail digits from offset
phase2:{(|+\|x)!10}
r2:100 phase2/td
10 sv 8#r2
\\
