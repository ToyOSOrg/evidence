# PR #984: kernel W^X on x86-64 and AArch64

Head under test: ToyOS `b7a7b5827f01ced4c89b223cf2f4b6077ab16c14` (branch `wt/toyos-kwx`,
base `db0cf636d`). Host: macOS on Apple silicon; x86-64 guests run under TCG, AArch64 guests
under HVF (`Profile::Virt`) or TCG (`VirtEl2`, `VirtTcg`). Paths are masked: `$HOME`,
`$SCRATCH` (the assignment's scratch directory); the checkout's throwaway signing-key
fingerprint is masked too. Every exit code below is the command's own.

| File | Command | Exit | Revision |
|---|---|---|---|
| `host/ci-host.log` | `cargo run -- --ci host` | 0 (87 steps green) | b7a7b5827 |
| `builds/build-only-x86_64.log` | `cargo run -- --build-only` | 0 | b7a7b5827 |
| `builds/build-only-aarch64.log` | `cargo run -- --build-only --arch aarch64` | 0 | b7a7b5827 |
| `qemu/guest-tests-at-head.log` | `cargo test --test toyos-build -- kernel_wx_leaf_is_refused virt_user_mode virt_smp virt_el1_smp console_image_boots virt_early_panic virt_el2_drop` | 0 (8 of 8) | b7a7b5827 |
| `qemu/probe-shipping-boots.log` | `cargo test --test toyos-build -- console_image_boots virt_smp virt_user_mode virt_el1_smp` with `qemu/probe.diff`'s two `[probe]` lines printing the audit, SMP and control-register lines | 0 | pre-commit tree (1) |
| `mutations/data-executable.guest.log` | `mutations/data-executable.patch` applied, then `cargo test --test toyos-build -- kernel_wx_leaf_is_refused virt_user_mode console_image_boots`, then reverted | 1 (4 of 4 red, as wanted) | pre-commit tree (1) |
| `mutations/bootmap-text-writable.host.log` | `mutations/bootmap-text-writable.patch` applied, `cargo test --no-fail-fast` in `lib/bootmap`, reverted | 101 (6 red, as wanted) | pre-commit tree (1) |
| `mutations/audit-reads-no-execute-bit.host.log` | `mutations/audit-reads-no-execute-bit.patch` applied, `cargo test --lib wx` in `kernel`, reverted | 101 (10 of 10 red, as wanted) | pre-commit tree (1) |
| `metal/stage-*.log`, `metal/request-*.txt` | `cargo test --test toyos-build -- --metal --metal-readback $SCRATCH/metal-<bench> kernel_wx` | 2 (staged; no machine touched) | b7a7b5827 |
| `arm/provenance.md` | where every Arm bit position was read | | |

(1) The tree that became b7a7b5827 less three edits made after the run: a comment reflow in
`kernel/src/arch/x86_64/control_regs.rs`, issue text, and `lib/bootmap/tests/plan.rs`'s
clippy fix. None changes a kernel, loader or boot map instruction, so these results stand
for the head; `qemu/guest-tests-at-head.log` repeats the guest tests on the head itself.

What the logs show:

- The shipping kernel's audit passes on both architectures (`probe-shipping-boots.log`):
  `paging: 6647 kernel leaves, none writable and executable, none executable outside the text`
  on q35 with 2 CPUs (`efer=0x0d01`, `cr0=0x80010033`: NXE and WP on both), and
  `paging: 5749 kernel leaves, ...` on `virt` with 8 CPUs at EL1 and at EL2, every CPU holding
  `SCTLR_EL1=0x30d8199d` (WXN, bit 19, set).
- The negative control: `kernel-wx-leaf` stages one writable executable direct-map leaf and
  the audit names that leaf, and only that leaf, under both rules, on both architectures.
- With data leaves left executable (`data-executable.patch`, the direct map as it was before
  this PR), the audit refuses 6197 to 6275 leaves on x86-64 and 4891 to 4902 on AArch64, and
  the shipping boots stop there.
