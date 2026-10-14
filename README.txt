PR #931: the desktop and its own clients draw at the display's scale.

Head c849397d358f50013a8924918698dfd48617b773 (main bd5d4e0c0, #925, merged).
Host: macOS on Apple silicon, QEMU as build/ci/qemu-version declares.
Every log's first line is the head it ran at; logs are masked of paths.

ci-host.log          cargo run -- --ci host                    exit 0, 86 steps green
build-only.log       cargo run -- --build-only                 exit 0
guest.log            cargo test --test toyos-build -- a_window_is_drawn_at_the_scale_and_relaid_at_the_next
                       desktop_without_x2apic screen_fatal_halt_composited
                       the_opening_exchange_with_qemus_agent_completes the_compositor_drives_the_virtio_gpu
                                                               exit 0, 5 of 5
mutations-host.log   each patch in mutations/ applied, its tests run, reverted, in one run:
                       m1-m6 each red their named tests (exit 101), tree restored
mutations-guest.log  m7 (logical size ignored) stalls the scale row at "the window at 2";
                     m8 (only the `rescaled ||` clause dropped) passes: a scale change
                       changes every normal window's size, which relays it anyway;
                     m8b (no relay at all) stalls it at "the window relaid at 1";
                     window_refusal, a shared-boot member the harness cannot filter,
                       through scratch-window-refusal-row.patch (a scratch machine row on
                       scalecase, reverted): passes unmutated, and m9 (a client taking an
                       absurd scale) reds it "reply AbsurdScale(0) decoded wrongly"
screens/             at-two.png and at-one.png: the scale row's two QMP screendumps,
                     written by screens/dump-pixels.py applied as a scratch patch
                     (reverted), run.log exit 0
metal/               the gop_edid_scale row staged with --metal-readback (exit 2:
                     staged, nothing measured); request.txt is the orchestrator's

The 8x16 raster the build ships, before and after the rasterizer moved into
toyos-font, written by a scratch test at the base and at def2ccec4:
  sha256 41f922af37bee6ba1589e3b02edc821a1631365e31e680102c8b019dc6bce955 both.
