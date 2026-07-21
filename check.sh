#!/bin/sh
# regression-check the gk suites against golden answers (YYYY/answers.out)
# usage: GK=/path/to/gk ./check.sh [-b] [year ...]     default: every 20?? year
#   -b  bless: (re)generate the goldens from this run instead of checking
# goldens are derived from the private inputs, so they are gitignored like *.in
cd "$(dirname "$0")" || exit 1
bless=0
[ "${1:-}" = "-b" ] && { bless=1; shift; }
[ $# -gt 0 ] && years="$*" || years=$(ls -d 20?? 2>/dev/null)
fail=0
for y in $years; do
  g=$y/answers.out
  if [ $bless = 1 ]; then
    if $y/gk/run.sh >"$g" 2>&1 </dev/null; then echo "$y: blessed $g"
    else echo "$y: run.sh FAILED"; fail=1; fi
  else
    [ -f "$g" ] || { echo "$y: no golden -- bless first: ./check.sh -b $y"; fail=1; continue; }
    t=$(mktemp) || exit 1
    $y/gk/run.sh >"$t" 2>&1 </dev/null   # /dev/null so an error subconsole exits instead of hanging
    if cmp -s "$g" "$t"; then echo "$y: ok"
    else echo "$y: ANSWERS CHANGED"; diff -u "$g" "$t" | head -40; fail=1; fi
    rm -f "$t"
  fi
done
exit $fail
