# #1057, round 7: rebased onto `eba9e8eac`

The branch's commits were squashed into one, `38f3c282b`, and rebased onto `eba9e8eac` (main, after #1061). The pre-rebase head was `825114d83` plus an issue-text commit. Paths are masked.

Conflicts resolved:
- `kernel/src/pipe.rs`: main made a pipe an `Arc` with its state behind a lock. The pipe's `Charge` is now named, and its ring is allocated for that charge's job (`State::back(job)`), the creator's, as before.
- `kernel/src/object/shm.rs`: main added `Backing::Sub`; a run is the branch's job-counted `pmm::Run`.
- `sdk/abi/src/syscall.rs`: main's `SYS_SHM_SUB` took 143. `SYS_JOB_FLOOR` is 144, `SYS_ACCOUNT_INFO` 145, and the profile has 147 bins.
- `sdk/toyos/src/files.rs`: main's server-held image object comes first. The copy fallback is read for the child's job.
- `sdk/std/sys/process.rs`: the comments merged.

| file | command | exit |
|---|---|---|
| build-only.log.gz | `cargo run -- --build-only` | 0 |
| ci-host.log.gz | `cargo run -- --ci host`: 103 steps green | 0 |
| proving-1..3 | `memory_floor_holds_the_controls` | 0 ×3 |
| rows.log.gz | `session_lifecycle console_image_boots kernel_objects_refused_alone` | 0 |
| t14-request.txt | `floorcase` staged at `38f3c282b` | 2, the staging-only exit |

I requested the T14 `floorcase` boot at `825114d83` in round 6, and I have not seen its result. The rebase changes the kernel paths `floorcase` covers (pipe, scheduler, IPC), so it is restaged here.
