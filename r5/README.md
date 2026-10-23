# The backing-memory stack, round 5

Heads: #1003 `7125a0eb3` (unchanged), #1008 `b4fac47ba`, #1010 `5bb1b9dd1`, all on `main` 35e930136. Paths are masked.

| file | command | revision | exit |
|---|---|---|---|
| t14/judge-h.log.gz | the T14 judge of round 4's staged boots: 266 passed and 10 failed. The reds are the three amdvi rows, `klogd_hosted` (the AMD row's deliberate DMA fault), `i219_messages_on_its_msi_vector` ("the MAC saw 0 frame(s)" on the wire) and main's five | `53049d55c` | 1 |
| t14/judge-z.log.gz | the base's osbench | `35e930136` | 0 |
| t14/osbench-head.txt, t14/osbench-base.txt | osbench p50 by row | | |
| h10-host.log | `cargo run -- --ci host` | `5bb1b9dd1` | 0 |
| h10-guest.log | `spawn_from_tmp` ×3, which now overwrites in place, cuts and deletes | `5bb1b9dd1` | 0 |
| h10-testkernel.log | `tlb_shootdown_waits` ×3 on the test kernel, where the reach count is now gated | `5bb1b9dd1` | 0 |
| controls/tmp-live-source-r4.* | `spawn_from_tmp` with the source reading the file live: the child ends with a memory fault | `5bb1b9dd1` | 1 |

Round 5 changes only the following, so round 4's other checks at `53049d55c` still hold:

- `spawn_from_tmp`;
- `Usage::reached`, behind `test-actuators`;
- a comment in `idt/mod.rs`;
- two issue records and one rename.
