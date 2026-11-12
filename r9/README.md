# ToyOSOrg/ToyOS#1227, round 9: the landing run at b2946a672

`guest/red-b2946a672-run43156966054.log`: run 43156966054 at b2946a672, exit 1.
- Passed: `libc_children`, `virt_user_copy_faults` and `a_spawn_from_an_image_frees_it_when_the_child_ends`.
- `testcases_members_exit_0` reports 240 of 242 members exiting 0. The two that did not:
  - `test_rs_abuse_listener_hijack`: `connect` on an acceptor is answered `PermissionDenied` where the test expects `InvalidArgument`. This is the raw kernel word (`SyscallError`), which this branch reads but does not produce.
  - `test_rs_adopted_services_stay`: the adopter child ended 101. Its backtrace shows `assert_failed::<Vec<&str>, [&str; 1]>` in its `main`, which is the assertion, after `std::os::toyos::fs::adopt_services`, that `toyos::endow::services()` lists `fs:/system`. Its spawn had succeeded, and its first assertion (no service endowed) had passed.

Why neither is this branch's:
- Neither the kernel nor `toyos::endow`'s adoption and `services()` is changed by this branch. In std's path, `adopt_services` is untouched, and `try_clone_to_owned` only maps its error through the one table now.
- `Helper::spawn` differs from main's in only three ways:
  - the words of its refusals;
  - the working directory checked after the endowment table is built rather than before;
  - a names table past 64 KiB refused.
  For the test's spawns the child's block bytes are main's, since `startup::bytes` with the same arguments, environment and names produces them.
- Main's run of the same row, 43155677796 at 302fb3698 (this branch's base), will show whether main reds the same two.
