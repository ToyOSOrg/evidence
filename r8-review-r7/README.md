# PR #1190, response to review r7 (head `46a355afbfc7b33c4d29800eeef34eee0f1ecd84`, on main `f9b5d7f12`)

- `logkeeper-tests.log`: `cargo test` in `system/logkeeper` on the working tree that became `46a355afb`: exit 0, 27 passed.
- `ci-host.log`: `cargo run -- --ci host` at `46a355afb` on a macOS arm64 host: exit 1, 1 of 110 steps red.
  - The red is `the build system: cargo test --lib`, in
    `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`: the test's
    `SDKROOT=/no/such.sdk` breaks macOS's `/usr/bin/git` wrapper. It is recorded on main as
    `issues/the-llvm-environment-test-breaks-git-on-macos.md`, and this branch changes nothing under `build/`.
  - The other 109 steps are green; `system/logkeeper`'s ran 27 tests.
- `guest-42909646699.log`: guest-rows run 42909646699 at `46a355afb`, x86-64 under KVM on the guest runner: exit 0, 3 passed
  (`the_log_lands_on_the_boot_stick`, `a_clean_stop_proves_its_image`, `acpi_mediated_access`).
  `acpi_mediated_access`'s guest stops on the probe's own sleep type; the run does not show the stop's flush with the
  opener unanswered.

Paths, the runner's user and machine name, and the runner's CPU model are masked.
