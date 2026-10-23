# ToyOS #1038, round 1: DOITM on every CPU that enumerates it

Branch `doitm-always-on`. OFF = 6ebf7fb285f737b0ed4fac21338e8d1af337740b (origin/main 89f92a4bd plus a build fix for
tests/guest/rust-tests). ON = c4769c24dcba3945a0213914db6d2c45952bee14 (OFF plus DOITM). The host is an Apple Silicon Mac.
Paths are masked to $HOME.

## host/
- `ci-host.log`: `cargo run -- --ci host` at ON. Exit 0, "Host: 101 step(s), all green".
- `checks-verdict.log`: `cargo test --test toyos-checks -- control_regs_verdict` at ON. Exit 0.
- `mutation-judge.patch` and `mutation-judge.log`: the negative control. It drops the judge's T14 DOITM rule,
  then reruns the same check. Exit 101, "the T14 without DOITM was accepted". The patch was applied, built and
  restored in the same run.
- `qemu-console.log`: `cargo test --test toyos-build -- --nocapture console_image_boots` at ON, an x86-64 guest
  under TCG (`qemu64`, which enumerates no IA32_ARCH_CAPABILITIES). Exit 0. The kernel says
  "control_regs: no CPU enumerates DOITM (IA32_ARCH_CAPABILITIES[12])", then "2 of 2 cpus hold".

## staging/
- `stage-off.log`: `cargo test --test toyos-build -- --metal --metal-readback <off> osbench` at OFF.
- `stage-on.log`: `... --metal-readback <on> osbench control_regs` at ON.
- Both exit 2, which is the harness's "staged, nothing judged". No machine was touched.
- `request.txt`: the boots requested.
- Image sha256: OFF benchcase 9327af8df3318b82102cc54adefddef698808f0a85f6b46a99dbf127f35f4c6b.
  ON benchcase 510355fccb45c310341d66a240bc675352fe2c75fec25b24fe3ffce9842fdb17.

## probe/
These are extracts of the crypto track's earlier T14 and AMD boots, with no other lines included.
- (a) `t14-a-asis` and `amd-a-asis`: the curves timing image at a.rev (9217793d2), DOITM off.
- (b) `t14-b-doitm`: the probe 380e63bbd on 9217793d2, which never landed. It sets DOITM on every CPU, and
  all 8 log uarch_misc_ctl=0x1. After the timing job, the boot runs the crypto parity table.
- (c) `t14-c-cost-off`: the same parity table at 9217793d2 with DOITM off.
- `cost.txt`: toyos-crypto's own time per row, (b)/(c): 78 rows, geomean 1.0046, max 1.0390
  (chacha20-poly1305/reject/0), min 0.9918. Computed here from the two parity extracts.
  The two boots ran different images and job lists, so this is not a controlled pair.
