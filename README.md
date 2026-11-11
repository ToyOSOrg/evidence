# PR #1259: a memory object's range is mapped where the caller says, and an immutable one is shared and executable

Host, guest and metal evidence for https://github.com/ToyOSOrg/ToyOS/pull/1259. Paths, user names and bench
host names are masked (`<worktree>`, `<scratch>`, `<home>`, `<tmp>`, `<amd-bench>`).

## r1: branch `map7b` at b29fb2b2d

Base: main b56693152. Host: macOS arm64.

| check | command | revision | exit | log |
|---|---|---|---|---|
| the kernel's rule, the ELF layout, `dl`, kimage | `cargo test -p kernel --lib vm::`, `cargo test -p toyos --test elf_program`, `cargo test -p toyos --lib dl::`, `cargo test -p toyos-kimage` | 7d9644b5c (see below) | 0 each | `r1/host/host-1b.log` |
| control: `ReadExec` mappable from a writable object | `r1/host/mut-exec.patch`, `cargo test -p kernel --lib vm::` | 7d9644b5c | 101, restored identical | `r1/host/mut-exec-1b.log` |
| control: `dl`'s relocation window unchecked | `r1/host/mut-window.patch`, `cargo test -p toyos --lib dl::` | 7d9644b5c | 101, restored identical | `r1/host/mut-window-1b.log` |
| the harness's split of driven and shared binaries | `cargo test --test toyos-checks -- checks::suite_split` | b29fb2b2d | 0 | `r1/host/checks-split.log` |
| all host checks | `cargo run -- --ci host` | b29fb2b2d | 1: 109 of 110 steps green | `r1/host/ci-host-3.log` |

7d9644b5c is the step 2 branch (`map7b-2`), run there because this branch's tree was staging images; its `sdk/`,
`lib/kimage/` and `kernel/pure/vm.rs` are byte-identical to b29fb2b2d
(`git diff b29fb2b2d 7d9644b5c -- sdk lib/kimage kernel/pure/vm.rs` is empty), which is every source those tests
build but the kernel library's other modules.

The one red host step is `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key` (and
`keyed_and_built`, the child it re-runs), red on every macOS host and recorded in
`issues/the-llvm-environment-test-breaks-git-on-macos.md`. This branch touches nothing it reads.

## r1, continued: head c991bfdb6

c991bfdb6 = b29fb2b2d plus one commit: three guest test sites still passed a bare handle where `lay_out` now
takes a `Source` (`tests/guest/rust-tests/src/image.rs`, `startup_block.rs`, `spawn_image_object.rs`), so the
guest test binaries did not build. No host check builds them; the head staging did, and its first two attempts
are the evidence of the defect (`r1/metal/stage-head-attempt-1.log`, `-2.log`, exit 101 each, `E0599: no method
named handle`). The commit touches only `tests/guest/`, so every host result above holds for c991bfdb6. The
step 2 branch named above was rebased onto c991bfdb6 (its `sdk/`, `lib/kimage/` and `kernel/pure/vm.rs`
unchanged).

## Guest

Run 43062438931 at c991bfdb6 (QEMU, both architectures):
`virt_vm_map_shares virt_user_mode bar_map_again bar_map_behind_a_bridge lent_device_memory_refused a_spawn_from_an_image_frees_it_when_the_child_ends libc_children a_drives_row_holds_one_process_per_function session_lifecycle`.
Queued; its result is added here. Earlier dispatches, none a result: 43049845595 named shared binaries of the
metal boots as QEMU rows and was cancelled before it ran; 43051591773, at b29fb2b2d, was cancelled once the
guest binaries were found not to build.

## Metal (staged, not run)

`cargo test --test toyos-build -- --metal --metal-readback <dir> [--metal-host <user>@<amd-bench>] <filters>`;
exit 2 is "staged, the machine untouched".

- Base, main b56693152, for the A/B: `spawn_cost osbench`, the T14 and the AMD bench, exit 2 each
  (`r1/metal/stage-base.log`).
- Head, c991bfdb6: `boot:testcases boot:shared-debug boot:proctreecase osbench`, the T14 and the AMD bench,
  exit 2 each, every x86-64 guest test binary built (`r1/metal/stage-head.log`). This is also the build of the
  image at the head.
- The request handed to the orchestrator, 22 boots: `r1/metal/request.txt` (osbench A/B, four boots a side per
  bench, base-head-head-base twice; the whole testcases, shared-debug and proctreecase boots once per bench).
