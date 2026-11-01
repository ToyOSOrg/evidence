# #1123 review r4, head 0992ed804 (and 683c56c1a beneath it)

- host-ci.log: `cargo run -- --ci host` at 0992ed804, rc=0, 107 steps green (the FAILED lines are the suite's own control runs, as before).
- fileserver-test.log: `cargo test -p fileserver` at 0992ed804, 107 passed.
- controls/: each applied as a patch, run, restored.
  - control-c: `Files::write` cuts back by `truncate` again; `pages::tests::a_write_refused_in_a_hole_gives_back_the_block_it_took` fails (rc=101).
  - control-d: `Writes::write` reads below the old size again; `data::tests::a_write_in_part_into_a_hole_reads_zeros_around_it` fails, "page 1 reads 0xab" (rc=101).
  - control-e: `Files::write`'s page in part reads below the old size again; `pages::tests::a_write_in_part_into_a_hole_supplies_zeros_around_it` fails, "a holder reads another file's bytes" (rc=101).
- ab3/{t14,amd}/: the testcases boot at 8153b4b1d on each bench (built 8153b4b1d). judge.log is the offline `--metal-readback` judgment, rc=0, 3 passed each; results.txt the boot's build, test and pagerprobe lines (the rest of the kernel log is not published); verdict.txt the harness's.
- request.txt: the testcases boot staged for 0992ed804.
