# PR 1058, round 2: T14 A/B and review r1 fixes

T14 boots run by the orchestrator, base 05873236d against head 53f73a63c, benchcase and
testcases images staged with
`cargo test --test toyos-build -- --metal --metal-readback <dir> osbench spawn_cost`.
All four boots rc=0; the judges pass on both sides, "2 passed, 0 failed, 2 boot(s)"
(t14-*-judge.log). The machine's vendor, model and BIOS strings are masked.

| row (p50) | base | head |
|---|---|---|
| process.spawn_wait (std Command of osbench nop) | 6.494 ms | 0.551 ms |
| proc.posix_spawn_wait.std | 6.506 ms | 0.515 ms |
| proc.spawn_wait.tiny | 54.6 µs | 54.8 µs |
| proc.spawn_wait.large | 228.6 µs | 229.0 µs |
| spawn_cost (/system/bin/toybox, median of 50) | 4333 µs | 363 µs |

That testcases image carried spawn_cost's 10 jobs only, no shared members.

Review r1 fixes at head 4ce692580: `cargo run -- --ci host` exit 0, 103 steps green
(ci-host-tail-4ce692580.log). The whole head testcases shared boot (242 jobs, with
abuse_shared_grant's shm_sub arm and the dlopen members) is staged for the T14.
