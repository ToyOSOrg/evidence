# ToyOS PR 1178, round 1, at c4e22de0833dbf1be1de6beaae1f20124ed3c286 (macOS host, aarch64)

Paths masked: `$TMPDIR`, `$HOME`, `toyos-UID` (this user's id).

- `ci-host.log`, `ci-host.exit`: `cargo run -- --ci host`, exit 1; 107 of 108 steps green.
  The red step is the build system's `cargo test --lib`: the known
  `a_narrow_guest_does_not_overtake_a_wide_one_waiting` load flake
  (`issues/a-narrow-guest-test-reads-any-queue-holder-as-the-wide-waiter.md`), whose
  undeletable `buildlock-guest-cpus-queue-15` then made the process's last
  `TempDir` drop (in `the_primary_s_fork_checkout_is_moved_to_its_pin`) fail to
  remove its root.
- `isolated-{buildlock,sysroot}-{1,2,3}.log`: each of those two tests alone, three
  times at the same revision, exit 0 every time.
- `tmpdir-test.log`: `cargo test -p toyos-tmpdir`, exit 0.
- `negative-controls/`: each patch applied to the revision with `git apply`, built
  (`*.build.log`, exit 0), tested (`*.test.log`, exit 101), then reversed.
  - `m1-uid`: no owner check; `a_private_directory_another_user_owns_is_refused` red.
  - `m2-mode`: no mode check; `a_private_directory_with_another_mode_is_refused` red.
  - `m3-symlink`: `metadata` follows symlinks; `a_symlink_in_place_of_a_private_directory_is_refused` red.
  - `m4-shared`: roots made in the shared base; five `reclaim` tests red, among them
    `a_root_without_an_owner_goes_and_nothing_else_is_touched` on
    "a sweep took a root outside its user's private directory".
