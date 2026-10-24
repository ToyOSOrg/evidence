# PR #1053, round 7: the rebase onto main 2a5b446b0, head 627073e6b

| check | command | exit | log |
|---|---|---|---|
| UDP receive timeouts, sub-millisecond and zero, on main's datagram sockets | `cargo test --test toyos-build -- udp_receive_times_out` | 0 | logs/guest-udp-timeout-4.log |
| ToyOS image | `cargo run -- --build-only --boot-config tests/images/benchcase.toml` | 0 | logs/build-benchcase-rebase.log |
| Linux osbench | `cargo +nightly-2026-07-22 build -p osbench --target x86_64-unknown-linux-musl --profile toyos` | 0 | logs/build-linux-rebase.log |
| host checks | `cargo run -- --ci host` | 0, 103 steps | logs/ci-host-7.log |

All four ran at 627073e6b (logs/rebase.rev).

**What the rebase changed:**
- Main's #1052 replaced netstack's datagram sockets, so this branch's netstack, SDK and libc changes are
  dropped for main's. std's receive now waits with the read timeout and honours non-blocking, and a timeout
  reads `WouldBlock`. The guest test asserts that.
- Kept: the zero refusal and the sub-millisecond clamp in std's timeout conversion, the guest test, and the
  closure of `issues/std-udp-socket-ignores-its-timeouts.md`.
- Dropped: `issues/std-udp-socket-set-nonblocking-does-nothing.md`, which main fixes.
- Every other file's change is identical to the pre-rebase branch's.
