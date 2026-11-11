Evidence for ToyOSOrg/ToyOS#1254 (metalrows): a metal row declares its benches, a boot names its
bench, and judges name the one they judged. Every log opens with its revision and the hash of the
working tree's diff against it (e3b0c44298fc1c14 is the empty diff). Paths are masked; no readback's
SMBIOS strings are published here.

host/             at fbe836956: cargo test -p toyos-metal (77 passed), cargo test --test toyos-checks
                  (49 passed), clippy -p toyos-build -p toyos-metal --all-targets with the workspace's
                  adopted lints and -D warnings; exit 0 each
plans/            --metal --list for main (at f79df9574, from the metal-ssh-bounds worktree, whose one
                  commit touches no row), the T14 and the AMD bench; compare.txt is plancmp.pl's reading
                  of them: the T14's plan is main's less the AMD bench's three jobs, in main's order
old-readbacks/    two readbacks written before this change (one per bench; kept off this repository
                  because their boot files carry SMBIOS strings) judged at fbe836956: each judged as the
                  bench its boot names, the AMD one leaving the I219 row out by name
negative-control/ the I219 row declared for every bench, applied as a checked patch: the AMD readback's
                  judge reds it ("test_rs_pci_reclaim exited 1 on the AMD bench") and two host tests fail;
                  reverted, the metal host tests pass
staging/          boot:testcases staged per bench at fbe836956 (exit 2 is the harness's "staged, not
                  judged"); the machine was not touched

r2/ (review round 1: rebased onto main b0533900e, then 307457007; every log opens with its revision and
the diff hash e3b0c44298fc1c14, the clean tree):
r2/host/              cargo test -p toyos-metal (77 passed), cargo test --test toyos-checks (49 passed),
                      clippy on toyos-build and toyos-metal (exit 0), and the build system's own lib tests,
                      cargo test --lib: 384 passed and 1 failed, llvm::tests::the_caller_s_environment_
                      reaches_neither_the_build_nor_the_key, the macOS git/SDKROOT defect recorded in
                      issues/the-llvm-environment-test-breaks-git-on-macos.md, in a file this PR does not touch
r2/negative-control/  target_of with the other bench's machine allowed (host-unchecked) and with the T14's
                      machine as every bench's default (t14-by-default, the defect review found): each
                      fails the harness tests; restored, they pass
r2/plans/             both benches' plans at 307457007, identical to plans/list-{t14,amd}.out
r2/staging/           boot:testcases staged again per bench at 307457007 (exit 2: staged, not judged);
                      every invocation names its --host, the T14's too

r3/ (review round 2: rebased onto main be76e6f85, head 4e529a08c; logs on the clean tree):
r3/range-diff.txt     git range-diff of the branch before (on b0533900e) and after: the review commit is
                      unchanged (=), and the first commit differs only in the four screen tests #1247 edited
r3/armcmp.txt         each of the four moved functions equals main's run_screen_test arm at be76e6f85
                      (armcmp.pl, leading whitespace stripped, `name` read as the literal); the branch
                      before this rebase, the control, differs in all four
r3/toyos-rs-against-main.diff
                      git diff origin/main 4e529a08c -- tests/toyos.rs, the whole of the PR's change there
r3/merge-tree.txt     the head merges with origin/main dda500c39 without a conflict
r3/toyos-build-compiles.log, r3/toyos-checks.log
                      cargo test --test toyos-build --no-run (exit 0), cargo test --test toyos-checks (49 passed)

r4/ (rebased onto main e10b6fd49; logs on the clean tree):
r4/range-diff.txt   the branch on be76e6f85 against the branch on e10b6fd49 (149aaf72e): the review commits
                    unchanged, the first commit differing where main renamed a machine test (#1241) and
                    changed virt_user_mode's arm and the spawn record (#1238)
r4/moves.txt        every machine test's MACHINE_TESTS entry equals main's run_machine_test arm (machcmp.pl;
                    two differ only by a trailing comma inside the call), and the eight moved screen tests
                    equal main's arms (armcmp.pl); each with a control against main before the change
r4/toyos-metal-tests.log, r4/clippy.log
                    at 149aaf72e: 77 passed; clippy on toyos-build and toyos-metal exit 0
r4/toyos-checks-before-fixtures.log
                    at 149aaf72e: 49 passed, 1 failed: the fixture readbacks, written before #1238, carry
                    spawn records its readers no longer read
r4/toyos-checks.log, r4/toyos-build-compiles.log
                    at b7a90efc1, the fixtures' spawn and supervisor lines in main's form: 50 passed; the
                    harness compiles

r5/ (rebased onto main d17f22cc3, head cba026be9; logs on the clean tree):
r5/range-diff.txt   the branch on e10b6fd49 against the branch on d17f22cc3: the three review commits
                    unchanged, the first commit differing only where #1244 added a machine test and gave
                    a_user_copy_faults_in_mid_copy_or_ends_as_bad_address its kernel parameters
r5/moves.txt        every MACHINE_TESTS entry equals main's run_machine_test arm (two differ only by a
                    trailing comma inside the call), with main before #1244 as the control; the eight moved
                    screen tests equal main's arms
r5/checks.log, r5/metal-unit.log, r5/build-compiles.log, r5/clippy.log
                    cargo test --test toyos-checks 50 passed; cargo test -p toyos-metal 77 passed; the
                    harness compiles; clippy on toyos-build and toyos-metal in the workspace's shape, exit 0
