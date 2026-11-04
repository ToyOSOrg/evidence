# pr-1150 r8: user copies through the process's own mapping (option c)

Head e23d11219; the kernel changes are 323a1f513 and 4856a502c; e23d11219 adds the AArch64
job-case registration only.

- `host-9.*`: `cargo run -- --ci host` at e23d11219, rc=0, 109 steps green.
- `pure-g.log.gz`: `cargo test -p kernel --lib -- paged:: pipe:: message::`, rc=0, 52
  passed, the new `an_abandoned_write_pin_grows_nothing_and_holds_nothing` among them.
- `*-323a1f513.log.gz`: the remote KVM host's machine tests at 323a1f513.
  - 8 of 9 red: the build refused a `syscall_entry` whose `cld` the new `clac` followed (the
    harness's one-instruction stack-switch window check).
  - 4856a502c moves `clac` out of `syscall_entry` into every other entry; `FMASK` already
    clears `AC` on `syscall`.
- `*-4856a502c.log.gz`: the same 9 machine tests at 4856a502c, 9 of 9 pass, the new
  `a_user_copy_faults_in_mid_copy_or_ends_as_bad_address` among them.
- `arm-1.log.gz`: AArch64 under HVF on the development Mac, run while it was silent
  (`virt_user_copy_faults`, `virt_readonly_copyout`, `virt_unmap_touch`,
  `virt_jobs_at_el2`): 4 of 4 pass.
- `*-s0a-probe-base-kvm.log.gz` and `*-s0a-probe4-kvm.log.gz`: the KVM A/B on the remote
  host, interleaved twice. Main + probe against head + probe; `remote6.sh`.
  - Every hot pipe and IPC row is better than main's, or inside its range:
    - `pipe.throughput.64` 100/102 against 84/81; `256` 388/390 against 332/313;
      `1024` 1367/1342 against 1165/1121; `4096` 4000/3891 against 2820/2779 (MB/s).
    - `ipc.reqrep.8` 8876/8815 against 10692/10773; `4096` 14925/9862 against
      16350/16348; `65536` 34156/34350 against 44025/43929 (ns).
    - `reqrep_handle.8` 14183/14133 against main's 15986/12710: inside main's range.
  - `SYS_MESSAGE_SEND` 1143-1358 ns a call against 1670-1799.
- `ab5-*`, `stage5.sh`, `benchnodata.py`: round 5's metal, staged and not run. The rules
  were set before any boot. Benchcase runs no DATA row in either arm (`benchnodata.py`).
