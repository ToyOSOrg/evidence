# Review r2 at 1b3ae6f5d (on main 4faea59a0)

- `host/ci-host.log`: `cargo run -- --ci host`, 101 steps, exit 0. It includes the new `files::the_empty_path_names_nothing` and `atreq`'s `the_empty_path_is_the_descriptor_only_with_at_empty_path`.
- `qemu/`: QEMU x86-64 interactive `--debug` boot at 1b3ae6f5d's sources.
  - `214_at_calls`, `211`, `206` and `210` match their `.expect`.
  - `std_fs` exits 0. Its new `the_empty_path_names_nothing` opens, stats and removes `""` from a working directory on `/tmp` and on `/home`, each `NotFound`.
  - `std_fs_write`, `stat_identity`, `an_export_shares_its_descriptions`, `empty_dir_stat` and `std_process` exit 0.
- `metal/judge-15cba97f2.log`: the orchestrator's T14 run of the `testcases` boot at 15cba97f2 (LENOVO 20W0003AMZ, BIOS N34ET71W 1.71). 12 of 12 passed.
