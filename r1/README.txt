PR #931 review round 1 at cdd9fd3f119764d7cec490550c4b74671545bf81 (main 335927b83 merged).

ci-host.log          cargo run -- --ci host, exit 0, 86 steps green (clippy includes the new
                     -p toyos-font --no-default-features shape, target/clippy-font)
build-only.log       cargo run -- --build-only, exit 0
guest.log            the scale row, desktop_without_x2apic, screen_fatal_halt_composited, the
                     clipboard row and the_compositor_drives_the_virtio_gpu (now at scale=2:
                     1280x800 at 1.75, 1024x768 at 1.5), exit 0, 5 of 5
mutations-host.log   each applied, run, reverted: m1-m6 as before (m3 and m5 rewritten for the
                     new code; m5's first form did not compile and is rerun below it) and
                     m10 relay unfitted (B1), m11 swap on any generation (B2), m12 never owe
                     (B3), m13 logical request not fitted (B5): each reds its named tests
mutations-guest.log  m7 stalls the scale row (drew 200x100 at 2), m8b stalls it at the relay,
                     window_refusal passes unmutated through the scratch row and m9 reds it
raster-compare.log   S4: main's 8x16 raster (build/assets.rs's own producer, on a scratch
                     worktree of origin/main) and this head's (toyos-font's), each written
                     by an appended scratch test, reverted: sha256 41f922af… both, cmp identical
metal/               gop_edid_scale restaged on metalcase (exit 2: staged, not run)
