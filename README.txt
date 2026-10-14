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

Review round 1, head 1ab1d9917088c4bfeab285242c93b30914263d26 (main 2c3f61a3e, unchanged):
r2/build-only-r2.log  cargo run -- --build-only                                exit 0
r2/guest-r2.log       cargo test --test toyos-build -- --nocapture the_compositor_drives_the_virtio_gpu
                      the_opening_exchange_with_qemus_agent_completes screen_fatal_halt_composited   exit 0, 3/3
r2/ci-host-r2.log     cargo run -- --ci host                                   exit 0, 83 steps green
toyos-virtio-gpu's lib.rs is unchanged since 883e496f7, so the m1..m5 controls stand; the guest row
and the boots whose argv or kernel changed were rerun. No bench rerun: gop_edid_scale's image
differs only by the deleted actuator and the compositor's refusal path, neither on its row's path,
and the leak_rollback_selftest row is deleted, its earlier PASS having proved nothing (a one-handle
mint into a full table passes with or without the rollback it was written to catch).
Correction to the paragraph above: the shipping kernel gop_edid_scale boots also changed on its
path. The framebuffer claim's description now installs its scanout with one `install` rather
than a one-object `install_all`, which has the same effect. The panic console's detach/rearm
became private and are unchanged otherwise. The compositor's change is its refusal path alone.
The framebuffer mint is exercised in QEMU by the GOP row screen_fatal_halt_composited in
r2/guest-r2.log, which passes; on metal it was last read at 883e496f7.

Metal after review round 1, head 1ab1d9917088c4bfeab285242c93b30914263d26: T14 only, as the
orchestrator chose (the AMD bench's gop_edid_scale stands from 883e496f7). The image is
s1/metal-r1/request.txt's metalcase, sha256
b266c38de63ee30568fd66cfbf59abe233bab7a838c0d94820810ef42bb65949.
  gop_edid_scale  metalcase  GOP handle 0 of 2, panel 309x173 mm, scale 1.5   PASS
  (s1/metal-r1/judge-vg2.log: 1 passed, 0 failed, 1 boot)
Readback: s1/metal-r1/metalcase/; runner manifest and log: s1/metal-r1/runner/. Masked as above.

Merge of main e136c77fd (#926 claims by arrival, #927) at head 9a1bff55e4769b70bcd9c8223913ba678e307d1a:
one conflict, pcidev's imports (LEND_WINDOW beside #926's Arrival). The compositor's claim is in
#926's grammar: pci:03:80:00/1af4:1050 (QEMU's virtio-gpu enumerates as class 0380), looked up
with endow::claim, in images/system.toml and tests/images/clipboardcase.toml.
m2/build-only-m2.log  cargo run -- --build-only   exit 0
m2/ci-host-m2.log     cargo run -- --ci host      exit 0, 86 steps green
m2/guest-m2.log       cargo test --test toyos-build -- --nocapture the_compositor_drives_the_virtio_gpu
                      usbd_drives_the_spare bar_map_again lent_device_memory_refused
                      a_drives_row_holds_one_process_per_function   exit 0, 5/5
The merge does not touch the framebuffer mint (kernel/src/object/device.rs, gop.rs, handle.rs
unchanged against 1ab1d9917; kernel/src/device.rs changes only the PCI arm), so the T14
gop_edid_scale at 1ab1d9917 stands.
