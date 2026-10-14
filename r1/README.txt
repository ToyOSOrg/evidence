PR #918, round 1. Host: macOS on Apple silicon, QEMU 11.1.1 (x86-64 under TCG,
AArch64 under HVF). Paths masked: <worktree>, <dev>, <scratch>, <tmp>.

Revisions
  8a47c46e8  the change
  9b39b7ce7  the change merged with origin/main 3ba4a4a2f (branch head for every run below)
  76d370902  origin/main when the negative control was built (3ba4a4a2f + the AMD
             microcode pin, #914; no claim, IOMMU or IDT file differs)

Checks (command; exit; target; log)
  cargo run -- --build-only                          ; 0 ; x86-64 image  ; build2.log
  cargo run -- --build-only --arch aarch64           ; 0 ; AArch64 image ; build-a64.log
  cargo run -- --ci host                             ; 0 ; host, 77 steps ("all green"; the
      kernel-loom FAILED lines are its negative-control steps, required red);
      kernel::owners' five tests at lines 6764-6783     ; ci-host.log
  cargo test --test toyos-build -- usbd_drives_the_spare ; 0 ; q35 HeadlessUsbSpare ; guest-usbd-spare.log
  cargo test --test toyos-build -- virt_claim_lpi        ; 0 ; virt VirtIts (HVF)    ; guest-virt-claim-lpi.log

Five claims on cargo run's Virtio machine (staged, not committed)
  fifth-claim.patch gives logkeeper's row the q35 AHCI function (8086:2922),
  a fifth claim beside diskserver, soundserver, netstack and vdagent.
  The launcher's own argv, through qemu-wrapper.sh on PATH, which swaps only
  -display cocoa -> none and the coreaudio backend -> none (qemu-argv.txt).
  branch 9b39b7ce7 + patch: cargo run -- --build-only (build-fifth.log, 0), then
    cargo run, stopped by PID after the boot settled: virtio-fifth.console
    lines with "handed over": five functions on vectors 0x40-0x44, irte1-6;
    no panic, no DMA fault.
  negative control, the whole change reverted (kernel/ tests/ system/ issues/
    at 76d370902) + the same patch: build-base-fifth.log (0),
    virtio-fifth-base.console: four "handed over on slot N" and
    "supervisor: vdagent: no claim slot is free for pci:1af4:1043".

Mutation control (mutation-dispatch.patch, applied and reverted in one run)
  every claim stub pushes the next vector's number. Builds;
  cargo test --test toyos-build -- usbd_drives_the_spare exits 1: the boot
  never reaches READY (mutation-dispatch.log).

T14 staging (no machine touched)
  cargo test --test toyos-build -- --metal --metal-readback <scratch>/t14 \
    claim_reuses_its_remapping_entry usbd_drives_the_type_c_controller
  exits 2 by design (Verdict::Staged); t14-request.txt, t14-stage.log.

T14 run of the staged images (run by the orchestrator, head 9b39b7ce7)
  machine: ThinkPad T14 (LENOVO 20W0003AMZ, BIOS N34ET71W 1.71), VT-d.
  runner log: t14/m918-t14.log; judge: t14/judge-slots.log, "2 passed, 0 failed, 2 boot(s)".
  readbacks: t14/testcases/ and t14/testcases-xhci-leave/ (kernel.log, loader.log,
  boot.txt, verdict.txt "passed", the image's system toml; the USB stick's serial
  number masked; images and log partitions not published).
  claim_reuses_its_remapping_entry: testcases/kernel.log 607-621, the I219 (00:1f.6)
    claimed twice, irte4 at vector 0x40 both times, p=0 after each release.
  usbd_drives_the_type_c_controller: testcases-xhci-leave/kernel.log 340-491, 00:0d.0
    handed over on vector 0x40 (irte3), its first message taken on vector 0x40,
    irte3 p=0 at release.
