# pr-1102: tcp: HyStart++ in the initial slow start, and a card-held window half in flight is in use

r1/d1ea41856/  The ramp diagnostic that found the cause (T14, osbench_lan, 2026-10-28). Order: Linux L1, a1 b1 a2 b2, Linux L2.
  A = d1ea41856 (branch i219-tx3: main 717baf3ac + driver and ramp counters); B = A + patches/arm-b-card-full-is-window-limited.patch.
  session/t14-linux-{1,2}.{txt,err}  the T14's Linux osbench lan (L1, L2); peer: the AMD bench's Linux osbench-peer, both from
                                    linux-d1ea41856.SHA256SUMS
  toyos/<arm>.txt                   the readback's test-runner lines; <arm>.verdict.txt the boot's verdict;
                                    <arm>.judge.log the readback judged under main's harness (post-#1095), exit 0 each
r1/host/  At ToyOS 94e3ee70d (B's code; head 13d4af819 differs only in issues/ and the commit message)
  ci-host-94e3ee70d.log            cargo run -- --ci host: 105 steps, all green, EXIT=0
  ci-host-71aacb24f-red-clippy.log the run before it, red on one clippy finding in new code (fixed in 94e3ee70d)
  controls/summary.txt             twelve negative controls: each patch applied, `cargo test --no-fail-fast` in
                                   system/netstack/shard/tcp, reverted; exit and the failing tests per control
Paths are masked as <worktree>, <primary>, <scratch>, <home>.
