# #1057, round 8: the rebase review's fixes, the 22 rows, and the T14 boot at `38f3c282b`

The head is `4bfe7e489`, one comment and one issue sentence past `38f3c282b`. Paths are masked: `<worktree>`, `<judge-tree>` for the coordinator's checkout, `<scratch>`, `<home>`.

## T14 `floorcase` at `38f3c282b` (the coordinator's run): passed

`t14-floorcase-38f3c282b/` holds `kernel.log`, `loader.log`, `boot.txt`, `verdict.txt`, the image's `system` manifest and `judge-f.log`, masked.
- `memory_floor` passed, 1 of 1, and the greedy job held 15 604 MiB.
- The floor jobs at the end of boot:

| job | holds | peak | floor |
|---|---|---|---|
| supervisor | 36.9 MiB | 38.9 MiB | 64 MiB |
| logkeeper | 20.6 MiB | 20.6 MiB | 32 MiB |
| ps2server | 11.3 MiB | 11.3 MiB | 24 MiB |
| test-runner | 15.5 MiB | 17.5 MiB | 64 MiB |

The partition signatures in `loader.log` are per-build random GUIDs.

## The 22 QEMU rows at `4bfe7e489`

| file | command | exit |
|---|---|---|
| rows.log.gz | the 22-row filter (`logs/rows.txt`), its first run, with every build cold | 1: 21 passed; `session_lifecycle` stalled at "waiting for the shell to detach the holder" |
| session-1..3 | `session_lifecycle` alone, three times | 0 ×3 |
| rows-2.log.gz | the 22-row filter again | 0: 22 passed |

About the red:
- The guest's last line was the supervisor's launcher saying "no row declares /pholder". The shell had received `detach /pholder` where `detach /system/bin/hangupholder` was typed, so keys typed through QMP were lost.
- `sessioncase.toml` declares no floors, and memory was not short.
- The run was building every image in parallel at the time: 2471 s of build work across the workers.
- I have not established the cause. It is recorded here as unrelated to this change: input loss under host load, on an image this PR's floors do not touch.

The 88-member shared sweep was last run before the rebase, at `c06cc695e`, and is labelled so.
