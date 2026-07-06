---
name: gk
description: Write, run, and debug programs in gk (https://github.com/cmh25/gk). Use whenever the task is to solve a problem, compute something, or write a script in gk/k (e.g. Advent of Code, Project Euler, data crunching, array/idiom puzzles), or to interpret gk syntax, errors, primitives, adverbs, or builtins.
---

# Solving problems in gk

The interpreter is the `gk` binary, built at the root of a gk source checkout (`./gk` when working in the gk repo itself; elsewhere put it on PATH or use an absolute path). This skill is for writing correct gk code: scripts, one-liners, and debugging. Advent of Code / Project Euler are just typical use cases.

**gk is terse and unforgiving.** The fastest path to a correct answer is: write a few lines, run them, read the result, iterate. Do not write a long program and hope. Build it expression-by-expression in a script and watch each intermediate value print.

## Authoritative references (read these, don't guess — paths relative to the gk source checkout)

| File | Use for |
|------|---------|
| `doc/ref.md` | Every primitive, builtin, type, syntax detail. The source of truth. |
| `doc/tutorial.md` | Quick feel for the REPL. |
| `doc/k3.md` | Adverb/valence semantics in depth. |
| `doc/ref.md` (Valence section) | How many args a function takes; projections; `f[]` passes `nul`. |
| `t/kidioms` | **~240 worked, tested idioms** (sorting, grouping, parsing, matrices, dates, stats). When you need "how do I X in array style", grep this file first. Each idiom is `"N. title"` then code with a `~`-checked expected result. |

Grep idioms by topic, e.g. `grep -n -i 'sort\|group\|primes\|gcd\|histogram' <gk-checkout>/t/kidioms`, then read that block.

**Finding the checkout:** if the current repo is itself a gk checkout
(`doc/ref.md` and `t/kidioms` present), use it directly. Otherwise this skill
does not know where the checkout is: locate the binary first (`$GK` if set, else `command -v gk`); a
built-from-source binary sits at the checkout root, so `doc/` and `t/` are
beside it. If the binary is bare (or absent), **ask the user** for the
checkout path — or clone the public repo,
`git clone https://github.com/cmh25/gk`, which includes the docs, `t/kidioms`,
and the source to build with `make`. Do not guess filesystem paths.

## Running gk

A gk **script** is just a sequence of REPL lines. **Every top-level expression prints its value** (like the REPL — there is no `print`). End the file with `\\`.

```
./gk -q script.k          # -q suppresses the startup banner; runs the file then would REPL
./gk -q script.k </dev/null   # belt-and-suspenders: ensure it exits even without trailing \\
echo '+/!100' | ./gk -q   # one-liner via stdin
```

In this sandbox `./gk -q file.k` may run in the background — read the task output file to see results.

Key script facts:
- **Assignments are silent**; bare expressions print. To suppress a noisy expression, either assign it (`r:{...}'big`) or **end the line with `;`** — a trailing `;` is an empty final statement, so nothing prints (`!_1e6;` computes but shows nothing).
- `/` to end of line is a comment.
- On an error the script **stops** and drops to a `>` debug prompt (you'll see the error, the expression, and a `^` caret). In a non-interactive run it just halts there — so the error message is your signal. At that prompt you could inspect `x`, `y`, locals; `\` aborts.
- Build the interpreter with `make` in the gk checkout if the binary is stale.

## The evaluation model — this is where bugs come from

**1. Right to left, NO operator precedence.** Every verb binds equally; the right argument of a verb is *everything to its right*.

```
2*3+4      → 14   (not 10): 3+4 first, then 2*
n-1-i      → n-(1-i)   NOT (n-1)-i   ← extremely common bug
!n-1       → !(n-1)
```
When in doubt, **parenthesize**: write `(n-1)-i`, `!(n-1)`, `(2*3)+4`.

**2. A symbol is monadic or dyadic from context.** `-5` is negate; `8-5` is minus. `*x` is first; `a*x` is times. `#x` is count; `a#x` is take. There is **no force-monad** (`#:`); valence is always positional.

**3. Negative literals vs negate.** `-1 2 3` is the literal vector `-1 2 3`. To negate a vector, separate with a space: `- 1 2 3` → `-1 -2 -3`.

**4. There is no `<>`, `!=`, `&&`, `||`, `==` — and no `<=`/`>=` either** (`2<=3` is a `rank error`).
- not-equal: `~a=b`   (`=` then `~`); ≤ is `~a>b`, ≥ is `~a<b`
- equal/match: `=` (elementwise), `~` (whole-value match → 0/1)
- and/or on booleans: `&` (min) and `|` (max); not: `~`
- `<` `>` are less/greater (and monadic grade-up/grade-down).

**5. `_` is the floor/drop verb, never part of a name.** Names are letters and digits only (`xs`, `p2`, `n1`). `a_b` is "a drop b".

**6. `:` is assign; `::` is global-assign (use inside functions to mutate an outer/global var).** A function returns the value of its last expression. Indexed assign: `p[i]:v`; amend-in-place `a+:1`.

## Quick cheat sheet (see `doc/ref.md` for full semantics)

Monadic: `+`flip/transpose `-`negate `*`first `%`reciprocal `&`where(indices of 1s) `|`reverse `<`gradeup `>`gradedown `=`group `~`not `.`value(eval/apply) `!`enumerate/keys `@`is-atom `?`unique `#`count `_`floor `^`shape `,`enlist `$`format.

Dyadic: `+ - * %` arith · `&`min/and `|`max/or · `< > =`compare · `~`match · `a.x`apply · `a!x`mod (`7!3`→1) · `a@x`index · `a?x`find(first index, `#a` if absent) · `a#x`take/reshape · `a_x`drop/cut (single-char `a` splits a string) · `a^x`power · `a,x`join · `a$x`pad / cast-parse (`0$`int `0.0$`float `0j$`long `0.0e$`real).

Adverbs (valence-driven — see `doc/k3.md`):
- `f'x` each · `x f'y` each-pair · `f'[x;y;z]` each
- `f/x` over/fold (`+/`=sum, `&/`=min, `|/`=max, `*/`=product) · `x f/y` each-right · `n f/x` do-n-times · `b f/x` while · monadic `g/x` = converge (iterate until the value stops changing — great for fixpoints, e.g. DAG path counts `c:{ind++/'A*\x}/ind`)
- `f\x` scan (running) · `x f\y` each-left · `n f\x` do-n scan · `b f\x` while scan
- `ep[f;x]` each-prior — returns n-1 items, NO seeded first element: `ep[-;1 3 6 10]` → `2 3 4` (f[cur;prev]) IS the delta vector already — don't `1_` it · `_[n;f;x]` sliding window (n = step, sign = arg order)

Useful builtins: `abs sqrt sqr exp log sin cos floor ceil` · `a div x` integer-divide · `a vs x`/`x sv y` base encode/decode · `?` roll `draw[n;m]` · `ss[a;x]` substring search · `ssr[s;from;to]` string replace · `sm` regex match · `ic`/`ci` char↔int · `in` whole-value membership (elementwise: `lin`) · `a bin x`/`a binl x` binary search in sorted `a` (count of items < x; exact hit → its index, like `a?x`) · `,/` raze · `=` group, then `{#x}'=v` gives group sizes. Full list: the builtins section of `doc/ref.md`.

## Style: avoid lambdas when a primitive chain exists

Lambdas work everywhere, but **every lambda call pays interpreter apply
overhead**, while primitives and adverbs run fused native loops. When an
expression is just verbs applied in sequence, write the verb/adverb chain:

```
{+/b=x}'a      →  +/'a=\b        / each-left match matrix, rows summed
{x*y}'[v;w]    →  v*w             / arithmetic is already elementwise
{#x}'l         →  #'l             / most monadic verbs each directly
{v x}'is       →  v is  or  v@is  / indexing is DEEP: list-of-index-vectors needs no each (NOT v@'is -- each-both, length error)
```

**Atom broadcast in each-both.** `x f'y` is each-both: two equal-length
lists zip pairwise, but an ATOM on either side is recycled against every
item of the other. This kills many per-item lambdas where the plain dyad
means something else entirely:

```
L:("abc";"de")
L,"~"        → ("abc";"de";"~")     / join appends "~" as ONE list item
L,'"~"       → ("abc~";"de~")       / atom right: joined onto EACH string
5,'!3        → (5 0;5 1;5 2)        / atom left: a pair per item ({(5;x)}' gone)
ps@'1        → 11 21 31             / element 1 of EACH pair ({x 1}' gone)
M!'10j       → each row mod 10      / matrix!atom does not row-recurse
```

Only genuine atoms broadcast: a STRING left arg is a vector, so
`"ab",'("xx";"yy")` zips char-with-string → ("axx";"byy") (length error when
counts differ) — string padding per row still needs a lambda.

Reach for a lambda when the body genuinely needs one: multiple statements,
conditionals (`$[;;]`), closures over locals, or a composition the grammar
won't express (the `f(g'x)` family). Per-item lambdas in hot loops are the
first thing to hunt when something is slow.

## Reading & parsing input

```
L:0:"input.txt"        / read file → list of line strings (no newlines)
a 0:"out.txt"          / dyadic: write list-of-strings a to file
```

There are **two ways to turn strings into numbers**. Prefer the cast for real input; the eval trick is a terse shortcut for trusted numeric data.

**A. Split + cast (safe, recommended).** `a_x` with a **single char** `a` splits a string on that delimiter; then a numeric-zero `$` casts each piece:

```
","_"162,817,812"   → ("162";"817";"812")   / split on the comma char
0$","_"162,817,812"  → 162 817 812           / 0$  -> int   (-1 vector)
0.0$","_"...         → 162 817 812.0          / 0.0$ -> float (-2)
0j$'","_"...         → 162 817 812j           / 0j$' -> long  (-8, 64-bit); MUST be the each form -- see below
0.0e$","_"...        → 162 817 812.0e         / 0.0e$-> real  (-9, f32)
```
- `0$`/`0j$` are **strict**: digits only, no sign/decimal/whitespace → `domain error` otherwise (this *catches* a bad parse instead of silently truncating). `0.0$`/`0.0e$` are **lenient** (handle `-`, `.`, like `strtod`).
- The split delimiter must be a **char atom** (`","`, `" "`). A multi-char delimiter type-errors — swap it to one char first with `ssr[line;", ";","]`, then split.
- **`0j$` on a LIST of strings silently returns an int vector** (type -1), overflowing big values to `0I` — the long tag only survives the atom form. For lists use the each form **`0j$'`** (→ -8 longs).
- **Puzzle-scale values routinely exceed 32-bit int** — parse with `0j$'` and stay in longs end-to-end (`div`, `!`, `|`, `&`, comparisons all work on longs). Watch `^`: power returns **float** even on int/long args (`10j^3` → `1000.0`); for exact integer powers use `*/d#10j` (or `_2^x` when small).

**B. Eval (`.`), terse but unsafe.** `.` evaluates the string *as gk code*, so commas (join) and spaces (vector) already parse:

```
."162 817 812"   → 162 817 812      / spaces = vector
."162,817,812"   → 162 817 812      / comma IS the join verb
.'L              → parse every line  (a matrix if rows are equal length)
```
Handy for trusted numeric input (and it handles signs/decimals/arithmetic), but it **executes whatever is in the string** — never point it at untrusted text. For non-numeric fields, swap delimiters with `ssr` first.

Other tactics:
- Whole grid of digits with no separators: `ic'line` (char codes) or `-48+ic line` for digit values; reshape with `r c # flat`.
- Transpose columns↔rows with `+m`. Index a column with `m[;j]`.
- **Nested split** for `a-b,c-d`: `"-"_/","_line` (split on `,`, then split each piece on `-`).
- **Filter / partition by a predicate:** `&pred'xs` = indices where the predicate is true; `&~pred'xs` = indices where false. Then `xs@i` selects, and `xs di i` *removes* those indices (`di` = drop-at-indices). Building two complementary sets: collect `xs i`, keep `xs di i`.
- **Grid neighbor counts** (Conway-style): zero-pad the boolean grid, then sum the 8 shifted submatrices — `p:(,z),(0,'m,'0),,z` with `z:(w+2)#0`, then `N:+/{p[(x 0)+!n;(x 1)+!w]}'(0 0;0 1;0 2;1 0;1 2;2 0;2 1;2 2)`. For row-at-a-time propagation (beams, cellular steps) shift a boolean vector: left `(1_h),0`, right `0,-1_h`.
- **Periodicity / repeat count:** `#ss[s;p]` counts (overlapping) occurrences of pattern `p` in `s` — e.g. `#ss[s;k#s]` tests whether `s` is its first `k` chars repeated.

## Control flow & accumulation

```
$[cond; then; else]              / conditional expression (returns a value)
$[c1; e1; c2; e2; else]          / multi-way (cond;val;cond;val;...;default)
                                 / branches are single EXPRESSIONS -- a [s1;s2]
                                 / block is a parse error; use if/do/while for
                                 / statement lists. Keep the whole $[...] on one
                                 / line inside {} (newline = statement separator).
if[test; s1; s2; ...]            / run statements for side effects when test true
while[test; s1; s2; ...]         / loop while test true (test re-evaluated)
do[n; s1; ...]                   / run statements n times
```

Prefer **array operations over loops** — that's the whole point of k. Reach for a loop only for genuinely iterative state (union-find, fixed-point, simulation). For iterate-to-convergence, `b f/x` (while-over) and `n f/x` (do-n) are idiomatic: `{~x=p x}{p x}/i` chases a pointer chain.

**Seeded fold/scan — carry state without a loop or globals.** This is the idiomatic alternative to a `while` with mutation, and the bracket form matters:

```
f/[x;y]            / 2-arg = EACH-RIGHT, not a fold (common surprise)
f/[acc;list;c]     / 3-arg = seeded OVER: f has valence 3, gets (acc;item;c)
f\[acc;list;c]     / 3-arg = seeded SCAN: same, but keeps every intermediate acc
```
The accumulator `acc` is threaded as **f's return value** each step; `c` is a constant passed every call (use `nul` if unused) — but if `c` is a **vector matching the list's length it zips per-item** (`g/[acc;xs;ys]` calls `g[acc;xs i;ys i]`, a feature for folding aligned vectors). A list-of-pairs items argument passes each pair whole, as you'd hope. Note the seeded **scan includes the seed** as its first output item (result length = 1+#list). Thread a tuple as the accumulator to carry several things at once, and have a scan *emit per step*:

```
/ thread (survivors; collected) through k=2,3,4,5 in one fold (no repeated blocks):
step:{[st;k;z] v:st 0; bad:st 1; i:&pred[k]'v; (v di i; bad,v i)}
r:step/[(items;()); 2 3 4 5; nul]      / r 0 survivors, r 1 collected

/ a scan whose accumulator IS the per-step output, recovering state from its tail:
{z; e:*|x; 1_(e+!1+y)!100}\[50; deltas; nul]   / dial position threaded via *|x (last)
```

**gk has real closures** — an inner lambda *reads* the enclosing function's locals, and a returned lambda captures them (mutable): `u:{c:x;{c*x}}; v:u 3; v 4` → `12` (see ref.md "Closures"). So you rarely need globals just to get data *into* a helper. You still need `::` when a helper must *mutate* state shared across separate top-level functions:

```
p:!n
find:{while[~x=p x; x:p x]; x}          / global p, local x
uni:{[a;b] ra:find a; rb:find b; if[~ra=rb; p[ra]::rb]}
```

## Worked example (verified): AoC-style "Playground" (union-find)

Problem: each input line is `X,Y,Z`. Sort all pairs of points by squared distance; process them in that order with union-find. **Part 1:** after the 10 shortest connections, multiply the sizes of the 3 largest circuits. **Part 2:** keep connecting until everything is one circuit; multiply the X-coords of the pair whose connection completes it. (Verified outputs on the 20-point example: `40` and `25272`.)

```
m:.'0:"input.txt"                        / N×3 matrix of coords
n:#m
ij:,/{[i] i ,/ i+1+!(n-1)-i}'!n-1        / all i<j pairs.  (n-1)-i parenthesized!
D:{+/(m[x 0]-m[x 1])^2}'ij               / squared distance per pair
sij:ij@<D                                / pairs sorted by distance

p:!n                                     / union-find parent (global)
find:{while[~x=p x; x:p x]; x}

/ part 1
r:{ra:find x 0; rb:find x 1; if[~ra=rb; p[ra]::rb]}'10#sij
sz:{#x}'=find'!n                         / circuit sizes = group sizes of roots
"part1:"
*/3#sz@>sz                               / product of 3 largest

/ part 2
p:!n
nc:n
ans:0
i:0
step:{[e] ra:find e 0; rb:find e 1; if[~ra=rb; p[ra]::rb; nc::nc-1; if[nc=1; ans::(m[e 0]@0)*(m[e 1]@0)]]}
while[nc>1; step sij i; i:i+1]
"part2:"
ans
\\
```

Things this example demonstrates that bite people: `(n-1)-i` grouping, `~ra=rb` for not-equal, `::` to mutate `p`/`nc`/`ans` from inside a function, `if[...]` for multi-statement branches, `=v` then `{#x}'` for group sizes, `@<D` to sort by a computed key, `m[e 0]@0` to pull a column.

## Worked example (verified): loop-free array style — "Safe dial"

A second example showing the *idiomatic* style: no explicit loop, just scan + vectorized arithmetic. Each input line is a rotation like `L68` / `R48` on a 0–99 dial that wraps; it starts at 50. **Part 1:** count how many rotations leave the dial resting on 0. **Part 2:** count every individual click (including mid-rotation) that lands on 0 — e.g. `R1000` from 50 passes 0 ten times. (Verified on the example: `3` and `6`.)

The key trick: track the **unwrapped** absolute position (running sum of signed deltas). The dial reads 0 exactly when the absolute position is a multiple of 100, so a rotation from `b` to `t` lands on 0 some number of times = the count of 100-multiples in the half-open click range, which is a difference of floor-divisions.

```
L:0:"input.txt"
mags:0$'1_'L                 / drop the L/R, parse the digits of each line
signs:-1+2*"R"=*'L           / first char: R -> +1, L -> -1
deltas:signs*mags
A:50++\deltas                / absolute (unwrapped) position after each rotation
"part1:"
+/0=A!100                    / rests on 0  <=>  abs position is a multiple of 100

b:50,-1_A                    / before-position of each rotation (prepend start 50)
f:{$[y>x; (_y%100)-_x%100; (_((x-1)%100))-_((y-1)%100)]}   / #100-multiples crossed
"part2:"
+/f'[b;A]
\\
```

Demonstrates: `*'L` / `1_'L` / `0$'…` to parse a list of strings columnwise, building `signs` with arithmetic instead of a branch, cumulative sum `+\`, modulo `!` (C-style: a multiple of 100 gives 0 even when negative), floor-division `_x%y`, and each-pair `f'[b;A]` to fold two aligned vectors — all with **no loop**. Reach for the union-find style only when state genuinely has to mutate step by step.

## Workflow for solving a problem in gk

1. **Save the input** to a file; read with `0:`. Parse with `.'L` (adjust for delimiters).
2. **Build incrementally.** Add one expression, run `./gk -q s.k`, confirm the printed intermediate, then add the next. Leave bare expressions in to print until the logic is right, then assign to silence them.
3. **Think in arrays first.** Before writing a loop, check `t/kidioms` for the array idiom (grouping, scan, grade, where, reshape). `grep -ni '<keyword>' t/kidioms`.
4. **On an error**, read the caret line: it shows exactly which subexpression failed. Most early errors are precedence (missing parens) or a wrong-valence verb. Reproduce the failing subexpression alone.
5. **Verify on the sample** (puzzles always give a small example with a known answer) before running the full input.

## Common pitfalls recap

- Forgetting right-to-left → wrap with parens.
- `<>`/`!=`/`&&` don't exist → `~a=b`, `&`, `|`.
- `_` in a name → use letters/digits.
- A noisy script → assign intermediates once they're confirmed.
- Negate vs negative literal → space: `- v`.
- Mutating a global from a function → `::`, not `:`.
- Off-by-one in `!n` vs `!(n+1)`; `a?x` returns `#a` (not -1) when not found.
- **Don't name a variable after a builtin** (`ss`, `in`, `dot`, `mul`, `rot`, `draw`, `sqr`, `abs`, `ep`, `lt`, `vs`, `sv`, `bd`, `val`, `ci`, `dv`, `bin`, `lin`, …) — the name is lexed as the builtin verb. Assigning to one (`draw:2`) raises a clear `reserved error`; but in *call position* it silently invokes the builtin (a baffling `type`/valence error). Check the builtins list in `doc/ref.md` if unsure (`key`, `where` etc. are NOT builtins and assign fine).
- `f/[x;y]` is each-right, **not** a seeded fold → use the 3-arg `f/[acc;list;c]`.
- **A `}` alone on its own line makes the function return `nul`** — a newline is a statement separator inside `{}`, so a trailing line before `}` is an empty final statement. Keep `}` on the same line as the last expression: `…; r}` not `…; r⏎}`. (Intended behavior, but a silent, very hard-to-spot bug.)
- **Applying a function to an each-result: parenthesize the argument** — `f(g'x)`. `f g'x` does **not** compose: a named function is a *noun*, so `g'` sits between two nouns and parses as the dyadic each `g'[f;x]` (`f` becomes the left arg → valence error when `g` is monadic). This is standard K. (gk *does* leniently compose when the inner verb is a **builtin**, e.g. `add sqr'3 4 5`→`10 17 26`, but don't rely on it.) Always write `f(g'x)` or bind it: `t:g'x; f t`. Same for chained eaches: `f'(g'x)`.
- **Never name a global `x`, `y`, or `z`** — a lambda that references the global `z` (say a zero row for padding) silently gains valence 3 (implicit params), and calling it monadically is a baffling `valence error`. Rename the global.
- **`a!x` with a list right operand is ROTATE, not vectorized mod**: `12!1 2 3 4 6` rotates the list. Mod is atom-right (`A!100`) — for "atom mod each" use `a!'v`. Flip side: `1!v` is a handy rotate-by-1 for cyclic neighbor pairs (`(v;1!v)`).
- **Applying a named function to a monadic-verb result needs `@` or parens**: `f ?x` parses `?` as dyadic deal with `f` as left arg; `f ,x` is join; `f -x` is minus. Write `f@?x` / `f@,x` / `f(,x)`. (Same family as the `f(g'x)` composition pitfall.) **This `@` trick is for NAMED functions only** — with a builtin verb on the left the `@` goes monadic (atom test): `abs@-5` is `abs(@-5)` → `1`, a silently wrong answer; `ic@"A"` type-errors. (By design — the parser knows builtins' valence.) With builtins parenthesize the argument instead: `abs(-5)`, `ic(*L)`.
- **Adverbed named verbs mid-expression**: `+/,/step/m` valence-errors (`step/` grabs `,/` as a left argument). Bind the converge result first: `r:step/m; +/,/r`.
- **No broadcast of a vector across matrix rows**: `m-v` (n×3 matrix minus 3-vector) is a `length` error. Broadcast with each-left: `m-\v`. (`x f\y` = each-left, `x f/y` = each-right; an *atom* does broadcast without help.)
- **Indexing a vector by each of several index-vectors**: `{v x}'gs`, not `v@'gs` — `@'` is each-*both* (pairs `v` with `gs` elementwise → `length` error). Same trap as the composition one: `f'({g x}'y)` needs its parens.
- **Every dyad evaluates BOTH operands (right one first) — `&`/`|` are not short-circuit.** A "guarded" test like `(0<#x)&(x 0)=":"` still indexes empty `x` and dies. Guard with cond: `$[0<#x;(x 0)=":";0]`.
- `ic`/`ci` (char↔int) are builtins — `ci` is a very tempting variable name ("column index") and assigning it is a `reserved error`.
- Indexed **global** assign works with vector indices, including into matrices: `p[ra]::rb`, `A[i;js]::1j`.
- **Two index vectors are a CROSS PRODUCT, not pairwise scatter**: `.[m;(I;J);:;v]` (and `m[I;J]`) hits every (i,j) combination. To read/write a SET of points, flatten: `@[(h*w)#0;X+w*Y;:;v]`, then `(h,w)#` back. Also `m[!0;J]` (empty row-index + column spec) is an `index error` — guard the empty case.
- **Reshape with computed dims needs `,`**: `(W,W)#x` — `W W#x` is a `type error` (juxtaposition builds vectors from literals only, `3 3#x` is fine).
- **Comment-only lines inside a multi-line lambda** (incl. a comment right after the param list on the opening line) break direct calls `f[x;y]` in gk releases up to v3.0.0 — the call silently yields nothing, and a script aborts load (`load: f.k ... + N`, rc=0). Fixed upstream; until your gk has the fix, keep comments on their own top-level lines or after body code.
- **`in` is whole-value membership too, not elementwise**: `1 2 in 2 3 4` → `0` (the vector is looked up as one item, like `?`). Elementwise membership is **`lin`**: `1 2 lin 2 3 4` → `0 1`.
- **`.name` lexes as one namespace token**: `.b 1` is NOT `.`(eval) applied to `b 1` — it's the name `.b` (value error). Parenthesize: `.(b 1)`.
- **`()` is not an atom** — it doesn't broadcast in each-both: `(),'1 2 3` is a `length` error (a genuine atom left arg would recycle).
- **One-char strings are char ATOMS**: `("A";"R")` collapses to the string `"AR"`, so whole-string lookups against that "list" silently miss. Build a real list of 1-char strings with enlist: `((,"A");,"R")`.
- **`-` fuses into a following numeric cast literal**: `-0j$x` lexes as the literal `-0j` (which is just `0j`) then cast — the negation is silently lost. Write `-(0j$x)` or `0j-0j$x`. (The negative-literal trap in cast clothing.)
- **`_` floor and float mod are EXACT — comparison tolerance applies to `=`/`<`/`>`/`~` only**: `2=1.9999999999999`→1 but `_1.9999999999999`→1 and `1.8!0.2`→~0.2 (exact — same answers as Python/C). So `_100*0.29`→28: the classic float-floor gotcha applies; round with `_0.5+x` when you mean nearest. (gk ≤v3.0.0 releases floored tolerantly AND corrupted i64-range floats: `_1e14+7.0`→1e14+8 there.) Parse big integers from strings with `0j$'`; never route them through floats. (Relatedly, `0j$12.0` is width-FORMAT of a number → `""` — numeric `$`-casts take strings only.)
- **`a?x` (dyadic find) looks up the *whole* right value as one item** — `1 2?2 2`→`2` (not found, `#a`); `(1 1;2 2;3 3)?2 2`→`1` (whole-vector match). This matches the reference, it is **not** element-wise. For "first index of each distinct" / de-dup, use group: `*'=v` = first-occurrence index per distinct value, `?v` = the distinct values, `{#x}'=v` = the counts.
