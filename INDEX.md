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
