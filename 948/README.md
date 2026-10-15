# PR #948 evidence

Branch commit b50d5cb3e528c361742d9ad2535b937a95fa41f2; merged head 394dc5e7dc887bacfe9a426336951af15ffa94dd.
Paths, the throwaway signing key fingerprint and the worktree's parent directory are masked.

| file | command | exit | revision |
|---|---|---|---|
| build-x86_64.log | cargo run -- --build-only | 0 | b50d5cb3e |
| build-aarch64.log | cargo run -- --build-only --arch aarch64 | 0 | b50d5cb3e |
| build-x86_64-merged.log | cargo run -- --build-only | 0 | merged head |
| ci-host.log | cargo run -- --ci host (86 steps) | 0 | b50d5cb3e |
| qemu-x86_64.log | cargo test --test toyos-build -- nvme_disk_boots machine_shutdown_short_stop lent_device_memory_refused | 0 | b50d5cb3e, QEMU x86_64 |
| metal-stage.log, metal-request.txt | cargo test --test toyos-build -- --metal --metal-readback <dir> app_view std_fs stat_identity fs_truncate_persist stream_handles file_mtime empty_dir_stat lent_window_refused | 2 (staged, no machine touched) | merged head |
| negN.patch / negN.log | git apply negN.patch; cargo test ...; git apply -R | 101 each (red, as intended) | b50d5cb3e |

Negative controls: neg1 removes ResourceExhausted from toyos::fs::Error::kernel (red: every_kernel_refusal_the_calls_can_see_is_one_named_error);
neg2 removes InvalidArgument from pci-claim's Why::of (red: every_kernel_refusal_a_claim_call_can_see_is_one_named_reason);
neg3 maps FAT's Io to NotFound (red: three fat tests); neg4 reads an unknown status as Io instead of Malformed (red: a_reply_outside_the_protocol_is_malformed).
