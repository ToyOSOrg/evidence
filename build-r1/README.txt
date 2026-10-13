PR #906, build round 1. Paths are masked: $WORKTREE is the PR's worktree, $SCRATCH the
agent's scratch directory, $HOME and $TMP the host's. Each log's first line is the
revision it ran at, its last line "EXIT <code>" the command's exit status.

The code under test is one commit. It was built and host-checked as 866d1788f on
origin/main ef684e4fc, then rebased onto 759623914 (#907, which changes CLAUDE.md and
one issue file and no code) as 5596d7b7e; `git diff 866d1788f 5596d7b7e` is exactly
#907's two files, so every result below at 866d1788f holds for 5596d7b7e.

build-only-1.log            cargo run -- --build-only, at the working tree that became
                            866d1788f (all code in it), EXIT 0.
ci-host-1.log               cargo run -- --ci host at 866d1788f: 76 steps, all green, EXIT 0.
guest-acpi_mediated-1.log   cargo test --test toyos-build -- acpi_mediated_access
                            acpi_lock_given_back_on_one_cpu at 866d1788f, QEMU q35 x86_64
                            (2 and 1 CPUs), test kernel: 2 passed, EXIT 0.
mutations/                  mutations.py applies each mutation as a checked unique
                            replacement, runs the named cargo test, restores the file with
                            git checkout and asserts the tree clean at the end.
                            summary.txt: all 12 exit 101 with the crate built; each
                            M*.log names the tests that went red. revision.txt: 866d1788f.
control-host.log            negative control on the host: base sources of lib/userbound,
                            sdk/abi and Cargo.lock (origin/main ef684e4fc) under the head's
                            lib/userbound/tests/firmware.rs: does not compile (39 errors,
                            each a fence or type the base lacks), EXIT 101.
stage-head.log              --metal --metal-readback staging of the T14 head rows at
                            5596d7b7e (acpi_tables_loaded battery_read acpi_server_events
                            counters): 2 boots staged, EXIT 2 (the harness's "staged, not
                            judged"). stage-head-866d1788f is the same before the rebase.
stage-head-amd.log          the AMD bench's head row (acpi_tables_loaded), 5596d7b7e.
stage-control*.log          the whole change reverted: origin/main 759623914, T14 and AMD.
request.txt                 the run request handed to the orchestrator, with judge words.
