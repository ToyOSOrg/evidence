# PR #1116 r5: ab4, the review-r2 head `a2fd3af47` on metal

There were three boots, each with rc=0: the T14's benchcase and testcases, and the AMD's benchcase. Each was judged with the tree at `a2fd3af47` and the staged words.

- `t14.judge.log`: `boot:benchcase wake_onto_busy`, exit 0. It reports `PASS osbench`, `PASS wake_onto_busy` and the two I219 rows, 4 of 4.
- `amd.judge.log`: `--metal-host toyos@bench-amd boot:benchcase`, exit 1. It reports `PASS osbench`. Its two reds are `i219_leaves_ulp_unarmed` and `i219_carries_netstacks_link`. Those are T14-only rows, because the AMD bench has no card ToyOS drives, and `boot:benchcase` took them in with the boot. They say nothing about this change.
- `lines/`: each boot's osbench and `wake_onto_busy` lines.
  - `wake.onto_busy` measured n=200 on both benches. It has `p50` 4.3 µs on the T14 and 18.2 µs on the AMD, with `ran_on_busy=0`.
  - `mem.munmap_touched_remote.4k` measured n=2000, with `windows_refused=0/10`.
  - Every osbench group exited 0, and no row refused.
  - `wake_onto_busy` exited 53, which by its contract is its p99 in µs.

After ab4, #1116 was restacked on #1111 without step 2 (`b0a338fe2`). That changed only the parker's mask check and its test.
