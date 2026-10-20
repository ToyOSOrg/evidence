# PR #953 — audio leaves soundserver for an hda driver per controller

Revision: ToyOS aa7767b5f (wt/toyos-hda-2), base 0e6716fc0. Host: macOS, QEMU 11.1.1 (x86-64 guests under TCG).

| check | file | exit |
|---|---|---|
| `cargo run -- --ci host` (tree before the last header-comment and Cargo description edits) | host/ci-host.log | 1: 85 of 86 green; the red is `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, red on origin/main 0e6716fc0 too (host/main-llvm-environment-test.log, exit 101) |
| `cargo run -- --build-only`, `--arch aarch64` | image/ | 0, 0 |
| `cargo test --test toyos-build -- --nocapture hda_plays_to_the_controller_that_reaches_an_output` | qemu/hda_plays_….log | 0 |
| exploratory, not a row: the same boot running `audio_tone` | qemu/explore-tone.* | 0; 699 completions per 2 s window, underruns=0 |
| control: RIRBCTL.RINTCTL masked, the QEMU row | controls/mutation-no-rintctl.* | red: both drivers play nothing, the row stalls on soundserver's verdict |
| control: an offer's rate check removed, `cargo test -p toyos-sound-output` | controls/mutation-offer-rate.* | 101 |
| metal staging `--metal --metal-readback <dir> hda_tone hda_volume_step` | metal/ | 2 (staged, nothing measured) |

Inputs: ci/ is the GitHub guest job that went red on #950 (run 38727776749): soundserver's
`hda path configured` line fell between the ready marker and the job's window, while `volume_step`
exited 0 with the codec's readbacks. metal/t14-87f0b2aa0-kernel.log is the T14 readback of #950's
image (serial masked): `PCI 00:1f.3 [0403] vendor=8086 device=a0c8 prog_if=80` and
`supervisor: soundserver: no pci:04:03:00 on this machine`.
