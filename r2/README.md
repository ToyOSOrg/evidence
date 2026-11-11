# ToyOS #1234, round 2: review r1 answered

Branch `fd-hold-without-lock` at 35d452b2a4310fcb8b9666983318582e73f927c7 (on d8f9a490b, base 34cb4c918). Paths are masked as in `r1/`.

- `host-35d452b2a/`: the targeted host checks at that commit (`host.sh` ran them; `rev.txt` names the revision, and the tree was clean). Each log starts with its command and ends with `exit <code>`.
  - `sdk-fd.log`: `cargo test -p toyos --lib fd::`, exit 0, 15 passed (10 unit, 5 loom).
  - `control-*.log`: the four negative controls as `build/ci.rs`'s `run_control` issues them, each exit 101 with every named case `FAILED`. `fd-reuse-relaxed` is new this round.
  - `build-controls.log`: `cargo test -p toyos-build --lib -- every_model_control_is_run ci::`, exit 0, 21 passed.
  - `clippy-*.log`: the `toyos` clippy shapes, the third with all four controls on, each exit 0 with no warning.
- `disasm/`: the descriptor calls' machine code at d8f9a490b, at 35d452b2a and with S3 (`disasm/README.md`, `disasm/summary.txt`). At 35d452b2a every descriptor function is byte-identical to d8f9a490b.
- `s3-settle-tailcall.patch`: S3 as it would land, on 35d452b2a. It is not on the branch.
  - `host-s3-patch/`: the same checks with the patch applied (`tree.diff` is the patch), all green and each control red, with 16 tests passing.
  - `s3-shape1-settle-closure.patch` and `s3-shape4-unsettled-fault-on-shape1.patch` are two other shapes tried. Each changed the hot closure more.
