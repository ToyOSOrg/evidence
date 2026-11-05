# pr-1150 r19: AMD round 10 judged (rules: r18/ab10/rules.md)

The orchestrator ran twelve boots in the stated order, each passed, with hashes verified.
`judgement.txt` is `judge10.py`'s output: every hot row passes. The worst is
`pipe.throughput.1024` at 3 of 6 pairs worse and a mean of +0.31%; `pipe.throughput.256` is 2 of 6
worse with a mean of +1.18%. `mem.anon.map` is reported at -31.7% but is bimodal in both arms in every
round (about 200 or about 380 ns/MiB). `pingpong.futex.cross_core` is bimodal the same way.
`proc.spawn_wait.large` is -9.4%, recorded in its issue.
