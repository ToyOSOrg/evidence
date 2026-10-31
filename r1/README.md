# #1110 review r1

Head b08f7362d (host CI and the QEMU run at 78e7ffc80, whose tree differs only in one issue-record link).

- `host.log`: `cargo run -- --ci host` at 78e7ffc80, exit 0, 105 steps green.
- `qemu/`: `served_file_offset` and `an_export_shares_its_descriptions` on QEMU x86-64, the testcases shared boot through the harness's `--debug` mode at 78e7ffc80 (the only QEMU runner discovered members have), both exit 0.
- `readdir/`: osbench of the measured base (b3dbfbfb0) and head (cd91fb835, whose stage-1 diff equals 1293be570's) compared function by function over the readdir call graph, addresses, crate hashes and anonymous-constant names masked (`cmpfn.py`, `showdiff.py`). 66 functions identical; `toyos_fs_open` and `toyos_fs_write` changed by the stage (the open runs once per 1000-entry listing); `toyos_fs_readdir` and `from_dir` differ by one instruction each (`Held`'s variant test reads a niche byte, `cmpb $2, 0x40(%r12)`, for `cmpl $1, 0x10(%r12)`, and one inverted branch). Every hot function sits at another 64-byte offset (`addresses.txt`).
