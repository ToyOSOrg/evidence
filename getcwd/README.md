# PR 1182: the kernel keeps no working directory

| file | command | revision | exit |
|---|---|---|---|
| host3.log | `cargo run -- --ci host` | baedeb48d (issue markdown of 34c11dea7 in the tree for the run's later reads) | 0, 108 steps green |
| host.log | `cargo run -- --ci host` | dd05bf55d + the uncommitted first cut | 1: clippy `slow_vector_initialization` in owner.rs, fixed in 0b66e1691; the proclife reds in it are CI's own mutation controls |
| build.log | `cargo run -- --build-only` | baedeb48d | 0 |
| files-tests.log | `cargo test -p toyos --lib files::tests` | 0b66e1691's tree | 0 |
| control-keep-pwd.log | the same with mutate-keep-pwd.patch applied (`starting_in` keeps an inherited PWD), then restored | 0b66e1691's tree | 101: `a_child_starts_where_its_spawn_says_and_nowhere_its_environment_said` red |
| clippy-fdtable.log | `cargo clippy -p toyos --lib --features fd-table -- -D warnings` after the fix | 0b66e1691's tree | 0 |
| metal-prep.log, metal-request.txt | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal app_view mask_windows std_fs` | 34c11dea7 | 2 by design: staged, no machine touched |

Guest rows (guest-rows.yml): https://github.com/ToyOSOrg/ToyOS/actions/runs/41993283834 at 34c11dea7, 9 of 9 green:
console_image_boots, libc_children, session_lifecycle, a_launch_gives_each_unsent_stdio_slot_a_null,
a_row_reaches_its_own_state_and_no_other, a_spawn_from_an_image_frees_it_when_the_child_ends,
virt_user_mode, virt_smp, virt_readonly_copyout.
An earlier dispatch (run 41991594542) named shared-boot binaries, which a filtered QEMU run does not boot,
and was refused before any boot ("No test matches filter").
