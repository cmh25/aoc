d:-48+ic *0:"../08.in"
w:25; h:6; sz:w*h
n:(#d)div sz
ls:(n,sz)#d                    / n layers of sz pixels
zc:{+/x=0}'ls
best:ls@zc?&/zc                / layer with fewest zeros
(+/best=1)*+/best=2
pix:{*x@&~x=2}'+ls             / first non-transparent pixel per position
" #"@(h,w)#pix                 / render (space=black, #=white); @ deep-indexes, no adverb needed
\\
