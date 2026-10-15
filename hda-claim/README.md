# PR #950 — soundserver drives the HDA function through a pci claim

Revision: ToyOS 87f0b2aa0 (wt/toyos-hda), base 3b77b9b2f. Host: macOS, QEMU 11.1.1.

| check | file | exit |
|---|---|---|
| `cargo run -- --ci host` at 87f0b2aa0 | host/ci-host.log | 0, 86 steps green |
| `cargo run -- --build-only` (x86-64), `--arch aarch64`, tree 3201c106 = 87f0b2aa0 | image/ | 0, 0 |
| `cargo test --test toyos-build -- --nocapture hda_drives_its_codec_through_its_claim` | qemu/hda_drives_its_codec_through_its_claim.log | 0 |
| control: wrong-codec refusal removed, `cargo test -p toyos-hda` | controls/mutation-wrong-codec.* | 101, an_answer_from_another_codec_is_refused red |
| control: RIRBCTL.RINTCTL masked, the QEMU row | controls/mutation-no-rintctl* | 1, ring stalls after one verb, null sink |
| metal staging, `--metal --metal-readback <dir> hda_tone hda_volume_step` | metal/ | 2 (staged, nothing measured) |

Exploratory, not rows: qemu/exploratory-* are the tone jobs on QEMU's ich9-intel-hda before the row was
narrowed. audio_tone passed (exit 0, ~699 completions per 2 s, underruns=0) at host load ~22; audio_tone and
audio_tone_resampled exit 101 on cpal's fixed close bound ("did not let go of the closed stream within 29 ms")
with bursty, host-paced completions (max_batch=7; load averages 22 and 101).
