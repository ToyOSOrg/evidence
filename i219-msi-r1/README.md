# PR 917, round 1: toyos-i219 in MSI mode

Branch `toyos-i219-msi` on base `ed1ec1512`. Home paths are masked as `$HOME` and `$TMPDIR`.

| check | command | revision | exit | file |
|---|---|---|---|---|
| host checks | `cargo run -- --ci host` | `ad4b1f8492f46f7a9459583d3b4c134d0b477795` | 0 (77 steps green) | `host-ci.log` |
| x86-64 image | `cargo run -- --build-only` | `4b889564eb063399648201ad7ab0611b098fdfdf` | 0 | `build-only-x86_64.log` |
| AArch64 image | `cargo run -- --build-only --arch aarch64` | `4b889564eb063399648201ad7ab0611b098fdfdf` | 0 | `build-only-aarch64.log` |
| negative controls | `python3 -I mutations.py <tree> <dir>` | `4b889564eb063399648201ad7ab0611b098fdfdf` | see below | `negative-controls/` |
| T14 staging | `cargo test --test toyos-build -- --metal --metal-readback <dir> i219_messages_on_its_msi_vector` | `4b889564e` plus the guest lockfile that this build wrote, committed as `ad4b1f849` | 2, the harness's "staged, nothing judged" | `metal-readback-stage.log`, `request.txt` |

The only difference between `4b889564e` and `ad4b1f849` is `tests/guest/rust-tests/Cargo.lock`. That crate is not part of the host checks, and the images built before the lockfile was committed already resolved it the same way.

In `host-ci.log`, the line `a_commit_and_an_arm_cannot_both_miss ... FAILED` belongs to CI's own `control wake-fence-off` step. That control is expected to fail, and the run ends with `Host: 77 step(s), all green`.

## Negative controls

`mutations.py` applies each mutation to `system/netstack/i219/src/lib.rs` as a patch, builds it, runs the tests named for it, and restores the file, all in one run. Each `.patch` file is that mutation's diff, and each `.log` file is its build and test output. The summary is in `summary.txt`:

- In every case the build exited 0.
- Every named test exited 101 (failed) at its intended assertion.
  - m1 and m2: `the cause after the read raised no message`. m2 actually fails one step earlier: with the unmask at the end of a pass removed, the frame's own message never comes.
  - m3: `IVAR was written outside MSI-X mode`, together with the model's assertion that `0x000E4` was written on the PCH part.
  - m4 and m5: the dead-vector test and the stale-message test are answered `Ok`.
  - m6: `the error raised no message`.

Reverting the whole change cannot serve as the control for the host tests, because the new tests do not compile against the old `open`. The T14 row's IVAR-shaped write is the hardware control for the old read-back.
