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

r2/ (review round 1, at 01e092da8, the amended commit; every log's diff hash is e3b0c44298fc1c14, the clean tree):
r2/host/                     toyos-metal's tests (77 passed) and clippy (exit 0)
r2/mutations/                six mutations, each failing its test (exit 101), and the restored tree passing; new:
                             unstarted-255-ridden (a 255 with no `rebooting` line ridden) and reboot-255-refused
                             (a 255 after it refused)
r2/bounds/slowest-flash.txt  the slowest flash and the slowest log read the transfer bounds rest on

metal/ (the AMD bench, 2026-11-11 17:18-17:26Z, both flashes of boot:testcases staged at #1254's 307457007, run
through this branch at 01e092da8): the loop's own lines of each flasher log, masked, the boot's log text and
the machine's SMBIOS line left out. Both exited 0 (the queue runner's rc=0, the loop's PASS), with no Expired
and no Untaken; each reboot was `echo rebooting && sudo -n '/usr/sbin/reboot'` answered cleanly; every piece
printed its dd seconds against its bound, the largest share 17.4 s of 1208 s. The two readbacks were deleted
before a judge read them, so wall_clock_is_firmwares was not judged. The T14's two flashes never ran.

r3/ (review round 2, at 636b71537, which db7f1e57f differs from only in an issue record): toyos-metal's
tests (77 passed) and clippy (exit 0) with a failed --delete-bootnext now printed.
