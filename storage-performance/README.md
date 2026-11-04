# Native DATA engine performance (#1152, 2026-11-04)

Branch `codex/storage-consolidation`. Change: `94fdd7faa` ("bcachefs: an ordinary
transaction's keys go into the nodes it holds"), on `164f391a5`. Main baseline:
`7835695065af631e927496272bd9e0dc4de946d6`. Host: macOS, aarch64, release builds.

## Harness (`harness/`, not committed)

`common.rs` plus `setup-main.rs` or `setup-native.rs` make
`system/fileserver/tests/perf.rs` in an exported tree of each revision. It is the
root-cause agent's tenth-scale osbench `persist` + `fs.disk` call sequence
(evidence `data-mixed-volume/main-replay/osbench_replay.rs`), timed per phase,
through `DataVolume` on a sparse in-memory model of the T14's 170 GiB DATA
(44,564,480 blocks). No device latency; flush is free: what it measures is CPU.
Command: `cargo test --release -p fileserver --test perf -- --nocapture`.

## Results (TOTAL osbench, seconds)

| revision | total | log |
|---|---|---|
| main 7835695 (private format) | 0.47 | runs/run-main-1.log |
| 164f391a5, partial first fix, instrumented | ~500 (stopped before seq) | runs/run-proto2-stats.log |
| in-design fixes (overlay, queues, compaction, accounting merge) | 22.8 | runs/run-fix5-1.log |
| + levelled runs (<= 3 per lookup) | 16.4 (main 0.476 alongside) | runs/run-level-1.log |
| eager prototype (perf/eager-only.patch on the in-design fixes) | 8.0 | runs/run-eager-1.log |
| final, 94fdd7faa's tree | 7.3, back to back with main 0.46 | runs/run-direct-1.log |

Host load varied during the day (load average 10 to 47); each comparison above that
matters was run back to back with main.

`run-proto2-stats.log` holds the counters that located the defect: on this
geometry pending reached 326k live entries; persist alone made 131,771
accounting sums over 1.68e9 entries and 672 `durable` calls scanning 70e6.

## The remainder

Final run, per phase against main: metadata rows at or under main (rename x2100
0.021 s vs 0.057 s; mkdir/rmdir x1050 0.023 vs 0.030; 1000 entries 0.036 vs
0.042). The rest is data writes (persist 1.44 s; the 64 MiB sequential rows
9.4 s). Profile (`sample`, final tree): memmove of node key inserts, journal
space reservation, the overlay over reclaim's pending updates in alloc/LRU/
backpointer btrees, the file server's write-back cache. Each data write updates
extents, inode, alloc, backpointers, LRU, freespace and accounting.

## Negative controls (`controls/`)

`run.py` applies each mutation in `mutations.py` to the worktree, runs its test
filter, and restores the file in the same run; `controls.txt` is its output, one
log per mutation. All red but `d-truncation-restarts-at-end`, which showed the
truncation cursor redundant once deletions land in nodes: the cursor and its
test were removed before the commit.

## Engine suite and host CI at the committed tree

`logs/bcachefs-final.log`: `cargo test --release -p bcachefs`, exit 0, 186 passed.
`cargo clippy -p bcachefs --lib --no-default-features -- -D warnings`: exit 0.
`logs/host-final.log`: `cargo run -- --ci host`, exit 0, 109 steps green (the
tree it built compared identical to the committed diff).

## Round 5 (45283fbc5): write-back by extent; the served path's lookups

- `served-path/`: where a DATA stat and open spent their time, measured on a QEMU/KVM
  probe before the fix, after its first cut and after the final one.
- `runs/run-final2-{native,main}.log`: the harness and micro rows at 45283fbc5 and
  main 7835695, back to back: harness 4.45 s vs 0.61 s; stat 0.64 vs 0.16 us;
  open_close 1.14 vs 6.20 us; seq write 1 MiB calls 0.80 vs 0.23 ms/MiB.
- `controls-round5/`: each mutation applied, run and restored by `run.py`: the
  unwritten blocks leaked, runs of one block, whole-run allocations closing the
  bucket (timeout), no bound on old extents per transaction, the refused suffix
  reported from 0, names never forgotten, and the idle publication member at its
  new construction: each red.
- `logs/host-45283fbc5.log`: `cargo run -- --ci host`, exit 0, 108 steps.
