/ AoC 2021 day 8: seven segment search
t:"|"_'0:"../08.in"
tok:{x@&0<#'x}
pw:tok'(" "_'t@'0); ow:tok'(" "_'t@'1)
+/,/{(#'x)lin 2 3 4 7}'ow    / part 1: output digits 1,4,7,8 by length
dec:{[ps;os]
 s:{x@<x}'ps; ln:#'s
 one:s@ln?2; four:s@ln?4
 f5:s@&ln=5; f6:s@&ln=6
 nine:*f6@&{&/four lin x}'f6
 zero:*f6@&{(&/one lin x)&~x~nine}'f6
 six:*f6@&{~(x~nine)|x~zero}'f6
 three:*f5@&{&/one lin x}'f5
 five:*f5@&{&/x lin six}'f5
 two:*f5@&{~(x~three)|x~five}'f5
 10 sv (zero;one;two;three;four;five;six;s@ln?3;s@ln?7;nine)?/{x@<x}'os}
+/dec'[pw;ow]                / part 2: decoded outputs summed
\\
