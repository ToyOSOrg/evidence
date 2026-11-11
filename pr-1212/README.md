# PR 1212: x86-64's boot map holds no page writable and executable

Revision under test: `66a5575a3c22e4ed71d3228a182ead719fd04992` (branch `boot-map-wx`, on main `fb88cec2a`).
Local paths are masked as `<home>`, `<scratch>` and `<tmp>`; the runner's machine name is masked.

| check | command | target | exit | log |
|---|---|---|---|---|
| the plan's host tests | `cargo test -p toyos-bootmap` | macOS arm64 host, `66a5575a3` | 0: 58 passed | `bootmap-tests.log` |
| host checks | `cargo run -- --ci host` | macOS arm64 host, `66a5575a3` | 1: 1 of 110 steps red | `ci-host.log` |
| guest rows | `gh workflow run guest-rows.yml --ref boot-map-wx -f filter='std_threads_count_the_cpus_and_give_back_ended_threads kernel_wx_leaf_is_refused libc_children virt_smp virt_user_mode'` | guest runner, run 42941002463, `66a5575a3` | success, 6 passed | `guest-rows-42941002463.log` |
| negative control: no XD | `cargo test -p toyos-bootmap --no-fail-fast` on `66a5575a3` plus `control-no-xd.diff` | macOS arm64 host | 101: 6 tests red, as intended | `control-no-xd.log` |
| negative control: code pages are data | the same on `66a5575a3` plus `control-code-writable.diff` | macOS arm64 host | 101: 2 tests red, as intended | `control-code-writable.log` |
| metal boot staged | `cargo test --test toyos-build -- --metal --metal-readback ../metal-wx kernel_wx smp_roster_and_tsc_trail` | no machine touched | 2: staged, not run | `metal-prepare.log` |

## The host red

The one red step is `the build system: cargo test --lib`, and its one failing test is
`llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, which fails on every macOS host:
`issues/the-llvm-environment-test-breaks-git-on-macos.md`. The branch does not touch `build/`. The other 383 tests of that step passed.

## What the guest rows show and do not

The six rows are x86-64 q35 boots under KVM and AArch64 `virt` boots. An x86-64 guest that reaches its ready marker has run the loader's
switch from its one executable page, the boot CPU on the map until `mm::init`, and every AP through the trampoline page it now holds
read-only; `std_threads_count_the_cpus_and_give_back_ended_threads` counts the CPUs that came up. A passing row's serial is not kept, so
no log here quotes the loader's `Code pages beside it` line.

No metal bench has booted this revision: the T14 was down and the AMD bench busy when it was staged.

## The negative controls

Both mutations build. Without XD on data leaves, `nothing_is_writable_and_executable_and_the_code_pages_run` reds with five tests
beside it. With the code pages left as data, that test and `a_page_of_code_is_one_small_leaf_among_data` red. Each mutation was
restored with `git checkout` on the committed tree and the suite rerun green (`bootmap-tests.log`).

# Round two: `7355706dbb34dc5a84fdbd9021ca59777ba5bf3f`

Correction to the first table: the first revision's parent is `fb88cec2a`, not `9349705ce`.

Review r1's fixes: `CR0.WP` set by the loader and by the trampoline before either runs under the map, the map's tables withheld
from the allocator, the early-fault record and comment, the loader's line about what firmware hands over, a walk of a switch page
above the low map.

| check | command | target | exit | log |
|---|---|---|---|---|
| host checks | `cargo run -- --ci host` | macOS arm64 host, `7355706db` | 1: 1 of 110 steps red, the same macOS-only test | `r2/ci-host.log` |
| guest rows | `gh workflow run guest-rows.yml --ref boot-map-wx -f filter='std_threads_count_the_cpus_and_give_back_ended_threads libc_children kernel_wx_leaf_is_refused virt_smp virt_user_mode'` | guest runner, run 42946955150, `7355706db` | success, 6 passed | `r2/guest-rows-42946955150.log` |
| negative control | the same workflow at `60680370b` (`7355706db` plus `r2/control-unaccessed-gdt.diff`), filter `std_threads_count_the_cpus_and_give_back_ended_threads` | guest runner, run 42946958444 | failure, as intended | `r2/guest-rows-control-42946958444.log` |
| metal boots staged | `cargo test --test toyos-build -- --metal --metal-readback <dir> kernel_wx smp_roster_and_tsc_trail topology_readback`, once per bench | no machine touched | 2: staged, not run | `r2/metal-prepare-t14.log`, `r2/metal-prepare-amd.log` |

The host run's `toyos-bootmap` step is the plan's tests at this head: 59 passed, the new walk among them.

## The control

With the trampoline's temporary descriptors left unaccessed (`0x9A`, `0x92`), the image builds and the boot CPU boots to
`mtrr: the boot processor's range registers`, the last line before it starts the first AP; the guest then resets. Loading the
64-bit code descriptor after paging is on writes its accessed bit, and that write faults only where `CR0.WP` is in force on the
AP and the page is read-only, with no IDT loaded yet. The same row at `7355706db` is green.

The control's serial also carries the loader's two new lines on OVMF:
`CPU: firmware hands over EFER.NXE set and CR0.WP set; the loader sets both before its switch` and
`Code pages beside it, mapped read-only: [140015000, 8000]`. So on this firmware the loader's own writes change nothing, and
no boot has yet shown them mattering; the benches' logs will say what their firmware hands over.

The control branch `boot-map-wx-nc` was deleted after the run.

