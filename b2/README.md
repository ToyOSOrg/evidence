# PR 1032: the bcachefs engine's reader and mkfs replace upstream/ (storage B2)

Branch `storage-b2`, head 62873ce76, two commits on `main` 63bc8a32b: a726d52c1 (`toyos-crypto`) and 62873ce76 (the engine). Until B1 and K1 landed the same two patches sat on B1 and a merge of K1 as 57922d035 and ce79d062e; `git range-diff` shows them identical, and `main` changed nothing under `lib/bcachefs`, `lib/crypto` or `lib/blockdev` between the two bases.

## Host

- `host/ci-host-62873ce.log`: `cargo run -- --ci host` at 62873ce76, exit 0, all 101 steps green. It runs the engine's tests among them.
- `host/ci-host-3843a01-red.log`: the same at an earlier revision, exit 1, 2 steps red. Two `redundant_clone`s under the adopted lints, and NOTICE's fixture section carrying three SPDX lines instead of one. Both are fixed in ce79d062e.

## Build

- `build/build-only-62873ce.log`: `cargo run -- --build-only` at 62873ce76, exit 0.

## Negative controls

Each control was applied as the patch beside it at ce79d062e, built, run with `cargo test -p bcachefs --lib <filter>`, and the file restored, as `controls/run.sh` does. The patched files are identical at 62873ce76.

| patch | what it breaks | result |
|---|---|---|
| `m1-skip-extent-mac.patch` | the reader ignores an extent's MAC | exit 101; only `a_flipped_byte_in_an_encrypted_extent_or_node_fails_its_mac` red |
| `m2-no-bset-stamp-check.patch` | fsck ignores a bset stamped past `clean` | exit 101; only `a_journal_sequence_stamped_past_clean_is_found` red |
| `m3-no-inode-stamp-check.patch` | fsck ignores an inode stamped past `clean` | exit 101; only `a_journal_sequence_stamped_past_clean_is_found` red, at its inode assertion |
| `m4-unauthenticated-node.patch` | the reader takes a crc32c node on an encrypted volume | exit 101; only `a_node_without_a_mac_on_an_encrypted_volume_is_refused` red |

## The upstream judge

The guest was bcachefs-tools v1.39.4 (commit d997ad76e906, `git status` clean, built from the tag with `make BCACHEFS_FUSE=1`) on the Ubuntu 26.04.1 arm64 cloud image (sha256 `8eb876c2…a24`), kernel 7.0.0-38, under QEMU/HVF.
- `judge/vm/`: the host launcher, the cloud-init seed (public key elided) and the guest's build log.
- `judge/gen/`: the program that wrote the judged volumes from the engine's `mkfs` with fixed seeds, and their hashes. At 62873ce76 it writes byte-identical images (`SHA256SUMS` matches), so the judgement applies to the head.
- `judge/scripts/lib.sh` is the logger. Each command's stdout, stderr and exit status are in `judge/logs/<run>/NN.{cmd,out,err,exit}`, and `verdicts.txt` collects each fsck's verdict. A verdict is the storage design's judge rule: exit 0, and none of the markers in `lib.sh` in either stream.

Runs:
- `judge/logs/unencrypted`, `summary-b2-volumes.txt`: `root-32m` and `root-1g` pass. So does each after an upstream FUSE mount (BB-A1-1's recipe), after a second mount writing `seq 1 40000` and a file, and after a third that reads them back (`contents-ok`).
- `judge/logs/encrypted`: `data-64m` and `data-1g`, unlocked with `bcachefs unlock -k session -f pass` in fsck's session keyring, pass with stdin closed. So do they after an upstream mount writes and reads back. With no key, fsck exits 1 (`error reading passphrase`); the passphrase through stdin passes; a wrong secret is `Error: incorrect passphrase`, exit 1.
- `judge/logs/controls`, `summary-controls.txt`: BB-A9-1's set on a fresh upstream format, and the same damage done to `root-32m`. Every damaged image fails, and both clean ones pass. bad5 failed to apply there: its position parse missed, kvdb exited 1, and the image stayed clean.
- `judge/logs/controls-bad5`: bad5 rerun with the parse fixed, which fails as it should.
- `judge/logs/controls-enc`: `data-64m` with its inodes node's MAC broken, and with a flipped byte. Each fails, and the untouched copy passes.

Masked throughout: home directory and scratch paths.
