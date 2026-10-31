# #1121 (IPC phase 2), head 2269ea100

On #1108 `18060b521` (main `f45dc5e3b`) and the scheduler's `b24b37a56`
(cherry-picked as `4fc78ac97`). C1 `245f7b9af` is whole messages, C2
`2269ea100` the call.

| log | what | tree | exit |
|---|---|---|---|
| ci-p2-2.log | `cargo run -- --ci host` | 2269ea100 | 0, 107/107 |
| ci-p2.log | `cargo run -- --ci host` | 8fb61777d | 0, 107/107 |
| qemu-p2-1.log | 16 QEMU registrations (listed in the PR) | 455a1822e | 1: 15/16, `stream_holders` red |
| qemu-p2-2.log | `stream_holders` | 455a1822e + its test's fix (= 8fb61777d's tree) | 0 |
| controls/*.log | one mutation each (`controls/mutate.py`), its tests, restored | 8fb61777d / 2269ea100 | each 101 (red, as required) |
| metal/*-prep.log | `cargo test --test toyos-build -- --metal --metal-readback <dir> <rows>` | per log's first line | 2 (staged, machine untouched) |

`ci-p2.log` predates three changes: the random queue test's fit assertion (which
q3's second run is the control for), `toyos::net`'s `response` and `status`, and
guest-test fixes. `ci-p2-2.log` is at the head.

`stream_holders`' red at 455a1822e is its own guest test reading a connection
with a plain `read`, which this change refuses: the test takes a message now.
The other fifteen ran on a tree that differs from the head's only in guest
test files they do not build.

`metal/profile.patch` and `metal/ipcsplit.applied.rs` are the measurement-only
profile build (diary marks in the send, receive, call and inbox bodies and an
osbench group that splits them), never committed. `metal/request.txt` is the
run request; `metal/image-sha256.txt` the staged images.
