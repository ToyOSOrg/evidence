# PR 1004, the host job's budget, head 72a5452e5

GitHub (`github-*.log`): main's host job took 25 min, its `transport_loom` 151 s. #1004's was cancelled at 45 min, still in `transport_loom` 13 min after it started.

Local, one machine, one session, load average about 20, CI's dev profile:
- `loom-suite-before.log`: `d9c98d19f`'s suite, 601 s. `loom-per-model-before.txt`: each model alone; the shutdown race's death sweep alone took 460 s.
- `loom-suite-main.log`: main's, 66 s.
- `loom-suite-after.log`: this head's, 87 s.
- `ci-host.log`: `cargo run -- --ci host` at this head, exit 0, 95 steps green; the step running the loom suite took 2 min, against 12 min at `d9c98d19f`.
- `controls.txt`: each control at this head's bounds. The eight registered ones are red on their models. `transport-departure-no-pass`, `-departure-relaxed`, `-want-before-arm`, `-no-resume` and `-shut-local` are also red on the death sweeps and the shutdown race.
- `looks-bound3-deadlock.log` and `looks-bound3-trace.txt`: the looks-without-the-gate model at bound 3 before the fix, a deadlock; the trace (a replayed checkpoint, the model instrumented in a scratch copy) shows the server answering a holder's ring with `rang=false`. `looks-bound3-after-fix.log`: the same model at bound 3 after the fix, passing in 1,546 s.
