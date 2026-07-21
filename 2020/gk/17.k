/ AoC 2020 day 17: conway cubes (3D and 4D game of life on a coord set)
g:0:"../17.in"
base:,/{[i] j:&"#"=g i; {(i;x)}'j}'!#g          / active (row;col) cells
B:200j
solve:{[d] off:{-1+(d#3)vs x}'!_3^d
 off:off@&~{&/x=0}'off                           / 3^d-1 neighbour offsets
 Bp:1j,*\(d-1)#B                                  / mixed-radix weights (long)
 enc:{+/Bp*64+x}
 act:{x,(d-2)#0}'base                             / extend to d dims, extra coords 0
 step:{[act] alln:,/{[c]{c+x}'off}'act
  ky:enc'alln; grp:=ky
  cnt:#'grp; dk:ky@*'grp; dc:alln@*'grp
  keep:(cnt=3)|(dk lin enc'act)&cnt=2
  dc@&keep}
 do[6; act:step act]
 #act}
solve 3                                          / part 1
solve 4                                          / part 2
\\
