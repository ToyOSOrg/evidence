Evidence for ToyOS PR #925 (virtio-gpu leaves the kernel), head 883e496f701c76f31bc800c913730d752f393592
(branch wt/toyos-virtio-gpu, main 2c3f61a3e merged). Host: macOS, QEMU 11.1.1.
Personal paths masked as <home>, <worktree>, <scratch>.

s1/build-only.log       cargo run -- --build-only                    exit 0
s1/ci-host.log          cargo run -- --ci host                       exit 0, 83 steps green
s1/guest-virtio-gpu.log cargo test --test toyos-build -- --nocapture the_compositor_drives_the_virtio_gpu   exit 0
s1/guest-related.log    cargo test --test toyos-build -- the_opening_exchange_with_qemus_agent_completes
                        iommu_virtio_platform desktop_without_x2apic screen_fatal_halt_composited
                        console_image_boots                          exit 0, 5 passed
s1/mutations/run.sh + mutations-head.log    five checked patches on toyos-virtio-gpu (m1..m5), each
                        builds and reds its named host tests, tree restored, 18/18 green after
s1/mutations/guest.sh + guest-mutations.log (g1) and guest-mutations-2.log (g2): the guest row
                        reds with the compositor not following the display event (g1, STALLED
                        waiting for the followed mode) and with its presents dropped (g2,
                        "1280x800 in 1 colour(s)"); g2's first attempt in guest-mutations.log
                        did not build (unused variable) and its patch was corrected
s1/metal-stage.log + s1/metal/request.txt   cargo test --test toyos-build -- --metal --metal-readback
                        <scratch>/metal gop_edid_scale leak_rollback_selftest   exit 2 (staged:
                        nothing judged, no machine touched)

Metal, head 883e496f7 (883e496f701c76f31bc800c913730d752f393592), run by the orchestrator from
s1/metal/request.txt. Masked with the orchestrator's mask.sh, and every BIOS string's suffix
after <bios> removed. Images (sha256), identical between the staged ones and both benches' copies:
  metalcase     99bfeb0148cda8d6b71e244ea5c192f9edbc5e3ffa73ca810f2b18ebc581d644
  shared-debug  bdb72e79319dc0c1f135863bf2833bd92c5846108f18390e4c96e834717b7f9b
The images and the log partitions are not published; their text readbacks are.

ThinkPad T14 (Tiger Lake), s1/metal/t14/judge-vg.log: 2 passed, 0 failed, 2 boots
  gop_edid_scale          metalcase    GOP handle 0 of 2, panel 309x173 mm, scale 1.5      PASS
  leak_rollback_selftest  shared-debug device-mint PASS (refused=true installed=0)        PASS
AMD bench, s1/metal/amd/judge-vga.log: 2 passed, 0 failed, 2 boots
  gop_edid_scale          metalcase    GOP handle 1 of 2, panel 309x174 mm, scale 1.5      PASS
  leak_rollback_selftest  shared-debug device-mint PASS (refused=true installed=0)        PASS
Readbacks: s1/metal/{t14,amd}/{metalcase,shared-debug}/ (boot.txt, verdict.txt, kernel.log,
loader.log, the image's system toml). Runner manifests and logs: s1/metal/runner/m925-{t14,amd}.{txt,log}.
