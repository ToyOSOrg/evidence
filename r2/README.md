# PR #984 review r1 fixes, head `aa2295250e1c9a4a5bcaf8c98df1850d13097fa1`

Every run here is on the tree committed as `aa2295250`, except for the reverted probe and the reverted mutation noted below. Paths are masked as in `../README.md`.

| File | Command | Exit |
|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` | 0 (87 steps green) |
| `build-only-*.log` | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| `guest-tests.log` | `cargo test --test toyos-build -- kernel_wx_leaf_is_refused virt_user_mode virt_smp virt_el1_smp console_image_boots virt_early_panic virt_el2_drop` | 0 (8 of 8) |
| `data-executable.guest.log` | `../mutations/data-executable.patch` applied, the same tests less the SMP and early ones, reverted | 1 (4 of 4 red, as wanted) |
| `no-ap-control-regs.probe.log` | a temporary machine test (`no-ap-control-regs.probe.diff`, reverted) booting q35 with `no-ap-control-regs` | 0 |
| `stage-*.log`, `request-*.txt` | `cargo test --test toyos-build -- --metal --metal-readback $SCRATCH/metal-r2-<bench> kernel_wx` | 2 (staged) |

What the logs show:

- **Leaf counts with the mixed-only split:** the negative controls count 4092 leaves on q35 (6647 at `b7a7b5827`) and 3184 on `virt` (5739).
- **AArch64 `join`:** the new break-before-make `join` boots the BSP at EL1 and at EL2, and 8 CPUs at each of `virt_smp` and `virt_el1_smp`. QEMU models no TLB conflict abort, so these runs show the sequence works; they cannot show the conflict it prevents. That argument comes from Arm ARM DDI 0487 M.d D8.17.1.
- **`no-ap-control-regs`:**
  - The AP that the actuator leaves undeclared holds `efer=0x0d01`, written by the trampoline from the declaration, while its `cr0=0xe0000011` and `cr4=0x00000020` are INIT's.
  - It loads the kernel's NX tables and reaches the self-check.
  - The self-check stops the boot with `control_regs: cpu1 holds cr0=0xe0000011, the declaration is 0x80010033`.
