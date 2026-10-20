# PR 952 evidence: kernel-loom per-test vacuity witnesses

Host: macOS arm64 laptop, 14 cores. Base c0b154791 (before), fix 90d06b647 (after; the later merge of main 0e6716fc0 touches no kernel/loom file).

- `ci/merge-queue-38719410357-tlb_shootdown.txt`: the CI failure (`an_acknowledged_flush_postdates_the_page_table_write`, "no interleaving completed the wait").
- `before/plain-*`, `after/plain-*`: `cargo test -q -p kernel-loom --test <file> -- --test-threads=8`, 100 runs each, per-run exit codes (`loop.sh`).
- `before/binary-t4-*`: the test binary run directly, `--test-threads=4`, 12 or 40 concurrent instances (`batch.sh`).
- `before/instrumented-*` (`instrumentation.patch`, reverted after): ack/reset timestamps, showing the single-initiator models' last ack lands within ~8 ms of start while the five resets run in the first 7 ms - the window is narrow on this host.
- `*/amplified-50.txt` (`amplify.py`, `amplified-run.sh`, diffs alongside): a 50 ms sleep before each final vacuity check and a 10 ms late start for smp_bringup's second model, widening the window without changing logic; applied, built, run, restored in one run.
- `ci/ci-host.log`: `cargo run -- --ci host` on the merged head 64e6e404e, exit 1; the one red is `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, deterministic on this host and independent of the change (`ci/llvm-env-test.log`).
