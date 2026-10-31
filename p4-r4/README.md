# #1106 round 4: the link's loom control reaches its verdict

The merge queue (run 40782639843, host-part (models)) found no FAILED line for
`mutate-want-relaxed`: loom's coroutine overflowed its stack on the Linux
runner and the test binary aborted. Home and worktree paths are masked.

| Log | Command | Revision | Exit |
|---|---|---|---|
| mut-local-1.log | `cargo test -p toyos-link --features mutate-want-relaxed --test ends_loom -- --exact a_full_ring_is_never_left_asleep_on_room_it_has` | 4864cf789 (before) | 101; the FAILED line printed, then `coroutine ... has overflowed its stack` |
| mut-inline-probe.log | same, the page shared by `Rc` but built inline (probe, not committed) | 4864cf789 + probe | 101; still overflows |
| mut-local-3.log | same | 68079356b's test file | 101; FAILED and `deadlock`, no overflow, no abort |
| plain-local-3.log | `cargo test -p toyos-link --test ends_loom` | 68079356b's test file | 0 |
| ci-host-1.log | `cargo run -- --ci host` | 68079356b on origin/main 0c7e62ca7 | 0; 107 steps; `control mutate-want-relaxed: 1 verdict(s) reached` |

| mut-local-2.log | same, loom's `Arc` kept and the page built on the heap (probe, not committed) | 4864cf789 + probe | 101 (SIGABRT): no overflow, then `panic in a destructor during cleanup` through `loom::sync::Arc`'s drop (issues/loom-arc-panics-in-its-drop-while-a-failed-model-unwinds.md) |
