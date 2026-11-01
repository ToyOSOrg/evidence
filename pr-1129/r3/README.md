# PR #1129 review r2 (`b89f78bee`)

- `trace-24-rounds.log` and `trace-240-rounds.log` come from temporary, uncommitted instrumentation on `1178599c4`.
  - In `Vm::exec_op`'s `Op::Wake` arm, for queue 0 and with `TMP_TRACE` set, it printed `TMPWAKE t=<clock> from=cpu<poster> server=<state>`. The state is the server's `TaskState` when it has registered on the queue, and `running(token)` when it has not, so the wake becomes a token.
  - A temporary test ran `server_of_two_llcs` at the given rounds over 40 seeds and listed the seeds that moved. It then replayed the first of them with the trace on.
  - At 24 rounds, seed 15: every wake from cpu1 found the server running (24 tokens), and the counted wakes all came from cpu9 until the move to cpu10.
  - At 240 rounds: 12 of 40 seeds move once, none twice. In the traced seed, after the move both clients' wakes find the server parked on cpu10.
- `r2-sim-filter.log`: `a_split_pair_moves_once_into_one_llc` and `a_server_with_a_client_in_each_llc_seldom_follows_them`, exit 0.
- `mutations/`: `WAKER_RUN` = 1 and 4, applied, run and reversed (`mutate.sh` on branch `pr-1111`). Both red the 240-round sweep: 100 moves and 4 moves in one run.
- `ci-host-b89f78bee.log`: `cargo run -- --ci host`, 108 steps all green, exit 0.
