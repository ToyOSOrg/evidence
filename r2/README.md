# PR #1065, round 2: review r1 fixes at d99ef5a35

| check | exit | log |
|---|---|---|
| `cargo run -- --ci host` at d99ef5a35 | 0, 103 steps green | logs/ci-host-3.log |
| Linux musl build of osbench and osbench-peer | 0; bytes identical to c3b124b3f's (no Linux-side source changed) | logs/build-linux-d99ef5a35.log |
| metal staging of `osbench_lan osbench_internet`, four times | 2 = staged, nothing run; list bound 335 s, boot deadline 670 s | logs/metal-stage-net-1.log |

Negative controls, each a checked patch applied, `cargo test -p osbench-compare`, restored:
- m4: every unit judged (unknown direction as lower-is-better): red (exit 101), the `mW` case.
- m5: no least-p gate: red (exit 101), the 4-against-3 case.
- m6: range over a median of 0: red (exit 101).

Round 1's QEMU smoke still stands: internet.rs is unchanged since; the only guest-side edit is ToyOS's
link description gaining its leading `wired`.
