Evidence for ToyOSOrg/ToyOS#1255 (metal-ssh-bounds): every ssh the metal loop runs ends.

host/toyos-metal-tests.log   cargo test -p toyos-metal at the PR's tree (77 passed, exit 0)
host/toyos-metal-clippy.log  cargo clippy -p toyos-metal --all-targets with the workspace's adopted lints, -D warnings (exit 0)
host/ssh-options-and-tcp-keepalive.log
                             the development host's OpenSSH parses the two new options (ssh -G, no connection),
                             and its TCP keepalive starts after 7200 s idle
mutations/*.patch, mutations/mutants.log
                             five mutations, each applied as a checked patch, built, its test run and failing
                             (exit 101), then reverted; the restored tree's tests pass
spec/uefi-2.10-bootnext.txt  the UEFI text the BootNext check rests on

Each log opens with the revision and the hash of the working tree's diff against it; every log here
was taken at a tree whose diff hash equals the PR commit's diff against its base (c3413c490a3fc089).
Paths are masked.
