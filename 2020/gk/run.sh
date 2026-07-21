#!/bin/sh
# run all AoC 2020 gk solutions; export GK=/path/to/gk if not on PATH
# (on a script error gk opens its debug subconsole -- intentional, debug right there)
BIN="${GK:-$(command -v gk || true)}"
[ -n "$BIN" ] || { echo "gk not found: export GK=/path/to/gk (or: GK=/path/to/gk $0)" >&2; exit 1; }
cd "$(dirname "$0")"
for d in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25; do
  echo "== day $d =="
  "$BIN" -q $d.k
done
