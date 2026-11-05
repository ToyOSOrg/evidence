# pr-1150 r17: AMD round 9 judged (rules: r16/ab9/rules.md)

- `judge-amd-plain-pairs.txt`: the plain boots (1-base 2-head 3-head 4-base), by round 8's rule.
  Every AMD hot row moved better in both pairs; `pipe.throughput.256` +0.4% and +3.5%.
- `pipeprobe-per-class.txt`: the probe boots (5-pbase 6-phead 7-phead 8-pbase), per size class.
  - Head carries two more timed pieces per write-read pair than base, each costing two clock reads,
    so the probe arms' throughput is not comparable. Their per-piece breakdown is.
  - In the 256 class, head's extra per write-read pair is 339 ns (pair A) and 223 ns (pair B). The
    bounce copies (69 ns in, 69 ns out) are the largest single piece in both: 41% and 62%. They are
    "most" in one pair only.
- `amd-*-excerpt.log`: each boot's osbench, exit, test-marker, panic and `pipeprobe:` lines.
