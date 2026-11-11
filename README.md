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

## Guest

Run 43051591773 at b29fb2b2d (QEMU, both architectures):
`virt_vm_map_shares virt_user_mode bar_map_again bar_map_behind_a_bridge lent_device_memory_refused a_spawn_from_an_image_frees_it_when_the_child_ends libc_children a_drives_row_holds_one_process_per_function session_lifecycle`.
Queued; its result is added here. Run 43049845595 named shared binaries of the metal boots as QEMU rows and was
cancelled before it ran: no result.

## Metal (staged, not run)

`cargo test --test toyos-build -- --metal --metal-readback <dir> [--metal-host <user>@<amd-bench>] <filters>`;
exit 2 is "staged, the machine untouched".

- Base, main b56693152, for the A/B: `spawn_cost osbench`, the T14 and the AMD bench, exit 2 each
  (`r1/metal/stage-base.log`).
- Head, b29fb2b2d: `boot:testcases boot:shared-debug boot:proctreecase osbench`, both benches: staging.
