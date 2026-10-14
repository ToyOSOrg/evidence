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
