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
