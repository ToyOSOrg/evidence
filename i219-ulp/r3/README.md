# PR #1091 r3: head 2fb6b8c60dea3f30bf28dc6db115d31130b3dcd9

- The T14 boot at `a6ae98b35` (readback by the orchestrator) has a boot verdict of `passed` (old-boot-verdict.txt). Judged offline with `--metal-readback` at `a6ae98b35`, the row is **red** (old-readback-judged-at-a6ae98b35.log): neither ULP line reached the log. old-boot-kernel-excerpt.txt shows why: the job list was empty, so `reboot` ran at 12.759 s, 1 ms after netstack's first lines, while the driver was still mid-wake.
- Fix: the row runs `test_rs_netstack_answers`, one UDP bind. It is answered only after netstack's card bring-up. The judge requires that job to pass.
- Control: the old readback judged at head is still red (old-readback-judged-at-head.log), now on the missing job.
- `cargo run -- --ci host` at head: exit 0 (host-ci.log). Restage: exit 2, Staged (t14-prepare.log, request.txt).
- linux-wol-before.txt: the bench Linux's `Wake-on: g`, recorded by the orchestrator before that boot.
