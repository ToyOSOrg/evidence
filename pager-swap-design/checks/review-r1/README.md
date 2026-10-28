# #1088 review r1: host checks at `0071d03bc` (merged with main `5870531b2`)

| file | command | exit |
|---|---|---|
| `ci-host-r2.log.gz` | `cargo run -- --ci host`, before the commit, on the same files | 1 |
| `crypto-alone.log.gz` | `cargo test -p toyos-crypto`, one of the red steps, run on its own | 0 |
| `ci-host-r3.log.gz` | `cargo run -- --ci host` at `0071d03bc` | 0, 104 steps green |

**The red run.** Its four red steps failed on build artefacts that vanished from `target/debug/deps` while they
built ("extern location … does not exist", "failed to open object file"). No test failed, and the change is
Markdown only. One of the red steps passes on its own, and the full run at the commit is green. What removed the
artefacts was not identified.
