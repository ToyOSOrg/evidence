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
