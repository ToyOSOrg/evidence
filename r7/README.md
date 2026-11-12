# ToyOSOrg/ToyOS#1227, round 7: rebased onto #1252, and the names table's bound

Head b2946a672, on main 302fb3698. #1252 made a child's handles a list its parent names, and put the names into the startup block.

**Resolutions** (`range-diff-a92cc309e-b2946a672.txt`):
- `_SC_ARG_MAX` commit, `startup.rs`: #1252's layout is kept: a first word for the names' address, the count, the pointers, the strings and then the names. This branch's `WORD` names the words, and `bytes` is crate-visible. `MAX_ARGS` subtracts two words (the names' address and the count) where it subtracted one.
- Review r1 commit, `spawn.rs` `Helper::spawn`: #1252's endowment table is kept: the caller's endowments, inherited services and descriptors, by name. This branch's words are applied to its refusals:
  - more endowments than a spawn carries is `TooBig`;
  - two under one name, or one under none, is `Invalid`;
  - a block past its reservation is `TooBig`;
  - a layout is `NotExecutable`.
  `starting_block` now also takes the names, and `Block::new(&said, s.job)` takes #1252's job. #1252 removed the label machinery this branch had relabelled, and that hunk is #1252's. `startup.rs` keeps #1252's `table` and drops `startup::Refused`. The two guest tests build their block with `startup::bytes(.., names)` (`image.rs`'s `laid_naming` is #1252's).
- Review r2 commit: `Said` wraps #1252's block and its tests unwrap it.
- **New commit**: a names table is at most `startup::MAX_NAMES` (64 KiB), refused as too big past it. `MAX_ARGS` leaves that share out, so a caller's `MAX_ARGS` bytes fit whatever a spawn endows. `_SC_ARG_MAX` is 2023395, and `206_libc_refusals.expect` and the owed-on-metal record say so.

**Checks at b2946a672:**
- `host/b2946a672/`: `cargo test -p toyos`, both toyos clippy shapes, `cargo test -p toyos-libc-copies` and its clippy: all exit 0.
- `controls/max-args-{under,over,no-names}`: `MAX_ARGS` one byte smaller, one byte larger, and without the names table. Each fails the test (exit 101) at "one byte past MAX_ARGS", "a caller's MAX_ARGS bytes" and "a caller's MAX_ARGS bytes" respectively.
- `build/build-testcases-b2946a672.log`: `cargo run -- --build-only --boot-config tests/images/testcases.toml`, exit 0. It built std and libc in the sysroot and the testcases image, but not the rust-tests crate, which the guest run below builds.
- Guest: run 43156966054 at b2946a672, `libc_children virt_user_copy_faults a_spawn_from_an_image_frees_it_when_the_child_ends testcases_members_exit_0`. Run 43122100459 at 96b79b6c4 was cancelled: the spawn path changed under it.
