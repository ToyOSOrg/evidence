# #1123 r3: rebased onto main 3add613c1, head 8153b4b1d

- host-ci.log: `cargo run -- --ci host` at 8153b4b1d, rc=0, 107 steps green (the FAILED lines are the suite's own control runs, as at r2).
- fileserver-test.log: `cargo test -p fileserver` at 8153b4b1d.
- controls/: the #1120 port's two negative controls, patch and log each (both rc=101, both tests red), restored after.
- qemu/: testcases shared boot under QEMU x86-64 through `--debug` (scripts/qemu-members.sh), at 8153b4b1d; each member exit 0, pagerprobe ok.
- ab2/: the metal A/B at r2 (base 28a8aac17, head dd8821553 on 49559ddb2), T14 and AMD. p50.txt is base-1 head-2 base-3 head-4 per row. runs/*/*/results.txt are each boot's osbench, test and build lines (the rest of the kernel log is not published); verdict.txt the harness's verdict.
- request.txt: the metal boots staged for 8153b4b1d.
