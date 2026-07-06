/ AoC 2024 day 23: LAN party
L:0:"../23.in"
ps:"-"_'L
ns:?,/ps; n:#ns
ai:ns?/*'ps; bi:ns?/ps@'1         / edge endpoints as ids
F:(n*n)#0; F[(n*ai)+bi]:1; F[(n*bi)+ai]:1
A:(n;n)#F                          / adjacency matrix
lo:ai&bi; hi:ai|bi
tf:"t"=*'ns                        / name starts with t
/ triangles a<b<k as common neighbors k>b of each edge; keep those with a t
tri:{[a;b] ks:&A[a]&A[b]; ks:ks@&ks>b; +/tf[a]|tf[b]|tf ks}
+/tri'[lo;hi]
/ part 2: password = largest clique, sorted comma-joined; seed v+neighbors,
/ peel the member with fewest in-set edges until all pairwise connected
clq:{[v] S:v,&A v; d:+/'A[S;S]; while[|/~d=(#S)-1; S:S di ,d?&/d; d:+/'A[S;S]]; S}
cliques:clq'!n
bs:ns cliques@*>#'cliques
1_,/",",'bs@<bs
\\
