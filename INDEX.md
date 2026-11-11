# pr-1261: a poll belongs to the handle it was made through, and a ring to its one submitter

Revision: the checks ran at f79df9574 plus the change's tree (logs/summary.txt names each run's diff hash), which is commit dd1d57622. Host: arm64 macOS. mio: ToyOSOrg/mio `toyos` at 4108eff, pinned in Cargo.lock.

## host/ (targeted checks, the owner's policy)
- `summary.txt` lists every command and its exit code; each `<name>.log` holds the full output and ends with `exit N`. `checks-b.sh` is the script.
- `pure`: the kernel's host library, including `sched::poll`'s new tests and `watch_list`'s `end_rings` test.
- `loom-compiles` and `loom`: every kernel-loom test target compiles; `loom_watch`, `inbox_answer` and `poll_once` pass.
- `ctl-*`: each negative control whose model this change touches, run as build/ci.rs runs it. A control must exit non-zero, with the named test red for the reason its row says.
- `build-system`: toyos-build's tests, which read build/ci.rs's control table against the manifests and the source gates.
- `clippy-*`: CI's shapes for the kernel (host library, x86-64 default, and x86-64 with boot and test actuators), the touched host members, the SDK and the ABI.
- `build-only`: `cargo run -- --build-only`, which compiles the kernel, std, libc, mio at 4108eff, every guest binary and the image.
- Run 3 (`host/run-3/`) ran every step. Run 4 (`host/run-4/`) reran what edits after run 3 could change: the close-racing-a-post model, now over two watches (under run 3 it did not red under `poll-fire-load-store`, because one watch's list lock already serializes a post and a close); redundant clones clippy named; and the pure tests' ring counter, an `Arc` clippy named. In run 4, `poll-fire-load-store` reds all four named `loom_watch` tests.
- `build-system` in run 3 exits 101 on one test, `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, which is `issues/the-llvm-environment-test-breaks-git-on-macos.md`. Run 4's `llvm-env-on-pr-a-tree` shows the same red on PR #1239's tree, which carries none of this change's build edits. The other 383 tests pass.

## metal/
- `stage.log`: `cargo test --test toyos-build -- --metal --metal-readback <dir> boot:testcases boot:shared-debug mask_windows` at dd1d57622. It exits 2, the harness's word for staged with the machine untouched: 4 images, 47 registrations and 245 shared members. It compiles every guest binary, `poll_belongs_to_its_handle` and `ring_park_herd` among them, and mio at 4108eff.
- `request.txt`: the boots requested (shared-debug, testcases, testcases-watchdog, windowscase).

## r1/ (review round 1, head f897ae424)
- Correction: the first staging (`metal/stage.log`, dd1d57622) compiled mio at **fe42def**, not 4108eff. `tests/guest/rust-tests` keeps its own lockfile, which still pinned fe42def, so the INDEX line above claiming 4108eff was false. f897ae424 pins 4108eff there too. The first lock check's log came out empty, because its stdout went nowhere and it wrote no stderr, so it is removed; `r2/lock-check-rust-tests.log` is the check rerun with its exit recorded.
- `stage-head.log`: `--metal --metal-readback <dir> boot:testcases boot:shared-debug mask_windows osbench` at f897ae424, exit 2 (staged, 6 images). `mio-a8e64fdb4dc81efd.d` is the dep-info that build wrote at 19:43:08 local time, after the commit. It lists `checkouts/mio-c4440d7c13afb477/4108eff/src/sys/toyos/selector.rs`. `mio_waker_coalesces` was relinked at 19:43:10.
- `stage-base.log`: the same `osbench` staging at f79df9574, head's parent, exit 2. Its benchcase config (`system-dc6cb9c143cd50db.toml`) is the head's.
- `t14-request.txt`: the round's request. It has head's testcases, testcases-watchdog, shared-debug and windowscase, then the A/B benchcase boots in the order B, H, H, B, with the rule stated before measuring. `request-*-staged.txt` are the two stagings' own lists.

## r2/ (review round 2, branch head 8e8b85256)
- The branch is rebased onto main 45935f4b9, keeping main's deletion of `issues/parallel-tests-red-under-other-suites.md`, and it carries one record edit. `git range-diff` shows the main commit unchanged and round 1 changed only by that deleted record. No code changed, so the images staged at f897ae424 (r1/) stand.
- `lock-check-rust-tests.log`: `cargo metadata --locked` in `tests/guest/rust-tests` at 8e8b85256, exit 0. It resolves mio from `ToyOSOrg/mio?branch=toyos#4108eff…`, manifest `git/checkouts/mio-c4440d7c13afb477/4108eff/Cargo.toml`.
- `t14-request.txt`: the request with the A/B rule restated before any boot ran. The four boots are a screen; candidates get a second B, H, H, B round; a row is slower only if all 4 head p50s lie above all 4 base p50s; each row is reported as a ratio beside both sides' ranges. It is evidence, not a landing condition.
