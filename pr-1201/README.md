# PR 1201: the loader boots the marked slot or nothing

Revision under test: `dd736982b2ac25334da6b33eb8f62cf40b289b49` (branch `fix-forward-loader`, on main `f9b5d7f12`).
Local paths are masked as `<home>`, `<scratch>` and `<tmp>`; the runner's machine name is masked.

| check | command | target | exit | log |
|---|---|---|---|---|
| `toyos-update` units | `cargo test -p toyos-update` | macOS arm64 host, working tree later committed as `dd736982b` | 0 | `toyos-update-unit.log` |
| host checks | `cargo run -- --ci host` | macOS arm64 host, same tree | 1: 1 of 110 steps red | `ci-host.log` |
| guest rows | `gh workflow run guest-rows.yml --ref fix-forward-loader -f filter='a_bent_supervisor_is_refused_and_nothing_boots a_clean_stop_proves_its_image virt_first_entry'` | guest runner, run 42910883434, `dd736982b` | success, 3 passed | `guest-rows-42910883434.log` |
| negative control | the same workflow at `5635e5496` (`dd736982b` plus `control.diff`), filter `a_bent_supervisor_is_refused_and_nothing_boots` | guest runner, run 42910889983 | failure, as intended | `guest-rows-control-42910889983.log` |

## The host red

The one red step is `the build system: cargo test --lib`, and its one failing test is
`llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, which fails on every macOS host:
`issues/the-llvm-environment-test-breaks-git-on-macos.md`. The branch does not touch `build/llvm.rs` or `build/sysroot.rs`.
The other 383 tests of that step passed, `bootlog::tests::the_loader_writes_the_lines_the_host_reads` among them.

While the host run was in its kernel-model steps (after 21:58 in the log), `loader/src/slot.rs` in the same worktree briefly
held the control's mutation, to commit the control branch, and was restored. The steps that read the loader (the build system's
tests, clippy) had finished by 21:58:15; the kernel models do not read `loader/`.

## The negative control

`control.diff` puts the other slot back into the pass: where the marked slot is refused, the loader verifies and boots the other.
The image built, and the row failed: the loader said `Slot A: REFUSED, its supervisor is not the bytes its signed header names`,
then verified slot B and booted it, and the wait for the loader's "no other slot is booted" line expired.
The control branch was deleted after the run; its whole content is `dd736982b` plus `control.diff`.

# Round two: `3231f4125acc42f932c767a9758c3be779cf9292`

Review r1's fixes: the free-on-refusal cleanup deleted from the loader, comment and record corrections, the manual's clause.

| check | command | target | exit | log |
|---|---|---|---|---|
| guest rows | the same three rows, `--ref fix-forward-loader` | guest runner, run 42919063497, `3231f4125` | success, 3 passed | `r2/guest-rows-42919063497.log` |
| clippy | `cargo run -- --clippy` | macOS arm64 host, working tree committed as `3231f4125` | 0, 26 invocations clean | `r2/clippy.log` |
| units | `cargo test -p toyos-update -p toyos-abi` | same | 0 | `r2/units.log` |

The whole of `cargo run -- --ci host` was not run again: the round's code change is in `loader/src`, which the host
steps reach only through clippy and the build system's source-reading test, whose loader constant did not move.
The negative control was not run again: the mutation is to `slot::marked`, which this round did not touch.

# The T14 boot of `dd736982b`

The orchestrator booted the staged `testcases` image (`t14/prepare.log`, the staging run, exit 2 by design: rows left
unjudged). The loop's verdict was `passed` (`t14/verdict.txt`), and the two rows judged on its readback both pass
(`t14/judge.log`, `cargo test --test toyos-build -- --metal --metal-readback <dir> control_regs memory_overwrite_requested`,
exit 0, judged with the tree at `3231f4125`, whose judges are those of `dd736982b`).

The boot is of round one's loader. Round two only removes calls on refusal paths a booting slot never takes.

The readback's `loader.log`, `kernel.log` and `boot.txt` are not published: they carry the machine's model and device
identifiers. The lines of `loader.log` this change is about:

```
Panic: a panic in this loader resets the machine, whose default boot is another entry than this one
Slots: the table marks A (sequence 1); slot A present, slot B absent; the floor is 0
Slot A: kernel, cmdline, supervisor, fileserver and ROOT are the bytes the signed header names
Boot parameter: "boot-deadline=120000,boot-slot=A"
```

and the kernel's: `boot: slot A, the one the slot table marks`.
