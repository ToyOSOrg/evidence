# Evidence for ToyOS #1280

- `r14/`: at 0df33fdf3, a clean tree (`summary.txt`, the commands in `checks14.sh`): the image, the host suites of the
  crates #1252 touched, every kernel clippy shape of `build/clippy.rs`, and clippy on `toyos`, the libraries and the
  ABI. Each log ends with its exit; all exit 0.
- `fix/kcheck.log`: `cargo check -p kernel --target x86_64-unknown-none` with the `get_sent` change, before the commit.
- `guest-run-43162379536.txt`: `testcases_members_exit_0` (242 members exit 0), `a_launch_gives_each_unsent_stdio_slot_a_null` and `session_lifecycle` at bd1a044e3, the head 8daef7f50's tree: all pass. The control at main 302fb3698, 43155677796, was cancelled before it ran.
