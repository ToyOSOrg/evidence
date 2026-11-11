# pr-1239: a receive reports each handle's kind

Revision: the checks ran at 34cb4c918 plus the change's tree, which is commit ad7d762c2 (rebased onto b56693152; the rebase brought `issues/` edits only). Host: arm64 macOS.

## host/ (targeted checks, the owner's policy)
- `summary.txt` lists every command and its exit code; each `<name>.log` holds the full output and ends with `exit N`. `checks-a.sh` is the script that ran them.
- exit 0: `test-host-libs` (toyos-abi, toyos-blockserve, toyos-link, toyos-session), `test-guest-libs` (toyos, logkeeper-api), `test-diskserver`, `test-hda`, `test-logkeeper`, `test-netstack`, `test-session`, `test-sshserver`, and the `clippy-*` runs in CI's shapes.
- exit 101, and neither is a code result:
  - `test-supervisor`: the `system/supervisor` crate builds only for ToyOS. Its host tests live in the nested `lifecycle` crate, which this change does not touch.
  - `test-osbench`: osbench builds for x86-64 ToyOS and Linux, not for arm64 macOS. The change touches only its ToyOS half.

## build/
- `build-only.log`: `cargo run -- --build-only`, exit 0, run on the tree before two later edits (a doc comment reflow and a slice in `messages_are_whole`). `metal/stage.log` rebuilds every guest binary and image at ad7d762c2.

## controls/
- `mutant-sdk-admit.patch` makes `admit` accept any kind the SDK knows. `mutant-sdk-admit.log` shows `a_received_handle_is_typed_only_as_the_kind_the_kernel_reported` red under it, exit 101.

## metal/
- `stage.log`: `cargo test --test toyos-build -- --metal --metal-readback <dir> boot:testcases boot:shared-debug process_tree` at ad7d762c2. It exits 2, the harness's word for staged with the machine untouched: 4 images, 47 registrations and 245 shared members.
- `request.txt`: the boots requested (proctreecase, shared-debug, testcases, testcases-watchdog).

## guest/
- `rows-43049964255.log`: guest-rows run 43049964255 at ad7d762c2. It ran session_lifecycle, a_launch_gives_each_unsent_stdio_slot_a_null, netstack_holders_exported_to_children and hda_plays_to_the_controller_that_reaches_an_output: 4 passed, 4 total. The runner's machine name and CPU model are masked.

## r1/ (review round 1, head d8090d44c, rebased onto 6d0cb3ae9)
- `summary.txt`: compile checks of the type-level fix, as the review asked. They are `cargo test -p toyos --lib ipc::` and clippy in CI's shapes (`toyos --all-targets`, `toyos --lib --features fd-table`, `toyos-abi`), each exit 0.
- `guest-compile.log`: `--metal --metal-readback <dir> served_file_offset` at d8090d44c, used only as the guest compile. It builds std, libc, every program and every guest binary, then exits 2 (staged, 1 image, not requested).

## r2 (review round 2, head 15fa1e54d: comments only, nothing rerun)
- Correction to r1: `guest-compile.log` compiled std, libc, the `testcases` image's programs and every guest binary, not every program. That image builds no compositor; the compositor, console, uart and acpiserver call `endow::device`, whose bound is unchanged.

## rebase-1246/ (head 451269586, rebased onto main 06fcb81ea, which holds #1246)
- The conflict was `undelivered` in `kernel/src/syscall/ipc.rs`. It now takes this change's `&[ReceivedEntry]` and closes them through #1246's `process::with_handles`.
- `summary.txt`: the kernel's host tests and clippy shapes at 451269586, each exit 0. They are `cargo test -p kernel --lib --features sched-check` and clippy on the kernel's host library, x86-64 default and with `boot-actuators,test-actuators`, and AArch64.
- `guest/rows-43092098455.log`: run 43092098455 at 15fa1e54d, 5 of 5 passed. It is superseded by the rebased head's run 43108314485.