# Round three: `4f3efa786ec1174429aeb766b2bb4c4300c8994f`

Review r2's fix: the boot map's tables are named in `kernel_main`'s shared list of the loader's allocations, so both
architectures withhold them and the `LoaderData` check covers them; `arch::boot::reserved` is one region again.
The change is `kernel/src/main.rs`, both `boot.rs` and one comment in `lib/bootmap/src/x86_64.rs`.

This branch was recreated once: the guest logs' instrument line carried the runner's CPU model and core count, now masked
as `<cpu model>` and `<n> core(s)` in every log here.

| check | command | target | exit | log |
|---|---|---|---|---|
| guest rows | `gh workflow run guest-rows.yml --ref boot-map-wx -f filter='std_threads_count_the_cpus_and_give_back_ended_threads virt_smp virt_user_mode'` | guest runner, run 42952063386, `4f3efa786` | success, 3 passed | `r3/guest-rows-42952063386.log` |
| clippy | `cargo run -- --clippy` | macOS arm64 host, `4f3efa786` | 0: 26 invocations clean | `r3/clippy.log` |
| metal boots staged | `cargo test --test toyos-build -- --metal --metal-readback <dir> kernel_wx smp_roster_and_tsc_trail topology_readback pmm_accounting`, once per bench | no machine touched | 2: staged, not run | `r3/metal-prepare-t14.log`, `r3/metal-prepare-amd.log` |

Reused from round two: the host run at `7355706db` (`r2/ci-host.log`) and the unaccessed-descriptor control. Round three changes
which regions the kernel withholds at boot, which no host test executes; clippy compiles it in every kernel shape, and the three
guest rows boot it on both architectures, each passing the `LoaderData` check for the pool on its firmware's map.

# Metal at `4f3efa786ec1174429aeb766b2bb4c4300c8994f`

One boot per bench of the staged testcases image, run by the orchestrator, judged from the readbacks with
`cargo test --test toyos-build -- --metal --metal-readback <dir> kernel_wx smp_roster_and_tsc_trail topology_readback pmm_accounting`
on a tree at `4f3efa786`. Machine model and BIOS strings are masked.

| bench | boot verdict | judge | log | the checklist's lines |
|---|---|---|---|---|
| T14 (Intel) | passed | exit 0: 4 passed, 0 failed | `t14/judge.log` | `t14/lines.txt` |
| AMD bench | passed | exit 0: 4 passed, 0 failed | `amd/judge.log` | `amd/lines.txt` |

`lines.txt` is cut from each readback's `loader.log` and kernel log; the whole logs are not published.

- **Firmware's hand-over differs.** The T14 hands over `EFER.NXE set and CR0.WP set`. The AMD bench hands over
  `EFER.NXE clear and CR0.WP set`, so its boot is the first where the loader's own `NXE` write mattered: without it the map's
  data leaves would have set a reserved bit. No firmware seen hands over `WP` clear, so the loader's `WP` write is still
  established by reading only; the trampoline's is shown by the descriptor control.
- **Both loaders sat above 4 GiB** (`Loader image: 0x140000000+0x7e000`), so the switch ran from a page outside the low map:
  `Code pages beside it, mapped read-only: [140002000, 8000]`.
- **The AMD bench's scanout** is under a second-level table of its own (`in 6 page directories under 2 second-level tables`).
- **Every CPU came through the trampoline** and holds the declaration: `SMP: 8 of 8` and `control_regs: 8 of 8 cpus hold
  cr0=0x80010033 … efer=0x0d01` on the T14, `16 of 16` on the AMD bench.
- **The pool passed the `LoaderData` check on both firmware maps**: both boots got through `mm::init` to their `pmm:` line and on.
- The AMD judge log carries a `clock: TSC STEP` line from that boot. It is the clock's own report and no row judged it; this
  change touches no clock code.

# The rebased head: `388be26667b6cef17e520f2a323e551024f1ee11`

After the bench boots the branch was rebased three times as main moved, last onto `cb3f9c062` (#1213). The benches booted
`4f3efa786`; nothing below was run on a bench.

- The first rebase, onto `ad5db5a65` (#1210), had two conflicts. In `kernel/src/main.rs` main's new `names` region and this
  branch's `boot_map` region both join the `loader` list and its destructuring. In `docs/src/architecture/boot.md` both
  bullets are kept.
- The second, over #1200, and the third, over #1213, applied without conflict; `git range-diff` shows the three commits
  unchanged across both.
- So the rebase touched built code: main's own changes, among them `kernel/src/main.rs` and both `boot.rs`, and the one
  hand-resolved line.

| check | command | target | exit | log |
|---|---|---|---|---|
| host checks | `cargo run -- --ci host` | macOS arm64 host, `388be2666` | 1: 1 of 110 steps red, the same macOS-only test | `rebased/ci-host.log` |
| guest rows | `gh workflow run guest-rows.yml --ref boot-map-wx -f filter='std_threads_count_the_cpus_and_give_back_ended_threads virt_smp'` | guest runner, run 42988634474, `388be2666` | success, 2 passed | `rebased/guest-rows-42988634474.log` |

The host run's one red step is `the build system: cargo test --lib`, 384 passed and 1 failed,
`llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`; every other failure list in the log is under a
`control` step. Clippy's 26 invocations are in the run. The same two checks were also green at the two earlier rebased heads,
`42c738f11` (guest run 42982730363) and `36898f8d4` (guest run 42986543196); those logs are not published.
