/ AoC 2021 day 4: giant squid (bingo)
L:0:"../04.in"
draws:0$","_*L
rows:.'{x@&0<#'x}2_L
nb:(#rows)div 5
flat:,/rows
R:(nb,5,5)#flat
P:(nb,5,5)#draws?/flat       / when each cell gets marked
w:{(&/|/'x)&&/|/'+x}'P       / per-board win time: min over rows and cols
sc:{[b] T:w b; (+/(,/R b)*(,/P b)>T)*draws T}
sc w?&/w                     / part 1: first board to win
sc w?|/w                     / part 2: last board to win
\\
