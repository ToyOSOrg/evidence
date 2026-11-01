# pr-1137 r3: the real rebase onto main 9b3711cdb, and review r2's fixes

Head `2831e6e524456b3938c922b5906085fa18869a7d`:
- `31cfd2754` is r2's change, reapplied onto `9b3711cdb` from the diff `d057f2ada..990eb5633`. Five files conflicted, and each kept main's side plus #1137's lines: `system.toml`, metalcase, `tests/toyos.rs`, tgl-display `main.rs` and the driver's `lib.rs`. `opregion()` runs after the claim starts, before the DMC.
- `2831e6e52` holds review r2's fixes.
- `git diff origin/main...HEAD --name-only` lists the same 31 files as `d057f2ada..990eb5633`. None of #1132's, #1134's or #1138's files changes.

All checks below ran at `2831e6e52` on the macOS host, aarch64. The guest target was x86_64.

| Check | Command | Exit | Log |
|---|---|---|---|
| host CI | `cargo run -- --ci host` | 0 (108 steps) | `ci-host.log` |
| image | `cargo run -- --build-only` | 0 | `build-only.log` |
| QEMU | `cargo test --test toyos-build -- bar_map_again` | 0, PASS | `qemu-bar_map_again.log` |
| control: the IPC move revokes nothing | the same command, with `control-no-move-revoke.patch` applied | 1, FAIL (job exit 101 at "a BAR's handle mapped after its claim moved"), restored | `control-no-move-revoke.log` |
| T14 staging | `cargo test --test toyos-build -- --metal --metal-readback <dir> igd_opregion_window display_output_presents` | 2 (staged, machine not touched) | `t14-request.txt`, `t14-image.sha256` |

Host CI ran on the committed tree, apart from one doc-comment line in `pcidev/mod.rs` that changed during the run. It compiled into the image and QEMU runs that followed.

`bar_map_again` now reads five lines. Among them:
- a BAR handle kept past the claim's IPC move, to this process itself, maps `Gone`;
- the new holder's fresh BAR maps and reads the device's register;
- a handle kept past the claim's end maps `Gone`.

The r2 control without the claim-end revoke is not rerun. Its revoke site, `on_zero_handles`, changed only from `revoke_mappings()` to `revoke_handed(number)`, the same take-and-revoke. The test's release assertion is unchanged.

Not read by any test:
- the concurrent receiver of r2's required 2, since a self-send cannot interleave it;
- the sibling-thread race of required 3;
- a spawn's move.

Code reasoning closes the first two, and the PR records it.

The T14 boot carries `igd_opregion_window` and `display_output_presents` on one metalcase boot, because tgl-display's `main` changed under stages 2 and 3.
