# PR 1055, round 2: T14 readbacks

Benchcase kernel logs (paths masked), base `b48c7dd9d` and head `a75abd3f6`, one boot each. The `-prof` boots carry `../r1/patches/faultprof.patch`. Their `faultprof:` lines sum over every fault in each window of 2^16 faults, whatever program took it.

`compare-base-head.txt` is `compare.py base -- head`: the median p50 ratio per row, where above 1 is slower at head.
