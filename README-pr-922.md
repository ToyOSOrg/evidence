# PR #922: bench audio rows run with soundserver's master muted

Landed as ace211721d27f8d83bf56a9eb039d10f93f36e26. The evidence below was taken at the PR head
b12256569cc7639ac48a259d09eb7f9c38d057c0 (branch toyos-quiet-bench, with origin/main 4e11ebc10dfbcc83b632a6539fc2a7131ea3c0b7 merged in).

## Proof boots: one `tests/images/testcases.toml` boot per bench

| Directory | Machine | Image sha256 | Rows | Verdict |
|---|---|---|---|---|
| boot-t14 | the T14 | fb1ed674159ce3094924577217d6e694b43d6a78de097bf9e6367978670ddeab | hda_tone, hda_tone_resampled, hda_volume_step | all three PASS, judge exit 0 |
| boot-amd | the AMD bench | 5a00c281660a974cbe26c5273d888b8b2ee6b8808b182facc6b8fb2b752b5f4d | hda_tone, hda_tone_resampled, hda_volume_step | all three PASS, judge exit 0 |

The images were staged with `cargo test --test toyos-build -- --metal --metal-readback <dir> [--metal-host '<user>@<amd-bench>'] hda_tone hda_volume_step`.
Both stagings exited 2 (Staged); their logs are `host/stage-*.log`. The orchestrator booted each image with
`toyos-metal` and judged it with the same command against the readback (`runner-manifest.txt`, `runner.log`
and `judge-q.log`: `boot rc=0`, `judge EXIT=0`).

Each boot's `testcases/kernel.log` holds 10 `master:` readbacks from the codec, four of them `muted 1`: each tone
job mutes the master at its bottom before it plays (position 22 of 22 on both benches); `volume_step` steps to 21
and back to 22 and mutes again. Neither tone job's stream ran unmuted.

## Host checks

`host/ci-host.log` holds `cargo run -- --ci host` at b12256569: 77 steps, all green, exit 0. It includes
`toyos-hda` `config::tests` and soundserver's `volume::tests`.

## Masking and omissions

Every text file was passed through the orchestrator's mask: vendor, model, BIOS (with its suffix), USB serials,
paths, IPs and MACs are replaced by placeholders, and `boot.txt`'s `machine_*` values read `<masked>`.
The files are otherwise whole. Neither `image.img` nor `log-partition.img` is published. The image is a build
product identified above by its sha256. The log partition is the raw FAT volume behind `kernel.log` and
`loader.log`, and it holds the unmasked machine identifiers.
