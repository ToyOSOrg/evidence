# Review r1 at 15cba97f2 (on main 4faea59a0)

- `host/ci-host.log`: `cargo run -- --ci host`, 101 steps, exit 0.
- `qemu/`: QEMU x86-64 interactive `--debug` boot at 15cba97f2's sources. `214_at_calls`, `211`, `206` and `210` match their `.expect` (the `.out` files are the stdout compared). `std_fs`, `std_fs_write`, `stat_identity`, `an_export_shares_its_descriptions`, `empty_dir_stat` and `std_process` exit 0.
- `qemu/earlier-std_fs-red.txt`: `std_fs` red on an intermediate tree, where a failed kernel open of a directory was answered `EISDIR`, which hid `create_new`'s `AlreadyExists`. That mapping was removed before the commit.
- `build/`: the T14 `testcases` request, staged with `--metal-readback`. The `boot:testcases` filter also staged `testcases-watchdog`, which was dropped from the request.
