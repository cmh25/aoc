P:.'{@[x;&~x lin "-0123456789";:;" "]}'0:"../10.in"
x:P[;0]; y:P[;1]; vx:P[;2]; vy:P[;3]
h:{[t] (|/y+t*vy)-&/y+t*vy}      / vertical extent shrinks to a minimum at the message
t:0
while[h[t+1]<h t; t+:1]
X:x+t*vx; Y:y+t*vy
X:X-&/X; Y:Y-&/Y
W:1+|/X; H:1+|/Y
(H,W)#@[(H*W)#" ";X+W*Y;:;"#"]
t
\\
