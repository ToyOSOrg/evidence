# pr-1150 r9: rebased onto main e11b6a784 (#1152 merged)

PR head `e43c7cfea` (`5c600a4ae` plus two comment lines naming the Spectre v1 issue by
its name on main). Local identifiers are masked.

## Host
- `host-ci-e5c600a4ae.log`: `cargo run -- --ci host` at `5c600a4ae`, rc=0, "108 step(s), all green".
  `e43c7cfea` changes two comments only, so the run stands for it.
- `host-ci-pre-1-rust-pin.log`: the first run on the rebased tree, rc=101. The worktree's rust
  checkout sat at the old fork pin; moved to the pin the build names, as its message says.
- `host-ci-pre-2-clippy-red.log`: the second, rc=1, kernel clippy red on both targets: a merge
  type error in `object/paged.rs`, an unused import, and six results unused at copy sites main
  added after the base (namespace names, last words, the device set, getcwd).
- `kernel-clippy-after-fix.log`: the kernel's clippy over both targets and three feature sets
  after those fixes, each rc=0.

## Guest rows, on the guest runner
`guest-rows-41968136861.txt`: the harness's lines from
https://github.com/ToyOSOrg/ToyOS/actions/runs/41968136861, at `5c600a4ae`, one dispatch.
14 of 14 pass: the x86 machine tests `a_user_copy_faults_in_mid_copy_or_ends_as_bad_address`,
`the_uart_carries_the_log_again_once_the_console_carrier_goes`,
`a_spawn_from_an_image_frees_it_when_the_child_ends`, `stream_holders`,
`a_link_ends_under_a_held_stream_and_comes_back`, `a_client_killed_mid_connect_gives_its_place_back`,
`session_lifecycle`, `a_launch_gives_each_unsent_stdio_slot_a_null`,
`std_threads_count_the_cpus_and_give_back_ended_threads`, and the AArch64 rows
`virt_user_copy_faults`, `virt_readonly_copyout`, `virt_unmap_touch`, `virt_jobs_at_el2`,
`virt_pan_refuses_el1_a_user_page`.

## KVM A/B, on the guest runner
`kvm/`: `osbench_capability_groups_exit_0 --nocapture`, interleaved base, head, base, head:
- base `s0a-r9-base-kvm` 51ed02074 = main e11b6a784 + the probe;
- head `s0a-r9-head-kvm` f6dc70873 = 5c600a4ae + the probe.
Runs 41968276398, 41968286451, 41968296835, 41968306959, each PASS. `kvm/table.txt` lists
every row's p50 and whether head moved past both base values. Every hot row moved better.
Four other rows moved worse, all under the rules' 5% line and none a pipe or IPC row:
`syscall.null` +2.5%, `thread.spawn_join` +2.3%, `mem.bw.write` -2.8%, `mem.anon.total` +0.5%.

## Metal round 5, restaged
`ab5/`: the rules (set before any boot), the request, the image hashes and the staging logs.
Staged with `--metal-readback`; no machine touched.
