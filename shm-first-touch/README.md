# PR 1270: a shared-memory region draws each page's frame at its first touch

- `checks-1.sh` -> `checks-1.log` (an earlier model draft): the first `two_touches_keep_one_frame_and_give_the_other_back`
  assumed both touches always draw, which a touch after the install does not; the model was corrected to count draws.
  Kernel clippy (x86, x86 with actuators, aarch64, library) and `kernel-loom` clippy: exit 0.
- `models.sh` -> `models-1.log`, with the corrected model: `--test shm_slot` exit 0 (3 passed); with
  `--features slot-install-relaxed`: exit 101, `a_frame_is_handed_over_with_what_its_drawer_wrote` and
  `two_touches_keep_one_frame_and_give_the_other_back` fail on loom's causality violation; `kernel-loom` clippy exit 0.
- `checks-2.sh` -> `checks-2.log` at 14bc8a0f3 (the PR head): `cargo test -p toyos-build --lib ci::` exit 0;
  `cargo run -- --ci host models` exit 0, 84 steps all green, control `slot-install-relaxed` reaching both verdicts;
  kernel clippy for x86_64-unknown-none, x86_64 with `boot-actuators,test-actuators`, aarch64-unknown-none-softfloat
  and the library's tests: exit 0 each.
