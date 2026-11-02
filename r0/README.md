# PR #1150 evidence, round 0

Base main 058bea2d3, head 42e2716c3 (host-3, pure-3, surplus-red, abbench2) and 0d7a6ecfc
(suite-1, members-2, reds-1, abvirt, absess: the head before its one-line surplus fix).
- host-3.log: `cargo run -- --ci host`, rc=0, 109 steps.
- pure-3.log, surplus-red.log, control-N*.log: the host model, the surplus regression red then fixed, controls.
- control-G1*: the gate's guest control (getcwd copying under the process lock).
- members-2*: every Rust member and the C corpus via --debug.
- suite-1, reds-1, abvirt, absess, dbg-virt-1, base-virt-1: the QEMU suite and the investigation of its reds.
- abbench*: QEMU osbench system/ipc/files A/B (order only).
- rules.md, image-sha256.txt, metal-request.txt: the staged metal A/B.
