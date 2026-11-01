# PR #1134 r2: rebased onto #1132's review r1 fixes, at display-stage3 f256164ab

- `ci-host.log`: `cargo run -- --ci host` at f256164ab, exit 0, 107 steps green.
- `ci-host-red-suite-split.log`: the run before it, at 0d8fa57c1, exit 1. `suite_split` refused `tone_after_dc6` for not being in `RUST_SKIP`, and f256164ab adds it. That log's loom failures are its negative controls reaching their verdicts.
- `build-only.log`: `cargo run -- --build-only`, exit 0. It ran on the tree before the commit, whose later edits are test-harness only (the judge, `RUST_SKIP`, the job and `metalcase.toml`).
- `metal-readback.log`: the `display_output_presents` metalcase image staged, with 2 jobs (`tone_after_dc6` and the ps2server hold). Image sha256 5c5332507551cc9a…. Exit 2 is the harness's staged-not-run status.
- r1's unit tests, controls and QEMU smoke still apply: the rebase changed none of the protocol, compositor or interrupt code.

Paths are masked.
