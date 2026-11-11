# Evidence for ToyOSOrg/ToyOS#1252

Local paths are masked (`<worktree>`, `<scratch>`, `<scratchpad>`, `<home>`, `<tmp>`). Each log ends with its command's exit code.

- `build/`: `cargo run -q -- --build-only` at 766eff4fb, whose tree is b7e35e7b8's (`tree-identity.txt`).
- `host-r0/`: the touched crates' host suites at b7e35e7b8 (`rev`), a clean tree.
- `mutations/`: the SDK's negative controls at 8f5cfaf65, each patch applied, the suite run, the file restored;
  `mut-connect.patch` is the kernel control staged for metal.
- `clippy-r0/`: clippy with the workspace's adopted lints and `-D warnings` on every shape that builds touched code, at 9186185dd (`rev`); `clippy.sh` and `host.sh` are the commands.
- `host-r1/`, `clippy-r1/`: the same host suites and clippy shapes again at c06d210be, the PR's head (`rev`), a clean tree.
- `guest-crates/`: every touched guest crate checked against the head's sysroot (the image build compiles none).
- `guest/run-43053472977.txt`: the first guest run's verdicts at 8f5cfaf65: 19 of 20 pass; `libc_children` red in `tty_interrupt`.
- `metal-staging/`: the staging logs (exit 2 is staged, machine untouched) and `request.txt`, the boots asked for. `-r1` logs are
  the first attempt, which the guest-test compile errors ended.

## After the rebase onto main 6d0cb3ae9
- `guest/run-43060146035.txt`: `libc_children` alone at 1fa5d42d1, no fix: green. The first run's stall was a race.
- `shell-race/`: the shell's quit model (`cargo test -p shell-copies`) at b607b0fa2: the baseline exits 0; `mut-landed.patch`
  (`Asked::landed` deciding without taking the notice, as main's shell did) reds
  `a_child_that_never_listens_ends_with_the_interrupt_in_every_order` on `[Quit, Land, Look, Heard]`, exit 101, restored.
- `build/build-only-b607b0fa2-user_str-dead.log`: the kernel refused `user_str`, left with no caller; removed in 2bbd17005.
- `build/build-only-2bbd17005.log`, `host-r4/`, `clippy-r4/`: the image, the touched crates' host suites (with `shell-copies`)
  and clippy at 2bbd17005. `clippy-r4/shell-copies.log` is the `new_without_default` finding; `shell-copies-fixed.log` and
  `host-r4/shell-copies-fixed.log` are 6aff1970d's derive, linted and tested.
- `metal-a/`: the shared boots `testcases`, `shared-debug` and `proctreecase` staged at 2bbd17005 for each bench, with each
  bench's request.

## Review round 1, rebased onto main e558cc153
- `guest/run-43075819858.txt`: the 20 rows at 2bbd17005, 20 pass.
- `build/build-only-014f2da9d.log`, `host-r5/`, `clippy-r5/`: the image at 014f2da9d, and the touched crates' host suites
  and clippy at d3643d86e (`rev`), which differs from 014f2da9d by three comments in `tests/images/`. The host-buildable
  programs (disks, diskserver, fileserver, netstack, nvme, pkg, session, soundserver, sshserver) are tested, not linted.
- `metal-a-r5/`: the shared boots staged at d3643d86e for each bench, with each bench's request; they supersede `metal-a/`.

## Review round 1, rebased onto main e10b6fd49 (head 041f1b81e; b3ac6637f adds an issue record)
- `guest/run-43082964430.txt`: `a_launch_gives_each_unsent_stdio_slot_a_null`, `session_lifecycle`, `libc_children` at
  d3643d86e, before the second rebase: 3 pass.
- `build/build-only-041f1b81e.log`, `host-r6/`, `clippy-r6/`: the image, the touched crates' host suites and clippy at
  041f1b81e. The benches are down, so no metal was staged for this head: `metal-a-r5/` is not to be run, and what is owed
  on metal is in `issues/the-kernel-is-small-interrupts-post-and-threads-wait.md`.

## The two reds at 041f1b81e, and the fix at ec556f5ce
- `guest/run-43092179151.txt`: the 20 rows at 041f1b81e, 18 pass. `kernel_objects_refused_alone` and
  `a_clean_stop_proves_its_image` are red; what each said is quoted.
- `r7/`: `cargo test -p toyos-abi`, `-p kernel --lib --features sched-check` and the kernel's and the ABI's clippy shapes at
  ec556f5ce (`summary.txt`), whose one change is that `SYS_SYSINFO` charges a roster and never the header alone.

## Review round 3, at 90ef8869e
- `r8/`: `cargo test -p toybox-copies`, `-p kernel --lib --features sched-check`, and clippy on the kernel's shapes,
  `toybox-copies` and `toyos`, at 90ef8869e (`summary.txt`). The changes: `SYS_SYSINFO` checks its thread bound after the
  header-only return, and the roster's refusal is named for both its causes in `SysCap::roster`, toybox's roster helper and
  `ps`.

## Rebased onto main 818809583, head 64eb00ee6
- `guest/run-43107173240.txt`: `kernel_objects_refused_alone`, `a_clean_stop_proves_its_image`, `session_lifecycle` at
  90ef8869e, all 3 pass.
- `r9/`: at 64eb00ee6, a clean tree (`summary.txt`, the commands in `checks9.sh`): the image; the host suites of every touched
  crate; every kernel clippy shape of `build/clippy.rs` (host, host with the kernel's controls, x86_64 default, both actuator
  sets, the instrument set, the two heap-band sets; aarch64 default, both actuator sets, its instrument set); clippy on
  `toyos` (all targets, `fd-table`), the libraries, `shell-copies`, `toybox-copies` and `toyos-abi`. All exit 0.

## Review round 4: the history rewritten so every commit checks the x86-64 kernel, head 5dd83dcda
- `kcheck-range/`: `cargo check -p kernel --target x86_64-unknown-none`, under that target's `-Dwarnings`, at each of the 22
  commits from main 818809583 to 5dd83dcda (`summary.txt`; one log per commit, each ending with its exit; the commands in
  `kcheck-range.sh`). All 22 exit 0. The control, the old first commit 150fcb847, exits 101 on the dead `user_str`.
- The rewrite (`fold_edits.py`, applied to each commit's tree): `user_str`, `MAX_USER_STR`, their import and their mention
  in `kernel/pure/sched/cpu.rs` leave in the first commit, with the per-thread charge that replaced them, so d7250517f goes;
  `Handles::table`'s doc drops the stdio clause; `system/diskserver/src/session.rs` says a session reaches its service through
  a connector. 5dd83dcda's tree differs from 64eb00ee6's only in those two comments, so `r9/` and guest run 43112704482,
  dispatched at 64eb00ee6, hold for it.
