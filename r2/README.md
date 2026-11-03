# pr-1150 r2: small transfers bounce, at 0d0a03065 (on main a0e8f1333)

- `host-2.log.gz`: `cargo run -- --ci host` at 0d0a03065, rc=1. The one red step is the
  clippy step: `len_zero` in the new host test. It is fixed in 1321274d7, a test-only
  one-token change that leaves the kernel image unchanged.
- `host-3.log.gz`, `host-3.rev`: `cargo run -- --ci host` at 1321274d7, rc=0, 109 steps
  green. It includes the kernel's host tests, the new
  `whole_transfers_in_one_hold_keep_the_stream_and_the_claims` among them.
- `control-N6-put-ignores-wants.log.gz` and `control-N7-refused-put-keeps-claim.log.gz`:
  mutations in `mutate.py`. Each has rc=101, red on exactly the new test, and was
  reverted.
- `clippy-b-*.log.gz`: kernel binary clippy with warnings denied, rc=0 on x86_64 and
  AArch64.
- `members-2*.gz`, `members-2.rev`, `ccheck-2.log.gz`: the testcases boot under QEMU
  x86_64 via `--debug` at 0d0a03065. 230 of 238 exit 0; the other 8 need `SYS_DEBUG`, as
  in r0 and r1. The C corpus is 143 of 143. No gate panic.
- `qbench*`: the QEMU threshold sweep (`qbench.sh`, `qtable.py`) over base a0e8f1333,
  claim 19c814f63, b4096 0d0a03065 and b1024 (0d0a03065 with `BOUNCE` = 1024). It gave
  no order: host load was 13-62 (`qbench.log.gz`), and base's two rounds differ up to
  tenfold.
  - The b4096 round-2 run stalled after `ipc.reqrep.4096` at load 62. The harness
    classed it as its liveness ceiling.
  - `qstall*`: three reruns of the head at load 21-25, rc=0 each.
- `ab2-*`, `stage.sh`, `stage.log.gz`: round 2's metal, staged with `--metal-readback`
  and not run. The rules were set before any boot. Each staging run's rc=2 is the
  staging convention: it touched no machine.
