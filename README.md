# Advent of Code in gk

Advent of Code solutions in gk.  
[https://github.com/cmh25/gk](https://github.com/cmh25/gk)

[2025](2025/) [notes](2025/README.md)  
[2024](2024/) [notes](2024/README.md)  
[2023](2023/) [notes](2023/README.md)  
[2022](2022/) [notes](2022/README.md)  
[2021](2021/) [notes](2021/README.md)  
[2020](2020/) [notes](2020/README.md)  
[2019](2019/) [notes](2019/README.md)  
[2018](2018/) [notes](2018/README.md)  
[2017](2017/) [notes](2017/README.md)  
[2016](2016/) [notes](2016/README.md)  
[2015](2015/) [notes](2015/README.md)  

> **Authorship note:** these solutions were written by **Claude Fable 5** and
> **Claude Opus 4.8** (Anthropic's Claude, driven via Claude Code) — not by me.
> I posed the problems, supplied the interpreter and inputs, and reviewed the
> results; Claude wrote, debugged, and verified all the code here, including
> the day-by-day notes in each year's README.

## Layout

```
2025/
  NN.txt  puzzle text  (not committed -- see below)
  NN.in   puzzle input (not committed -- see below)
  gk/     NN.k + run.sh
```

Each `NN.k` is completely self-contained and reads its input as `../NN.in`.
The `gk/` directory has a `run.sh` that runs the whole suite; see the year
READMEs for the exact invocations.

`check.sh` diffs every year's suite output against a golden copy
(`<year>/answers.out`, not committed — derived from the inputs), which
makes the whole repo a regression test for gk itself:

```
GK=/path/to/gk ./check.sh          # all years; nonzero exit on any diff
GK=/path/to/gk ./check.sh -b 2022  # bless: (re)generate a year's golden
```

A diff means gk regressed — or changed intentionally; re-bless after
verifying the new answers.

## Puzzle texts and inputs

Per the [Advent of Code FAQ](https://adventofcode.com/about), puzzle text
and inputs are not redistributable, so this repo does not include them.
To run the solutions, log in at adventofcode.com and save your own copies:
the day-N input goes to `<year>/NN.in` (e.g. 2025 day 1 → `2025/01.in`).
Answers are input-specific, so yours will differ from mine.
