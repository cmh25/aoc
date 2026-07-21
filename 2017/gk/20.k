M:.'{@[x;&~x lin "-0123456789";:;" "]}'0:"../20.in"
P:M[;!3]                                          / positions
V:M[;3+!3]                                        / velocities
A:M[;6+!3]                                        / accelerations
am:+/'abs A                                        / |a|
vm:+/'abs V
pm:+/'abs P
*<am,'vm,'pm                                        / part 1: closest long-term = min (|a|,|v|,|p|)
/ part 2: simulate with collision removal
do[1000
  V::V+A
  P::P+V
  g:=P
  k:,/g@&1=#'g                                     / indices whose position is unique
  k:k@<k
  P::P k; V::V k; A::A k]
#P                                                 / part 2: survivors
\\
