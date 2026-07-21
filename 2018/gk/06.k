C:.'0:"../06.in"
C:C-\(&/C[;0]),&/C[;1]                        / shift to origin
W:1+|/C[;0]; H:1+|/C[;1]
X:!W; Y:!H
D:{,/(abs Y-x 1) +\ abs X-x 0}'C              / n x (H*W) manhattan distances
mn:&/D                                        / per-cell nearest distance
eq:{x=mn}'D
cnt:+/eq                                      / how many coords tie
own:+/(!#C)*eq                                / owner (valid only when cnt=1)
bi:(!W),(((H-1)*W)+!W),(W*!H),(W-1)+W*!H      / bounding-box border cells
inf:?own@bi@&1=cnt bi                         / owners with infinite area
o:own@&cnt=1
o:o@&~o lin inf
|/#'=o
+/10000>+/D
\\
