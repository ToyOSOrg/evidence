# ToyOSOrg/ToyOS#1227, round 5: rebased onto #1259

Head 96b79b6c4, on main 75bdec3cd (#1259: a memory object's range is mapped where the caller says).

- **The conflicts**: three hunks, each one line pair:
  - `Helper::spawn` in `sdk/toyos/src/spawn.rs`;
  - `tests/guest/rust-tests/src/bin/spawn_image_object.rs`;
  - `tests/guest/rust-tests/src/image.rs`.
  #1259 changed `lay_out`'s third argument from a handle to a `Source` (`image.source()`, `Source::Copied(..)`). This branch changed the line before it (the block from `startup::bytes`'s `Said`) and `lay_out`'s refusal word (`Refused::NotExecutable`). Each resolution keeps both: the `Said` block, `lay_out` with #1259's `Source`, and `NotExecutable`. Every refusal `lay_out` has on main is still a property of the image (`ELF: …`), so `NotExecutable` stays true for all of them. No name this branch removed is used on main, and no file other than these three conflicted.
- `host/96b79b6c4/`: `cargo test -p toyos`, both toyos clippy shapes, `cargo test -p toyos-libc-copies` and its clippy, with the adopted lints and `-D warnings`: all exit 0.
- Guest: run 43122100459 at 96b79b6c4 (`libc_children virt_user_copy_faults a_spawn_from_an_image_frees_it_when_the_child_ends`), dispatched; its headSha is 96b79b6c4. Run 43107765943 at f341be8d9 was cancelled unrun.
